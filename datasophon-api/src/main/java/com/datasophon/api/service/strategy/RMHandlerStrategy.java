package com.datasophon.api.service.strategy;

import com.datasophon.api.utils.ProcessUtils;
import com.datasophon.api.utils.SpringTool;
import com.datasophon.common.Constants;
import com.datasophon.common.cache.CacheUtils;
import com.datasophon.common.model.ServiceConfig;

import java.util.List;
import java.util.Map;

public class RMHandlerStrategy implements ServiceRoleStrategy{
    @Override
    public void handler(Integer clusterId,List<String> hosts) {

        Map<String,String> globalVariables = (Map<String, String>) CacheUtils.get("globalVariables"+ Constants.UNDERLINE+clusterId);

        ProcessUtils.generateClusterVariable(globalVariables, clusterId,"${rm1}",hosts.get(0));
        ProcessUtils.generateClusterVariable(globalVariables, clusterId,"${rm2}",hosts.get(1));
        ProcessUtils.generateClusterVariable(globalVariables, clusterId,"${rmHost}",String.join(",",hosts));

    }

    @Override
    public void handlerConfig(Integer clusterId, List<ServiceConfig> list) {

    }

    @Override
    public void getConfig(Integer clusterId, List<ServiceConfig> list) {

    }

}
