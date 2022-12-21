/*
 *  Licensed to the Apache Software Foundation (ASF) under one or more
 *  contributor license agreements.  See the NOTICE file distributed with
 *  this work for additional information regarding copyright ownership.
 *  The ASF licenses this file to You under the Apache License, Version 2.0
 *  (the "License"); you may not use this file except in compliance with
 *  the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 *
 */

package com.datasophon.api.master.alert;

import akka.actor.UntypedActor;
import cn.hutool.http.HttpUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.datasophon.api.service.ClusterAlertHistoryService;
import com.datasophon.api.service.ClusterServiceInstanceService;
import com.datasophon.api.utils.SpringTool;
import com.datasophon.api.service.ClusterServiceRoleInstanceService;
import com.datasophon.common.Constants;
import com.datasophon.common.command.ServiceRoleCheckCommand;
import com.datasophon.dao.entity.ClusterAlertHistory;
import com.datasophon.dao.entity.ClusterServiceInstanceEntity;
import com.datasophon.dao.entity.ClusterServiceRoleInstanceEntity;
import com.datasophon.dao.enums.AlertLevel;
import com.datasophon.dao.enums.ServiceRoleState;
import com.datasophon.dao.enums.ServiceState;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class ServiceRoleCheckActor extends UntypedActor {

    private static final String promQl = "up{job=\"{}\",instance=\"{}.{}\"}";


    /**
     * 1、查询所有服务角色
     * 2、遍历服务角色，查询对应prometheus上服务角色状态
     * 3、服务状态若有变更，则更新到数据库
     *
     * @param msg
     * @throws Throwable
     */
    @Override
    public void onReceive(Object msg) throws Throwable {
        if (msg instanceof ServiceRoleCheckCommand) {//定时检测prometheus和alertmanager
            ClusterServiceRoleInstanceService roleInstanceService = SpringTool.getApplicationContext().getBean(ClusterServiceRoleInstanceService.class);

            List<ClusterServiceRoleInstanceEntity> list = roleInstanceService.list(new QueryWrapper<ClusterServiceRoleInstanceEntity>()
                    .in(Constants.SERVICE_ROLE_NAME, "Prometheus", "AlertManager"));
            if (Objects.nonNull(list) && list.size() > 0) {
                for (ClusterServiceRoleInstanceEntity roleInstanceEntity : list) {
                    if("Prometheus".equals(roleInstanceEntity.getServiceRoleName())){
                        String url = "http://"+roleInstanceEntity.getHostname()+":9090";
                        try {
                            HttpUtil.get(url);
                            //恢复告警
                            recoverAlert(roleInstanceEntity,roleInstanceService);
                        }catch (Exception e){
                            saveAlert(roleInstanceEntity,roleInstanceService);
                        }
                    }
                    if("AlertManager".equals(roleInstanceEntity.getServiceRoleName())){
                        String url = "http://"+roleInstanceEntity.getHostname()+":9093";
                        try {
                            HttpUtil.get(url);
                            recoverAlert(roleInstanceEntity,roleInstanceService);
                        }catch (Exception e){
                            //产生告警
                            saveAlert(roleInstanceEntity,roleInstanceService);

                        }
                    }

                }
            }
        } else {
            unhandled(msg);
        }
    }

    private void recoverAlert(ClusterServiceRoleInstanceEntity roleInstanceEntity, ClusterServiceRoleInstanceService roleInstanceService) {
        ClusterAlertHistoryService alertHistoryService = SpringTool.getApplicationContext().getBean(ClusterAlertHistoryService.class);
        ClusterAlertHistory clusterAlertHistory = alertHistoryService.getOne(new QueryWrapper<ClusterAlertHistory>()
                .eq(Constants.ALERT_TARGET_NAME, roleInstanceEntity.getServiceRoleName()+"进程存活")
                .eq(Constants.CLUSTER_ID, roleInstanceEntity.getClusterId())
                .eq(Constants.HOSTNAME,roleInstanceEntity.getHostname())
                .eq(Constants.IS_ENABLED,1));
        if(Objects.nonNull(clusterAlertHistory)){
            clusterAlertHistory.setIsEnabled(2);
            alertHistoryService.updateById(clusterAlertHistory);
        }
        //更改服务角色实例状态
        if(roleInstanceEntity.getServiceRoleState() != ServiceRoleState.RUNNING){
            roleInstanceEntity.setServiceRoleState(ServiceRoleState.RUNNING);
            roleInstanceService.updateById(roleInstanceEntity);
        }
    }

    private void saveAlert(ClusterServiceRoleInstanceEntity roleInstanceEntity,ClusterServiceRoleInstanceService roleInstanceService) {
        ClusterAlertHistoryService alertHistoryService = SpringTool.getApplicationContext().getBean(ClusterAlertHistoryService.class);
        ClusterServiceInstanceService serviceInstanceService = SpringTool.getApplicationContext().getBean(ClusterServiceInstanceService.class);
        ClusterAlertHistory clusterAlertHistory = alertHistoryService.getOne(new QueryWrapper<ClusterAlertHistory>()
                .eq(Constants.ALERT_TARGET_NAME, roleInstanceEntity.getServiceRoleName()+"进程存活")
                .eq(Constants.CLUSTER_ID, roleInstanceEntity.getClusterId())
                .eq(Constants.HOSTNAME,roleInstanceEntity.getHostname())
                .eq(Constants.IS_ENABLED,1));

        ClusterServiceInstanceEntity serviceInstanceEntity = serviceInstanceService.getById(roleInstanceEntity.getServiceId());
        if(Objects.isNull(clusterAlertHistory)){
            clusterAlertHistory = new ClusterAlertHistory();
            clusterAlertHistory.setClusterId(roleInstanceEntity.getClusterId());
            if("Prometheus".equals(roleInstanceEntity.getServiceRoleName())){
                clusterAlertHistory.setAlertGroupName("prometheus");
                clusterAlertHistory.setAlertTargetName("Prometheus进程存活");
            }
            if("AlertManager".equals(roleInstanceEntity.getServiceRoleName())){
                clusterAlertHistory.setAlertGroupName("alertmanager");
                clusterAlertHistory.setAlertTargetName("AlertManager进程存活");
            }
            clusterAlertHistory.setCreateTime(new Date());
            clusterAlertHistory.setUpdateTime(new Date());
            clusterAlertHistory.setAlertLevel(AlertLevel.EXCEPTION);
            clusterAlertHistory.setAlertInfo("");
            clusterAlertHistory.setAlertAdvice("重新启动");
            clusterAlertHistory.setHostname(roleInstanceEntity.getHostname());
            clusterAlertHistory.setIsEnabled(1);

            clusterAlertHistory.setServiceInstanceId(roleInstanceEntity.getServiceId());

            alertHistoryService.save(clusterAlertHistory);
        }
        //更改服务实例状态
        serviceInstanceEntity.setServiceState(ServiceState.EXISTS_EXCEPTION);
        serviceInstanceService.updateById(serviceInstanceEntity);

        roleInstanceEntity.setServiceRoleState(ServiceRoleState.STOP);
        roleInstanceService.updateById(roleInstanceEntity);

    }
}
