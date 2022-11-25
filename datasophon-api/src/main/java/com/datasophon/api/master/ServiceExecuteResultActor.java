package com.datasophon.api.master;

import akka.actor.ActorRef;
import akka.actor.UntypedActor;
import com.datasophon.api.utils.ProcessUtils;
import com.datasophon.common.cache.CacheUtils;
import com.datasophon.common.command.SubmitActiveTaskNodeCommand;
import com.datasophon.common.enums.ServiceExecuteState;
import com.datasophon.common.enums.ServiceRoleType;
import com.datasophon.common.model.DAGGraph;
import com.datasophon.common.model.ServiceExecuteResultMessage;
import com.datasophon.common.model.ServiceNode;
import com.datasophon.common.model.ServiceRoleInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;
import java.util.Map;
import java.util.Set;

public class ServiceExecuteResultActor extends UntypedActor {

    private static final Logger logger = LoggerFactory.getLogger(ServiceExecuteResultActor.class);

    @Override
    public void onReceive(Object message) throws Throwable {
        if (message instanceof ServiceExecuteResultMessage) {
            ServiceExecuteResultMessage result = (ServiceExecuteResultMessage) message;

            DAGGraph<String, ServiceNode, String> dag = result.getDag();
            Map<String, ServiceExecuteState> activeTaskList = result.getActiveTaskList();
            Map<String, String> errorTaskList = result.getErrorTaskList();
            Map<String, String> readyToSubmitTaskList = result.getReadyToSubmitTaskList();
            Map<String, String> completeTaskList = result.getCompleteTaskList();
            ActorRef submitTaskNodeActor = (ActorRef) CacheUtils.get("submitTaskNodeActor");
            String node = result.getServiceName();
            ServiceNode servicNode = dag.getNode(node);
            if (result.getServiceRoleType().equals(ServiceRoleType.MASTER)) {
                if (result.getServiceExecuteState().equals(ServiceExecuteState.ERROR)) {
                    //该节点master角色操作失败，移动到error列表
                    errorTaskList.put(node, "");
                    activeTaskList.remove(node);
                    readyToSubmitTaskList.remove(node);
                    completeTaskList.put(node, "");
                    //更改指令执行状态，依赖该节点的下游服务指令状态改为取消
                    logger.info("{} master roles failed , cancel all next node by hostCommandId {}",node,servicNode.getMasterRoles().get(0).getHostCommandId());
                    String hostCommandId = servicNode.getMasterRoles().get(0).getHostCommandId();
                    ProcessUtils.updateCommandStateToFailed( hostCommandId);
                } else if (result.getServiceExecuteState().equals(ServiceExecuteState.SUCCESS)) {
                    //该节点master角色指令执行完毕，开始执行worker节点操作
                    ServiceNode serviceNode = dag.getNode(node);
                    List<ServiceRoleInfo> elseRoles = serviceNode.getElseRoles();
                    if (elseRoles.size() > 0) {
                        logger.info("start to submit worker/client roles");
                        for (ServiceRoleInfo elseRole : serviceNode.getElseRoles()) {
                            ActorRef serviceActor = ActorUtils.getLocalActor(WorkerServiceActor.class, result.getClusterCode() + "-serviceActor-" + node+"-"+elseRole.getHostname());
                            ProcessUtils.buildExecuteServiceRoleCommand(
                                    result.getClusterId(),
                                    result.getCommandType(),
                                    result.getClusterCode(),
                                    dag,
                                    activeTaskList,
                                    errorTaskList,
                                    readyToSubmitTaskList,
                                    completeTaskList,
                                    node,
                                    serviceNode.getElseRoles(),
                                    elseRole,
                                    serviceActor,
                                    ServiceRoleType.WORKER);
                        }

                    } else {
                        activeTaskList.remove(node);
                        readyToSubmitTaskList.remove(node);
                    }
                    logger.info("start to submit next node");
                    tellToSubmitActiveTaskNode(result, dag, activeTaskList, errorTaskList, readyToSubmitTaskList, completeTaskList, submitTaskNodeActor,node);
                }
            }
        } else {
            unhandled(message);
        }
    }

    private void tellToSubmitActiveTaskNode(ServiceExecuteResultMessage result,
                                            DAGGraph<String, ServiceNode, String> dag,
                                            Map<String, ServiceExecuteState> activeTaskList,
                                            Map<String, String> errorTaskList,
                                            Map<String, String> readyToSubmitTaskList,
                                            Map<String, String> completeTaskList,
                                            ActorRef submitTaskNodeActor,
                                            String node) {
        Set<String> subsequentNodes = dag.getSubsequentNodes(node);
        logger.info("{}'s subsequent nodes is {}", node , subsequentNodes.toString());
        for (String subsequentNode : subsequentNodes) {
            readyToSubmitTaskList.put(subsequentNode, "");
        }
        SubmitActiveTaskNodeCommand submitActiveTaskNodeCommand = new SubmitActiveTaskNodeCommand();
        submitActiveTaskNodeCommand.setCommandType(result.getCommandType());
        submitActiveTaskNodeCommand.setDag(dag);
        submitActiveTaskNodeCommand.setClusterId(result.getClusterId());
        submitActiveTaskNodeCommand.setActiveTaskList(activeTaskList);
        submitActiveTaskNodeCommand.setErrorTaskList(errorTaskList);
        submitActiveTaskNodeCommand.setReadyToSubmitTaskList(readyToSubmitTaskList);
        submitActiveTaskNodeCommand.setCompleteTaskList(completeTaskList);

        submitActiveTaskNodeCommand.setClusterCode(result.getClusterCode());

        submitTaskNodeActor.tell(submitActiveTaskNodeCommand, getSelf());
    }


}
