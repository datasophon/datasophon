/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : datasophon

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 03/11/2022 17:57:56
*/

CREATE DATABASE IF NOT EXISTS datasophon DEFAULT CHARACTER SET utf8;
grant all privileges on *.* to datasophon@"%" identified by 'datasophon' with grant option;
GRANT ALL PRIVILEGES ON *.* TO 'datasophon'@'%';
FLUSH PRIVILEGES;
/*
 Navicat MySQL Data Transfer

 Source Server         : 172.31.96.16
 Source Server Type    : MySQL
 Source Server Version : 50568
 Source Host           : 172.31.96.16:3306
 Source Schema         : datasophon_ddp4

 Target Server Type    : MySQL
 Target Server Version : 50568
 File Encoding         : 65001

 Date: 06/01/2023 16:28:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_ddh_access_token
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_access_token`;
CREATE TABLE `t_ddh_access_token`  (
                                       `id` int(10) NOT NULL,
                                       `user_id` int(10) NULL DEFAULT NULL,
                                       `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                       `create_time` datetime NULL DEFAULT NULL,
                                       `update_time` datetime NULL DEFAULT NULL,
                                       `expire_time` datetime NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ddh_access_token
-- ----------------------------
INSERT INTO `t_ddh_access_token` VALUES (0, 1, 'test', '2022-06-15 09:51:54', '2022-06-15 09:51:57', '2023-01-01 09:51:59');

-- ----------------------------
-- Table structure for t_ddh_alert_group
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_alert_group`;
CREATE TABLE `t_ddh_alert_group`  (
                                      `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                      `alert_group_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
                                      `alert_group_category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
                                      `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_alert_group
-- ----------------------------
INSERT INTO `t_ddh_alert_group` VALUES (1, 'HIVE?????????', 'HIVE', '2022-07-14 15:52:45');
INSERT INTO `t_ddh_alert_group` VALUES (2, 'HDFS?????????', 'HDFS', '2022-07-14 15:52:47');
INSERT INTO `t_ddh_alert_group` VALUES (3, 'YARN?????????', 'YARN', '2022-07-14 15:52:50');
INSERT INTO `t_ddh_alert_group` VALUES (8, 'HBASE?????????', 'HBASE', '2022-07-14 15:52:52');
INSERT INTO `t_ddh_alert_group` VALUES (10, 'KAFKA?????????', 'KAFKA', '2022-07-14 15:52:57');
INSERT INTO `t_ddh_alert_group` VALUES (11, '???????????????', 'NODE', '2022-07-14 15:52:59');
INSERT INTO `t_ddh_alert_group` VALUES (12, 'ZOOKEEPER?????????', 'ZOOKEEPER', '2022-07-14 15:53:02');
INSERT INTO `t_ddh_alert_group` VALUES (13, 'ALERTMANAGER?????????', 'ALERTMANAGER', '2022-07-14 15:53:05');
INSERT INTO `t_ddh_alert_group` VALUES (14, 'GRAFANA?????????', 'GRAFANA', '2022-07-14 15:53:07');
INSERT INTO `t_ddh_alert_group` VALUES (15, 'PROMETHEUS?????????', 'PROMETHEUS', '2022-07-14 15:53:09');
INSERT INTO `t_ddh_alert_group` VALUES (16, 'SPARK?????????', 'SPARK3', '2022-07-15 14:12:38');
INSERT INTO `t_ddh_alert_group` VALUES (17, 'TRINO?????????', 'TRINO', '2022-07-24 23:23:01');
INSERT INTO `t_ddh_alert_group` VALUES (18, 'RANGER?????????', 'RANGER', '2022-09-09 11:29:14');
INSERT INTO `t_ddh_alert_group` VALUES (19, 'STARROCKS?????????', 'STARROCKS', '2022-09-13 14:53:57');
INSERT INTO `t_ddh_alert_group` VALUES (20, 'ELASTICSEARCH?????????', 'ELASTICSEARCH', '2022-10-08 16:15:55');

-- ----------------------------
-- Table structure for t_ddh_cluster_alert_expression
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_alert_expression`;
CREATE TABLE `t_ddh_cluster_alert_expression`  (
                                                   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '?????? ID',
                                                   `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                   `expr` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????????????????',
                                                   `service_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                   `value_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????  BOOL  INT  FLOAT  ',
                                                   `is_predefined` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
                                                   `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????????????',
                                                   `is_delete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                   `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                   `update_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134002 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????????' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ddh_cluster_alert_expression
-- ----------------------------
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101001, '?????????????????????(%)', '(1-(node_memory_MemAvailable_bytes/(node_memory_MemTotal_bytes)))*100', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101002, '??????CPU?????????(%)', '(1-avg(irate(node_cpu_seconds_total{mode=\"idle\"}[5m]))by(instance))*100', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101003, '??????CPU???????????????(%)', 'avg(irate(node_cpu_seconds_total{mode=\"system\"}[5m]))by(instance)*100', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101004, '??????CPU???????????????(%)', 'avg(irate(node_cpu_seconds_total{mode=\"user\"}[5m]))by(instance)*100', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101005, '????????????IO?????????(%)', 'avg(irate(node_cpu_seconds_total{mode=\"iowait\"}[5m]))by(instance)*100', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101006, '???????????????????????????(%)', '(1-((node_memory_SwapFree_bytes+1)/(node_memory_SwapTotal_bytes+1)))*100', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101007, '?????????????????????(%)', '(node_filesystem_size_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"}-node_filesystem_free_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"})*100/(node_filesystem_avail_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"}+(node_filesystem_size_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"}-node_filesystem_free_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"}))', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101008, '??????????????????', 'irate(node_network_receive_bytes_total[5m])*8', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101009, '??????????????????', 'irate(node_network_transmit_bytes_total[5m])*8', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101010, '??????????????????[1m]', 'node_load1', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101011, '??????????????????[5m]', 'node_load5', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101012, '??????????????????[15m]', 'node_load15', 'NODE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101013, 'Ntp????????????', 'cluster_basic_isNtpServiceAlive', 'NODE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (101014, 'Ntp????????????', 'cluster_basic_isNtpClockSyncNormal', 'NODE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (102001, 'AlertManager????????????', 'alertmanager_isAlertmanagerProcessAlive', 'ALERTMANAGER', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (103001, 'Elasticsearch????????????', 'Elastic_isEsProcessAlive', 'ELASTICSEARCH', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (103002, 'ElasticsearchCPU?????????(%)', 'es_os_cpu_percent{job=\"ELASTICSEARCH-ElasticSearch\"}', 'ELASTICSEARCH', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (103003, 'Elasticsearch???????????????(%)', 'es_os_mem_used_percent', 'ELASTICSEARCH', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (103004, 'Elasticsearch???????????????(%)', '100-es_fs_path_available_bytes*100/es_fs_path_total_bytes', 'ELASTICSEARCH', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (104001, 'FlinkHistoryServer????????????', 'up{job=\"FLINK-FlinkHistoryServer\"}', 'FLINK', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (105001, 'Grafana????????????', 'grafana_isGrafanaProcessAlive', 'GRAFANA', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (106001, 'HBaseMaster????????????', 'hbase_isHMasterProcessAlive', 'HBASE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (106002, 'HRegionServer????????????', 'hbase_isHRegionServerProcessAlive', 'HBASE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (106003, 'HThriftServer????????????', 'hbase_isHThriftServerProcessAlive', 'HBASE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107001, 'NameNode????????????', 'hdfs_isNameNodeProcessAlive', 'HDFS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107002, 'NameNodeRPC??????[5m]', 'avg_over_time(Hadoop_NameNode_RpcProcessingTimeAvgTime{job=\"HDFS-NameNode\"}[5m])', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107003, 'NameNodeRPC??????[15m]', 'avg_over_time(Hadoop_NameNode_RpcProcessingTimeAvgTime{job=\"HDFS-NameNode\"}[15m])', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107004, 'NameNode??????????????????(%)', 'java_lang_Memory_HeapMemoryUsage_used{job=\"HDFS-NameNode\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"HDFS-NameNode\"}', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107005, 'NameNode?????????GC????????????[5m]', 'avg_over_time(Hadoop_NameNode_GcTimeMillisConcurrentMarkSweep{job=\"HDFS-NameNode\"}[5m])/(5*60*1000)', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107006, 'NameNode?????????GC????????????[5m]', 'avg_over_time(Hadoop_NameNode_GcTimeMillisParNew{job=\"HDFS-NameNode\"}[5m])/(5*60*1000)', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107007, 'NameNodeGC????????????[5m]', 'avg_over_time(Hadoop_NameNode_GcTimeMillis{job=\"HDFS-NameNode\"}[5m])/(5*60*1000)', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107008, 'DataNode????????????', 'hdfs_isDataNodeProcessAlive', 'HDFS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107009, 'DataNodeRPC[5m]', 'avg_over_time(Hadoop_DataNode_RpcProcessingTimeAvgTime{job=\"HDFS-DataNode\"}[5m])', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107010, 'DataNodeRPC[15m]', 'avg_over_time(Hadoop_DataNode_RpcProcessingTimeAvgTime{job=\"HDFS-DataNode\"}[15m])', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107011, 'DataNode??????????????????(%)', 'java_lang_Memory_HeapMemoryUsage_used{job=\"HDFS-DataNode\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"HDFS-DataNode\"}', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107012, 'DataNode?????????GC????????????[5m]', 'avg_over_time(Hadoop_DataNode_GcTimeMillisConcurrentMarkSweep{job=\"HDFS-DataNode\"}[5m])/(5*60*1000)', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107013, 'DataNode?????????GC????????????[5m]', 'avg_over_time(Hadoop_DataNode_GcTimeMillisParNew{job=\"HDFS-DataNode\"}[5m])/(5*60*1000)', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107014, 'DataNodeGC????????????[5m]', 'avg_over_time(Hadoop_DataNode_GcTimeMillis{job=\"HDFS-DataNode\"}[5m])/(5*60*1000)', 'HDFS', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107015, 'JournalNode????????????', 'hdfs_isJournalNodeProcessAlive', 'HDFS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107016, 'ZKFailoverController????????????', 'hdfs_isDFSZKFCProcessAlive', 'HDFS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107017, 'HttpFs????????????', 'supplement_isHttpFsServerProcessNormal', 'HDFS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107018, 'HDFS??????', 'Hadoop_NameNode_VolumeFailuresTotal{name=\"FSNamesystem\"}', 'HDFS', 'INT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (107019, 'HDFS?????????', 'Hadoop_NameNode_MissingBlocks{name=\"FSNamesystem\"}', 'HDFS', 'INT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (108001, 'HiveServer2????????????', 'hive_isHiveServer2ProcessAlive', 'HIVE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (108002, 'HiveServer2??????????????????(%)', 'java_lang_Memory_HeapMemoryUsage_used{job=\"HIVE-HiveServer2\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"HIVE-HiveServer2\"}', 'HIVE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (108003, 'HiveServer2?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"HIVE-HiveServer2\",name=\"PS MarkSweep\"}[5m])/(5*60*1000)', 'HIVE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (108004, 'HiveServer2?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"HIVE-HiveServer2\",name=\"PS Scavenge\"}[5m])/(5*60*1000)', 'HIVE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (108005, 'HiveMetastore????????????', 'hive_isHiveMetaStoreProcessAlive', 'HIVE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (108006, 'HiveMetastore??????????????????(%)', 'java_lang_Memory_HeapMemoryUsage_used{job=\"HIVE-MetaStore\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"HIVE-MetaStore\"}', 'HIVE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (108007, 'HiveMetastore?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"HIVE-MetaStore\",name=\"PS MarkSweep\"}[5m])/(5*60*1000)', 'HIVE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (108008, 'HiveMetastore?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"HIVE-MetaStore\",name=\"PS Scavenge\"}[5m])/(5*60*1000)', 'HIVE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (108009, 'MySQL????????????', 'hive_isMysqlProcessAlive', 'HIVE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (109001, 'HueServer????????????', 'hue_isHueProcessAlive', 'HUE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (110001, 'InfluxDB????????????', 'supplement_isInfluxDBProcessAlive', 'INFLUXDB', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (111001, 'KafkaEagle????????????', 'KafkaEagle_isKafkaEagleProcessAlive', 'KAFKAEAGLE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (112001, 'Kibana????????????', 'kibana_isKibanaProcessAlive', 'KIBANA', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (113001, 'KylinServer????????????', 'up{job=\"KYLIN-KylinServer\"}', 'KYLIN', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (113002, 'KylinServer??????????????????(%)', 'java_lang_Memory_HeapMemoryUsage_used{job=\"KYLIN-KylinServer\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"KYLIN-KylinServer\"}', 'KYLIN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (113003, 'KylinServer?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"KYLIN-KylinServer\",name=\"ConcurrentMarkSweep\"}[5m])/(5*60*1000)', 'KYLIN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (113004, 'KylinServer?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"KYLIN-KylinServer\",name=\"ParNew\"}[5m])/(5*60*1000)', 'KYLIN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (114001, 'LivyServer????????????', 'up{job=\"LIVY-LivyServer\"}', 'LIVY', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (114002, 'LivyServer??????????????????(%)', 'java_lang_Memory_HeapMemoryUsage_used{job=\"LIVY-LivyServer\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"LIVY-LivyServer\"}', 'LIVY', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (114003, 'LivyServer?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"LIVY-LivyServer\",name=\"PS MarkSweep\"}[5m])/(5*60*1000)', 'LIVY', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (114004, 'LivyServer?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"LIVY-LivyServer\",name=\"PS Scavenge\"}[5m])/(5*60*1000)', 'LIVY', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (115001, 'NodeExporter????????????', 'up{job=\"NODEEXPORTER-NodeExporter\"}', 'NODEEXPORTER', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (116001, 'OozieServer????????????', 'up{job=\"OOZIE-OozieServer\"}', 'OOZIE', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (116002, 'OozieServer??????????????????(%)', 'java_lang_Memory_HeapMemoryUsage_used{job=\"OOZIE-OozieServer\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"OOZIE-OozieServer\"}', 'OOZIE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (116003, 'OozieServer?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"OOZIE-OozieServer\",name=\"PS MarkSweep\"}[5m])/(5*60*1000)', 'OOZIE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (116004, 'OozieServer?????????GC????????????[5m]', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"OOZIE-OozieServer\",name=\"PS Scavenge\"}[5m])/(5*60*1000)', 'OOZIE', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (117001, 'Prometheus????????????', 'up{job=\"prometheus\"}', 'PROMETHEUS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (118001, 'RangerServer????????????', 'up{job=\"RANGER-RangerAdmin\"}', 'RANGER', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (119001, 'SparkHistoryServer????????????', 'spark_isHistoryServerProcessAlive', 'SPARK', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (120001, 'TezUI????????????', 'hive_isTezUIProcessAlive', 'TEZ', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (121001, 'MonitorAgent????????????', 'up{job=\"USDPMONITOR-MonitorAgent\"}', 'USDPMONITOR', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (122001, 'ZkUI????????????', 'zk_isZKUIProcessAlive', 'ZKUI', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (123001, 'QuarumPeermain????????????', 'zk_isZKProcessAlive', 'ZOOKEEPER', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124001, 'ResourceManager????????????', 'yarn_isResourceManagerProcessAlive', 'YARN', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124002, 'ResourceManager??????????????????(%)', 'java_lang_Memory_HeapMemoryUsage_used{job=\"YARN-ResourceManager\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"YARN-ResourceManager\"}', 'YARN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124003, 'ResourceManager?????????GC????????????[5m]', 'avg_over_time(Hadoop_ResourceManager_GcTimeMillisPS_MarkSweep{job=\"YARN-ResourceManager\"}[5m])/(5*60*1000)', 'YARN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124004, 'ResourceManager?????????GC????????????[5m]', 'avg_over_time(Hadoop_ResourceManager_GcTimeMillisPS_Scavenge{job=\"YARN-ResourceManager\"}[5m])/(5*60*1000)', 'YARN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124005, 'ResourceManagerGC????????????[5m]', 'avg_over_time(Hadoop_ResourceManager_GcTimeMillis{job=\"YARN-ResourceManager\"}[5m])/(5*60*1000)', 'YARN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124006, 'NodeManager????????????', 'yarn_isNodeManagerProcessAlive', 'YARN', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124007, 'NodeManager??????????????????(%)', 'java_lang_Memory_HeapMemoryUsage_used{job=\"YARN-NodeManager\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"YARN-NodeManager\"}', 'YARN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124008, 'NodeManager?????????GC????????????[5m]', 'avg_over_time(Hadoop_NodeManager_GcTimeMillisPS_MarkSweep{job=\"YARN-NodeManager\"}[5m])/(5*60*1000)', 'YARN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124009, 'NodeManager?????????GC????????????[5m]', 'avg_over_time(Hadoop_NodeManager_GcTimeMillisPS_Scavenge{job=\"YARN-NodeManager\"}[5m])/(5*60*1000)', 'YARN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (124010, 'NodeManagerGC????????????[5m]', 'avg_over_time(Hadoop_NodeManager_GcTimeMillis{job=\"YARN-NodeManager\"}[5m])/(5*60*1000)', 'YARN', 'FLOAT', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (125001, 'PrestoCoordinator????????????', 'presto_isCoordinatorProcessAlive', 'PRESTO', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (125002, 'PrestoWorker????????????', 'presto_isWorkerProcessAlive', 'PRESTO', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (126001, 'UdsMaster????????????', 'uds_isMasterProcessAlive', 'UDS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (126002, 'UdsWorker????????????', 'uds_isWorkerProcessAlive', 'UDS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (126003, 'UdsWeb????????????', 'uds_isWebProcessAlive', 'UDS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (127001, 'KuduMaster????????????', 'kudu_isMasterProcessAlive', 'KUDU', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (127002, 'KuduTserver????????????', 'kudu_isTServerProcessAlive', 'KUDU', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (128001, 'ImpalaImpalad????????????', 'impala_isImpaladProcessAlive', 'IMPALA', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (128002, 'ImpalaCatalog????????????', 'impala_isCatalogdProcessAlive', 'IMPALA', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (128003, 'ImpalaStatestored????????????', 'impala_isStatestoredProcessAlive', 'IMPALA', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (129001, 'ZeppelinServer????????????', 'supplement_isZeppelinServerProcessNormal', 'ZEPPELIN', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (130001, 'AirflowWebserver????????????', 'supplement_isAirflowWebserverProcessAlive', 'AIRFLOW', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (130002, 'AirflowScheduler????????????', 'supplement_isAirflowSchedulerProcessAlive', 'AIRFLOW', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (131001, 'AtlasIndexServer????????????', 'supplement_isAtlasIndexServerProcessAlive', 'ATLAS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (131002, 'AtlasServer????????????', 'supplement_isAtlasServerProcessAlive', 'ATLAS', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (132001, 'AlertServer????????????', 'DolphinScheduler_isAlertProcessAlive', 'DOLPHINSCHEDULER', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (132002, 'ApiServer????????????', 'DolphinScheduler_isAPIProcessAlive', 'DOLPHINSCHEDULER', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (132003, 'LoggerServer????????????', 'DolphinScheduler_isLoggerProcessAlive', 'DOLPHINSCHEDULER', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (132004, 'MasterServer????????????', 'DolphinScheduler_isMasterProcessAlive', 'DOLPHINSCHEDULER', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (132005, 'WorkerServer????????????', 'DolphinScheduler_isWorkerProcessAlive', 'DOLPHINSCHEDULER', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (133001, 'TrinoCoordinator????????????', 'trino_isCoordinatorProcessAlive', 'TRINO', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (133002, 'TrinoWorker????????????', 'trino_isWorkerProcessAlive', 'TRINO', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_expression` VALUES (134001, 'Neo4j????????????', 'supplement_isNeo4jServerProcessAlive', 'NEO4J', 'BOOL', 'TRUE', 'VALID', 'FALSE', NULL, NULL);

-- ----------------------------
-- Table structure for t_ddh_cluster_alert_group_map
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_alert_group_map`;
CREATE TABLE `t_ddh_cluster_alert_group_map`  (
                                                  `id` int(10) NOT NULL AUTO_INCREMENT,
                                                  `cluster_id` int(10) NULL DEFAULT NULL,
                                                  `alert_group_id` int(10) NULL DEFAULT NULL,
                                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ddh_cluster_alert_group_map
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_alert_history
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_alert_history`;
CREATE TABLE `t_ddh_cluster_alert_history`  (
                                                `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                                `alert_group_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
                                                `alert_target_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                `alert_info` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                `alert_advice` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                `hostname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
                                                `alert_level` int(11) NULL DEFAULT NULL COMMENT '???????????? 1?????????2?????????',
                                                `is_enabled` int(11) NULL DEFAULT NULL COMMENT '???????????? 1:?????????2????????????',
                                                `service_role_instance_id` int(11) NULL DEFAULT NULL COMMENT '????????????????????????id',
                                                `service_instance_id` int(11) NULL DEFAULT NULL COMMENT '??????????????????id',
                                                `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                `update_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                `cluster_id` int(10) NULL DEFAULT NULL COMMENT '??????id',
                                                PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????????????? ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ddh_cluster_alert_history
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_alert_quota
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_alert_quota`;
CREATE TABLE `t_ddh_cluster_alert_quota`  (
                                              `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                              `alert_quota_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
                                              `service_category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                              `alert_expr` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????????????????',
                                              `alert_level` int(11) NULL DEFAULT NULL COMMENT '???????????? 1:??????2?????????',
                                              `alert_group_id` int(11) NULL DEFAULT NULL COMMENT '?????????',
                                              `notice_group_id` int(11) NULL DEFAULT NULL COMMENT '?????????',
                                              `alert_advice` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                              `compare_method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????? !=;>;<',
                                              `alert_threshold` bigint(200) NULL DEFAULT NULL COMMENT '????????????',
                                              `alert_tactic` int(11) NULL DEFAULT NULL COMMENT '???????????? 1:??????2?????????',
                                              `interval_duration` int(11) NULL DEFAULT NULL COMMENT '???????????? ????????????',
                                              `trigger_duration` int(11) NULL DEFAULT NULL COMMENT '???????????? ?????????',
                                              `service_role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
                                              `quota_state` int(2) NULL DEFAULT NULL COMMENT '1: ??????  2????????????',
                                              `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 620 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '????????????????????? ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ddh_cluster_alert_quota
-- ----------------------------
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (464, '?????????????????????', 'NODE', '(1-(node_memory_MemAvailable_bytes/(node_memory_MemTotal_bytes)))*100', 2, 11, 1, '1234', '>', 95, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (465, '??????CPU?????????', 'NODE', '(1-avg(irate(node_cpu_seconds_total{mode=\"idle\"}[5m]))by(instance))*100', 2, 11, 1, '444', '>', 95, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (466, '??????CPU???????????????', 'NODE', 'avg(irate(node_cpu_seconds_total{mode=\"system\"}[5m]))by(instance)*100', 1, 11, 1, 'cpu??????????????????????????????????????????', '>', 95, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (467, '??????CPU???????????????', 'NODE', 'avg(irate(node_cpu_seconds_total{mode=\"user\"}[5m]))by(instance)*100', 2, 11, 1, 'cpu??????????????????????????????????????????', '>', 95, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (468, '????????????IO?????????', 'NODE', 'avg(irate(node_cpu_seconds_total{mode=\"iowait\"}[5m]))by(instance)*100', 1, 11, 1, '??????IO?????????????????????????????????????????????', '>', 95, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (469, '???????????????????????????', 'NODE', '(1-((node_memory_SwapFree_bytes+1)/(node_memory_SwapTotal_bytes+1)))*100', 1, 11, 1, '????????????????????????????????????????????????????????????????????????', '>', 95, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (470, '?????????????????????', 'NODE', '(node_filesystem_size_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"}-node_filesystem_free_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"})*100/(node_filesystem_avail_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"}+(node_filesystem_size_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"}-node_filesystem_free_bytes{fstype=~\"ext.*|xfs\",mountpoint!~\".*pod.*\"}))', 1, 11, 1, '1', '>', 95, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (471, '??????????????????', 'NODE', 'irate(node_network_receive_bytes_total[5m])*8', 1, 11, 1, '??????????????????', '>', 8589934592, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (472, '??????????????????', 'NODE', 'irate(node_network_transmit_bytes_total[5m])*8', 1, 11, 1, '??????????????????', '>', 8589934592, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (473, '??????????????????[1m]', 'NODE', 'node_load1', 1, 11, 1, '??????????????????', '>', 100, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (474, '??????????????????[5m]', 'NODE', 'node_load5', 1, 11, 1, '??????????????????', '>', 100, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (475, '??????????????????[15m]', 'NODE', 'node_load15', 1, 11, 1, '??????????????????', '>', 100, 1, 1, 60, 'node', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (479, 'NameNode????????????', 'HDFS', 'up{job=\"namenode\"}', 2, 2, 2, '???????????????????????????????????????????????????????????????', '!=', 1, 1, 1, 15, 'NameNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (480, 'NameNodeRPC??????[5m]', 'HDFS', 'avg_over_time(Hadoop_NameNode_RpcProcessingTimeAvgTime{job=\"HDFS-NameNode\"}[5m])', 2, 2, 2, '?????????????????????????????????', '>', 5, 1, 1, 60, 'NameNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (481, 'NameNodeRPC??????[15m]', 'HDFS', 'avg_over_time(Hadoop_NameNode_RpcProcessingTimeAvgTime{job=\"HDFS-NameNode\"}[15m])', 1, 2, 2, '?????????????????????????????????', '>', 5, 1, 1, 60, 'NameNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (482, 'NameNode??????????????????', 'HDFS', 'java_lang_Memory_HeapMemoryUsage_used{job=\"HDFS-NameNode\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"HDFS-NameNode\"}', 1, 2, 2, 'NameNode????????????????????????NameNode?????????', '>', 95, 1, 1, 60, 'NameNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (483, 'NameNode?????????GC????????????[5m]', 'HDFS', 'avg_over_time(Hadoop_NameNode_GcTimeMillisConcurrentMarkSweep{job=\"HDFS-NameNode\"}[5m])/(5*60*1000)', 1, 2, 2, '?????????GC???????????????????????????????????????', '>', 60, 1, 1, 60, 'NameNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (484, 'NameNode?????????GC????????????[5m]', 'HDFS', 'avg_over_time(Hadoop_NameNode_GcTimeMillisParNew{job=\"HDFS-NameNode\"}[5m])/(5*60*1000)', 1, 2, 2, '?????????GC???????????????????????????????????????', '>', 60, 1, 1, 60, 'NameNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (485, 'NameNodeGC????????????[5m]', 'HDFS', 'avg_over_time(Hadoop_NameNode_GcTimeMillis{job=\"HDFS-NameNode\"}[5m])/(5*60*1000)', 1, 2, 2, 'GC???????????????????????????????????????', '>', 60, 1, 1, 60, 'NameNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (486, 'DataNode????????????', 'HDFS', 'up{job=\"datanode\"}', 2, 2, 2, '???????????????????????????????????????????????????????????????', '!=', 1, 1, 1, 15, 'DataNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (487, 'DataNodeRPC[5m]', 'HDFS', 'avg_over_time(Hadoop_DataNode_RpcProcessingTimeAvgTime{job=\"HDFS-DataNode\"}[5m])', 1, 2, 2, '?????????????????????????????????', '>', 5, 1, 1, 60, 'DataNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (488, 'DataNodeRPC[15m]', 'HDFS', 'avg_over_time(Hadoop_DataNode_RpcProcessingTimeAvgTime{job=\"HDFS-DataNode\"}[15m])', 1, 2, 2, '?????????????????????????????????', '>', 5, 1, 1, 60, 'DataNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (489, 'DataNode??????????????????', 'HDFS', 'java_lang_Memory_HeapMemoryUsage_used{job=\"HDFS-DataNode\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"HDFS-DataNode\"}', 1, 2, 2, 'NameNode????????????????????????NameNode?????????', '>', 95, 1, 1, 60, 'DataNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (490, 'DataNode?????????GC????????????[5m]', 'HDFS', 'avg_over_time(Hadoop_DataNode_GcTimeMillisConcurrentMarkSweep{job=\"HDFS-DataNode\"}[5m])/(5*60*1000)', 1, 2, 2, '?????????GC???????????????????????????????????????', '>', 60, 1, 1, 60, 'DataNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (491, 'DataNode?????????GC????????????[5m]', 'HDFS', 'avg_over_time(Hadoop_DataNode_GcTimeMillisParNew{job=\"HDFS-DataNode\"}[5m])/(5*60*1000)', 1, 2, 2, '?????????GC???????????????????????????????????????', '>', 60, 1, 1, 60, 'DataNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (492, 'DataNodeGC????????????[5m]', 'HDFS', 'avg_over_time(Hadoop_DataNode_GcTimeMillis{job=\"HDFS-DataNode\"}[5m])/(5*60*1000)', 1, 2, 2, 'GC???????????????????????????????????????', '>', 60, 1, 1, 60, 'DataNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (493, 'JournalNode????????????', 'HDFS', 'up{job=\"journalnode\"}', 2, 2, 2, 'JournalNode????????????????????????', '!=', 1, 1, 1, 15, 'JournalNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (494, 'ZKFailoverController????????????', 'HDFS', 'up{job=\"zkfc\"}', 2, 2, 2, 'ZKFC????????????????????????', '!=', 1, 1, 1, 15, 'ZKFC', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (496, 'HDFS??????', 'HDFS', 'Hadoop_NameNode_VolumeFailuresTotal{name=\"FSNamesystem\"}', 1, 2, 2, '????????????', '>', 0, 1, 1, 60, 'NameNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (497, 'HDFS?????????', 'HDFS', 'Hadoop_NameNode_MissingBlocks{name=\"FSNamesystem\"}', 1, 2, 2, '???????????????', '>', 0, 1, 1, 60, 'NameNode', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (512, 'AlertManager????????????', 'ALERTMANAGER', 'up{job=\"alertmanager\"}', 2, 13, 1, 'AlertManager????????????????????????', '!=', 1, 1, 1, 15, 'AlertManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (518, 'Grafana????????????', 'GRAFANA', 'up{job=\"grafana\"}', 2, 14, 1, 'Grafana????????????????????????', '!=', 1, 1, 1, 15, 'Grafana', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (519, 'HBaseMaster????????????', 'HBASE', 'up{job=\"hbasemaster\"}', 2, 8, 1, 'Hbase Master????????????????????????', '!=', 1, 1, 1, 15, 'HbaseMaster', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (520, 'HRegionServer????????????', 'HBASE', 'up{job=\"regionserver\"}', 2, 8, 1, 'RegionServer????????????????????????', '!=', 1, 1, 1, 15, 'RegionServer', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (541, 'HiveServer2????????????', 'HIVE', 'up{job=\"hiveserver2\"}', 2, 1, 1, 'HiveServer2????????????????????????', '!=', 1, 1, 1, 15, 'HiveServer2', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (542, 'HiveServer2??????????????????', 'HIVE', 'java_lang_Memory_HeapMemoryUsage_used{job=\"HIVE-HiveServer2\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"HIVE-HiveServer2\"}', 1, 1, 1, 'HiveServer2????????????????????????NameNode?????????', '>', 95, 1, 1, 60, 'HiveServer2', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (543, 'HiveServer2?????????GC????????????[5m]', 'HIVE', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"HIVE-HiveServer2\",name=\"PS MarkSweep\"}[5m])/(5*60*1000)', 1, 1, NULL, '??????????????????', '>', 60, NULL, NULL, 60, 'HiveServer2', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (544, 'HiveServer2?????????GC????????????[5m]', 'HIVE', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"HIVE-HiveServer2\",name=\"PS Scavenge\"}[5m])/(5*60*1000)', 1, 1, NULL, '??????????????????', '>', 60, NULL, NULL, 60, 'HiveServer2', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (545, 'HiveMetastore????????????', 'HIVE', 'up{job=\"hivemetastore\"}', 2, 1, 1, 'HiveMetastore????????????????????????', '!=', 1, 1, 1, 15, 'HiveMetaStore', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (546, 'HiveMetastore??????????????????', 'HIVE', 'java_lang_Memory_HeapMemoryUsage_used{job=\"HIVE-MetaStore\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"HIVE-MetaStore\"}', 1, 1, NULL, '??????????????????', '>', 95, NULL, NULL, 60, 'HiveMetaStore', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (547, 'HiveMetastore?????????GC????????????[5m]', 'HIVE', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"HIVE-MetaStore\",name=\"PS MarkSweep\"}[5m])/(5*60*1000)', 1, 1, NULL, '??????????????????', '>', 60, NULL, NULL, 60, 'HiveMetaStore', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (548, 'HiveMetastore?????????GC????????????[5m]', 'HIVE', 'avg_over_time(java_lang_GarbageCollector_CollectionTime{job=\"HIVE-MetaStore\",name=\"PS Scavenge\"}[5m])/(5*60*1000)', 1, 1, NULL, '??????????????????', '>', 60, NULL, NULL, 60, 'HiveMetaStore', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (567, 'Prometheus????????????', 'PROMETHEUS', 'up{job=\"prometheus\"}', 2, 15, 1, 'Prometheus????????????????????????', '!=', 1, 1, 1, 15, 'Prometheus', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (568, 'RangerServer????????????', 'RANGER', 'up{job=\"rangeradmin\"}', 2, 18, 1, '??????????????????', '!=', 1, 1, 1, 15, 'RangerAdmin', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (569, 'SparkHistoryServer????????????', 'SPARK', 'up{job=\"sparkhistoryserver\"}', 2, 16, 1, '??????????????????', '!=', 1, 1, 1, 15, 'SparkHistoryServer', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (573, 'ZK????????????', 'ZOOKEEPER', 'up{job=\"zkserver\"}', 2, 12, 1, 'zk????????????????????????', '!=', 1, 1, 1, 15, 'ZkServer', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (574, 'ResourceManager????????????', 'YARN', 'up{job=\"resourcemanager\"}', 2, 3, 1, 'ResourceManager????????????????????????', '!=', 1, 1, 1, 15, 'ResourceManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (575, 'ResourceManager??????????????????', 'YARN', 'java_lang_Memory_HeapMemoryUsage_used{job=\"YARN-ResourceManager\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"YARN-ResourceManager\"}', 1, 3, 1, '??????????????????', '>', 95, 1, 1, 60, 'ResourceManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (576, 'ResourceManager?????????GC????????????[5m]', 'YARN', 'avg_over_time(Hadoop_ResourceManager_GcTimeMillisPS_MarkSweep{job=\"YARN-ResourceManager\"}[5m])/(5*60*1000)', 1, 3, 1, '??????????????????', '>', 60, 1, 1, 60, 'ResourceManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (577, 'ResourceManager?????????GC????????????[5m]', 'YARN', 'avg_over_time(Hadoop_ResourceManager_GcTimeMillisPS_Scavenge{job=\"YARN-ResourceManager\"}[5m])/(5*60*1000)', 1, 3, 1, '??????????????????', '>', 60, 1, 1, 60, 'ResourceManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (578, 'ResourceManagerGC????????????[5m]', 'YARN', 'avg_over_time(Hadoop_ResourceManager_GcTimeMillis{job=\"YARN-ResourceManager\"}[5m])/(5*60*1000)', 1, 3, 1, '??????????????????', '>', 60, 1, 1, 60, 'ResourceManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (579, 'NodeManager????????????', 'YARN', 'up{job=\"nodemanager\"}', 2, 3, 1, 'NodeManager????????????????????????', '!=', 1, 1, 1, 15, 'NodeManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (580, 'NodeManager??????????????????', 'YARN', 'java_lang_Memory_HeapMemoryUsage_used{job=\"YARN-NodeManager\"}*100/java_lang_Memory_HeapMemoryUsage_max{job=\"YARN-NodeManager\"}', 1, 3, 1, '??????????????????', '>', 95, 1, 1, 60, 'NodeManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (581, 'NodeManager?????????GC????????????[5m]', 'YARN', 'avg_over_time(Hadoop_NodeManager_GcTimeMillisPS_MarkSweep{job=\"YARN-NodeManager\"}[5m])/(5*60*1000)', 1, 3, 1, '??????????????????', '>', 60, 1, 1, 60, 'NodeManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (582, 'NodeManager?????????GC????????????[5m]', 'YARN', 'avg_over_time(Hadoop_NodeManager_GcTimeMillisPS_Scavenge{job=\"YARN-NodeManager\"}[5m])/(5*60*1000)', 1, 3, 1, '??????????????????', '>', 60, 1, 1, 60, 'NodeManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (583, 'NodeManagerGC????????????[5m]', 'YARN', 'avg_over_time(Hadoop_NodeManager_GcTimeMillis{job=\"YARN-NodeManager\"}[5m])/(5*60*1000)', 1, 3, 1, '??????????????????', '>', 60, 1, 1, 60, 'NodeManager', 1, '2022-07-14 14:22:36');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (611, 'KafkaBorker????????????', 'KAFKA', 'up{job=\"kafkabroker\"}', 2, 10, 1, 'KafkaBroker????????????????????????', '!=', 1, 1, 1, 15, 'KafkaBroker', 1, '2022-07-15 14:32:25');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (612, 'TrinoCoordinator????????????', 'TRINO', 'up{job=\"trinocoordinator\"}', 2, 17, 1, '????????????', '!=', 1, 1, 1, 15, 'TrinoCoordinator', 1, NULL);
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (613, 'TrinoWorker????????????', 'TRINO', 'up{job=\"trinoworker\"}', 2, 17, 1, '????????????', '!=', 1, 1, 1, 15, 'TrinoWorker', 1, NULL);
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (614, '????????????', 'NODE', 'up{job=\"node\"}', 2, 11, 1, '????????????????????????', '!=', 1, 1, 1, 0, 'node', 1, NULL);
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (615, 'FE????????????', 'STARROCKS', 'up{group=\'fe\'}', 2, 19, 1, '????????????', '!=', 1, 1, 1, 15, 'FE', 1, '2022-09-13 14:54:39');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (616, 'BE????????????', 'STARROCKS', 'up{group=\'be\'}', 2, 19, 1, '????????????', '!=', 1, 1, 1, 15, 'BE', 1, '2022-09-13 14:55:16');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (617, 'SparkMaster????????????', 'SPARK3', 'up{job=\"sparkmaster\"}', 2, 16, 1, '????????????', '!=', 1, 1, 1, 15, 'SparkMaster', 1, '2022-09-16 10:24:38');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (618, 'SparkWorker????????????', 'SPARK3', 'up{job=\"sparkworker\"}', 2, 16, 1, '????????????', '!=', 1, 1, 1, 15, 'SparkWorker', 1, '2022-09-16 10:25:18');
INSERT INTO `t_ddh_cluster_alert_quota` VALUES (619, 'ElasticSearch????????????', 'ELASTICSEARCH', 'com_datasophon_ddh_worker_metrics_esMetrics_EsUp', 2, 20, 1, '????????????', '!=', 1, 1, 1, 15, 'ElasticSearch', 1, '2022-10-08 16:17:00');

-- ----------------------------
-- Table structure for t_ddh_cluster_alert_rule
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_alert_rule`;
CREATE TABLE `t_ddh_cluster_alert_rule`  (
                                             `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '?????? ID',
                                             `expression_id` bigint(20) NOT NULL COMMENT '????????? ID',
                                             `is_predefined` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
                                             `compare_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '???????????? ??? ?????? ?????? ?????? ???',
                                             `threshold_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????',
                                             `persistent_time` bigint(20) NOT NULL COMMENT '????????????',
                                             `strategy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????????????????????????????',
                                             `repeat_interval` bigint(11) NULL DEFAULT NULL COMMENT '??????????????? ????????????',
                                             `alert_level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????',
                                             `alert_desc` varchar(4096) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '????????????',
                                             `receiver_group_id` bigint(20) NULL DEFAULT NULL COMMENT '????????? ID',
                                             `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????',
                                             `is_delete` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                             `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                             `update_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                             `cluster_id` int(10) NULL DEFAULT NULL COMMENT '??????id',
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134002 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '?????????' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ddh_cluster_alert_rule
-- ----------------------------
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101001, 101001, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', '?????????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101002, 101002, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', '??????CPU?????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101003, 101003, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', '??????CPU???????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101004, 101004, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', '??????CPU???????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101005, 101005, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', '????????????IO?????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101006, 101006, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', '???????????????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101007, 101007, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', '?????????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101008, 101008, 'TRUE', '>', '8589934592', 60, 'REPEAT', 30, 'WARN', '??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101009, 101009, 'TRUE', '>', '8589934592', 60, 'REPEAT', 30, 'WARN', '??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101010, 101010, 'TRUE', '>', '100', 60, 'REPEAT', 30, 'WARN', '??????????????????[1m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101011, 101011, 'TRUE', '>', '100', 60, 'REPEAT', 30, 'WARN', '??????????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101012, 101012, 'TRUE', '>', '100', 60, 'REPEAT', 30, 'WARN', '??????????????????[15m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101013, 101013, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'Ntp????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (101014, 101014, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'Ntp????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (102001, 102001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'AlertManager????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (103001, 103001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'Elasticsearch????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (103002, 103002, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'ElasticsearchCPU?????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (103003, 103003, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'Elasticsearch???????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (103004, 103004, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'Elasticsearch???????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (104001, 104001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'FlinkHistoryServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (105001, 105001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'Grafana????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (106001, 106001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'HBaseMaster????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (106002, 106002, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'HRegionServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (106003, 106003, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'HThriftServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107001, 107001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'NameNode????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107002, 107002, 'TRUE', '>', '5', 60, 'REPEAT', 30, 'WARN', 'NameNodeRPC??????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107003, 107003, 'TRUE', '>', '5', 60, 'REPEAT', 30, 'WARN', 'NameNodeRPC??????[15m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107004, 107004, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'NameNode??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107005, 107005, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'NameNode?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107006, 107006, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'NameNode?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107007, 107007, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'NameNodeGC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107008, 107008, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'DataNode????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107009, 107009, 'TRUE', '>', '5', 60, 'REPEAT', 30, 'WARN', 'DataNodeRPC[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107010, 107010, 'TRUE', '>', '5', 60, 'REPEAT', 30, 'WARN', 'DataNodeRPC[15m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107011, 107011, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'DataNode??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107012, 107012, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'DataNode?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107013, 107013, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'DataNode?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107014, 107014, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'DataNodeGC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107015, 107015, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'JournalNode????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107016, 107016, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'ZKFailoverController????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107017, 107017, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'HttpFs????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107018, 107018, 'TRUE', '>', '0', 60, 'REPEAT', 30, 'WARN', 'HDFS??????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (107019, 107019, 'TRUE', '>', '0', 60, 'REPEAT', 30, 'WARN', 'HDFS?????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (108001, 108001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'HiveServer2????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (108002, 108002, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'HiveServer2??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (108003, 108003, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'HiveServer2?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (108004, 108004, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'HiveServer2?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (108005, 108005, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'HiveMetastore????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (108006, 108006, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'HiveMetastore??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (108007, 108007, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'HiveMetastore?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (108008, 108008, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'HiveMetastore?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (108009, 108009, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'MySQL????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (109001, 109001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'HueServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (110001, 110001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'InfluxDB????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (111001, 111001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'KafkaEagle????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (112001, 112001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'Kibana????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (113001, 113001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'KylinServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (113002, 113002, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'KylinServer??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (113003, 113003, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'KylinServer?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (113004, 113004, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'KylinServer?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (114001, 114001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'LivyServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (114002, 114002, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'LivyServer??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (114003, 114003, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'LivyServer?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (114004, 114004, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'LivyServer?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (115001, 115001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'NodeExporter????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (116001, 116001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'OozieServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (116002, 116002, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'OozieServer??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (116003, 116003, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'OozieServer?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (116004, 116004, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'OozieServer?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (117001, 117001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'Prometheus????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (118001, 118001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'RangerServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (119001, 119001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'SparkHistoryServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (120001, 120001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'TezUI????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (121001, 121001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'MonitorAgent????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (122001, 122001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'ZkUI????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (123001, 123001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'QuarumPeermain????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124001, 124001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'ResourceManager????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124002, 124002, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'ResourceManager??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124003, 124003, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'ResourceManager?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124004, 124004, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'ResourceManager?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124005, 124005, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'ResourceManagerGC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124006, 124006, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'NodeManager????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124007, 124007, 'TRUE', '>', '95', 60, 'REPEAT', 30, 'WARN', 'NodeManager??????????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124008, 124008, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'NodeManager?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124009, 124009, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'NodeManager?????????GC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (124010, 124010, 'TRUE', '>', '60', 60, 'REPEAT', 30, 'WARN', 'NodeManagerGC????????????[5m]', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (125001, 125001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'PrestoCoordinator????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (125002, 125002, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'PrestoWorker????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (126001, 126001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'UdsMaster????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (126002, 126002, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'UdsWorker????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (126003, 126003, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'UdsWeb????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (127001, 127001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'KuduMaster????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (127002, 127002, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'KuduTserver????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (128001, 128001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'ImpalaImpalad????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (128002, 128002, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'ImpalaCatalog????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (128003, 128003, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'ImpalaStatestored????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (129001, 129001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'ZeppelinServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (130001, 130001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'AirflowWebserver????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (130002, 130002, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'AirflowScheduler????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (131001, 131001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'AtlasIndexServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (131002, 131002, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'AtlasServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (132001, 132001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'AlertServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (132002, 132002, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'ApiServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (132003, 132003, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'LoggerServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (132004, 132004, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'MasterServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (132005, 132005, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'WorkerServer????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (133001, 133001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'TrinoCoordinator????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (133002, 133002, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'TrinoWorker????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);
INSERT INTO `t_ddh_cluster_alert_rule` VALUES (134001, 134001, 'TRUE', '!=', '1', 60, 'REPEAT', 30, 'WARN', 'Neo4j????????????', NULL, 'VALID', 'FALSE', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_ddh_cluster_group
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_group`;
CREATE TABLE `t_ddh_cluster_group`  (
                                        `id` int(10) NOT NULL AUTO_INCREMENT,
                                        `group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                        `cluster_id` int(10) NULL DEFAULT NULL,
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_host
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_host`;
CREATE TABLE `t_ddh_cluster_host`  (
                                       `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                       `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                       `hostname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
                                       `ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
                                       `rack` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
                                       `core_num` int(11) NULL DEFAULT NULL COMMENT '??????',
                                       `total_mem` int(11) NULL DEFAULT NULL COMMENT '?????????',
                                       `total_disk` int(11) NULL DEFAULT NULL COMMENT '?????????',
                                       `used_mem` int(11) NULL DEFAULT NULL COMMENT '????????????',
                                       `used_disk` int(11) NULL DEFAULT NULL COMMENT '????????????',
                                       `average_load` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                       `check_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                       `cluster_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????id',
                                       `host_state` int(2) NULL DEFAULT NULL COMMENT '1:?????? 2????????????????????????3????????????????????????',
                                       `managed` int(2) NULL DEFAULT NULL COMMENT '1:?????? 2?????????',
                                       `cpu_architecture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cpu??????',
                                       `node_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '??????????????? ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_host
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_info`;
CREATE TABLE `t_ddh_cluster_info`  (
                                       `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                       `create_by` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
                                       `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                       `cluster_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                       `cluster_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                       `cluster_frame` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                       `frame_version` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                       `cluster_state` int(11) NULL DEFAULT NULL COMMENT '???????????? 1:?????????2???????????????',
                                       `frame_id` int(10) NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_node_label
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_node_label`;
CREATE TABLE `t_ddh_cluster_node_label`  (
                                             `id` int(10) NOT NULL,
                                             `cluster_id` int(10) NULL DEFAULT NULL,
                                             `node_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_node_label
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_rack
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_rack`;
CREATE TABLE `t_ddh_cluster_rack`  (
                                       `id` int(10) NOT NULL AUTO_INCREMENT,
                                       `rack` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                       `clusterId` int(10) NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_rack
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_role_user`;
CREATE TABLE `t_ddh_cluster_role_user`  (
                                            `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                            `cluster_id` int(11) NULL DEFAULT NULL COMMENT '??????id',
                                            `user_type` int(2) NULL DEFAULT NULL COMMENT '??????????????????1????????????2???????????????',
                                            `user_id` int(11) NULL DEFAULT NULL COMMENT '??????id',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_service_command
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_service_command`;
CREATE TABLE `t_ddh_cluster_service_command`  (
                                                  `command_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '??????',
                                                  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????????',
                                                  `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                  `command_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                  `command_state` int(11) NULL DEFAULT NULL COMMENT '???????????? 0???????????? 1???????????????2?????????3?????????4?????????',
                                                  `command_progress` int(11) NULL DEFAULT NULL COMMENT '????????????',
                                                  `cluster_id` int(10) NULL DEFAULT NULL,
                                                  `service_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                  `command_type` int(2) NULL DEFAULT NULL COMMENT '????????????1??????????????? 2??????????????? 3??????????????? 4??????????????? 5???????????????????????? 6????????????????????????',
                                                  `end_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                  `service_instance_id` int(10) NULL DEFAULT NULL COMMENT '????????????id',
                                                  UNIQUE INDEX `command_id`(`command_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_service_command
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_service_command_host
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_service_command_host`;
CREATE TABLE `t_ddh_cluster_service_command_host`  (
                                                       `command_host_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '??????',
                                                       `hostname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
                                                       `command_state` int(11) NULL DEFAULT NULL COMMENT '???????????? 1???????????????2?????????3?????????4?????????',
                                                       `command_progress` int(11) NULL DEFAULT NULL COMMENT '????????????',
                                                       `command_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????id',
                                                       `create_time` datetime NULL DEFAULT NULL,
                                                       UNIQUE INDEX `command_host_id`(`command_host_id`) USING BTREE,
                                                       UNIQUE INDEX `command_host_id_2`(`command_host_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '?????????????????????????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_service_command_host
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_service_command_host_command
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_service_command_host_command`;
CREATE TABLE `t_ddh_cluster_service_command_host_command`  (
                                                               `host_command_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '??????',
                                                               `command_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                               `command_state` int(11) NULL DEFAULT NULL COMMENT '????????????',
                                                               `command_progress` int(11) NULL DEFAULT NULL COMMENT '????????????',
                                                               `command_host_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????id',
                                                               `hostname` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
                                                               `service_role_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
                                                               `service_role_type` int(2) NULL DEFAULT NULL COMMENT '??????????????????',
                                                               `command_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????id',
                                                               `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                               `command_type` int(2) NULL DEFAULT NULL COMMENT '1??????????????? 2??????????????? 3??????????????? 4??????????????? 5???????????????????????? 6????????????????????????',
                                                               `result_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
                                                               UNIQUE INDEX `host_command_id`(`host_command_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????????????????????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_service_command_host_command
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_service_dashboard
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_service_dashboard`;
CREATE TABLE `t_ddh_cluster_service_dashboard`  (
                                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                                    `service_name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '????????????',
                                                    `dashboard_url` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '??????????????????',
                                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '???????????????????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_service_dashboard
-- ----------------------------
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (1, 'HDFS', 'http://${grafanaHost}:3000/d/huM_B3dZz/2-hdfs?orgId=1&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (2, 'YARN', 'http://${grafanaHost}:3000/d/-ZErfqOWz/3-yarn?orgId=1&refresh=30s&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (3, 'HIVE', 'http://${grafanaHost}:3000/d/WYNeBqdZz/5-hive?orgId=1&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (4, 'HBASE', 'http://${grafanaHost}:3000/d/_S8XBqOWz/4-hbase?orgId=1&refresh=30s&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (5, 'KAFKA', 'http://${grafanaHost}:3000/d/DGHHkJKWk/6-kafka?orgId=1&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (6, 'ZOOKEEPER', 'http://${grafanaHost}:3000/d/000000261/8-zookeeper?orgId=1&refresh=1m&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (7, 'RANGER', 'http://${grafanaHost}:3000/d/qgVDEd3nk/ranger?orgId=1&refresh=30s&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (8, 'PROMETHEUS', 'http://${grafanaHost}:3000/d/dd4t3A6nz/prometheus-2-0-overview?orgId=1&refresh=30s&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (9, 'GRAFANA', 'http://${grafanaHost}:3000/d/eea-11_sik/grafana?orgId=1&refresh=5m&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (10, 'ALERTMANAGER', 'http://${grafanaHost}:3000/d/eea-9_siks/alertmanager?orgId=1&refresh=5m&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (11, 'SPARK3', 'http://${grafanaHost}:3000/d/rCUqf3dWz/7-spark?orgId=1&from=now-30m&to=now&refresh=5m&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (12, 'TOTAL', 'http://${grafanaHost}:3000/d/_4gf-qOZz/1-zong-lan?orgId=1&refresh=30s&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (13, 'TRINO', 'http://${grafanaHost}:3000/d/TGzKne5Wk/trino?orgId=1&refresh=30s&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (14, 'STARROCKS', 'http://${grafanaHost}:3000/d/wpcA3tG7z/starrocks?orgId=1&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (15, 'FLINK', 'http://${grafanaHost}:3000/d/-0rFuzoZk/flink-dashboard?orgId=1&refresh=30s&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (16, 'ELASTICSEARCH', 'http://${grafanaHost}:3000/d/3788af4adc3046dd92b3af31d0150c79/elasticsearch-cluster?orgId=1&refresh=5m&var-cluster=ddp_es&var-name=All&var-interval=5m&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (17, 'DS', 'http://${grafanaHost}:3000/d/X_NPpJOVk/dolphinscheduler?refresh=1m&kiosk');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (18, 'STREAMPARK', 'http://${grafanaHost}:3000/d/98U0T1OVz/streampark?kiosk&refresh=1m');
INSERT INTO `t_ddh_cluster_service_dashboard` VALUES (19, 'DORIS', 'http://${grafanaHost}:3000/d/1fFiWJ4mz/doris-overview?orgId=1&from=now-6h&to=now&refresh=1m&kiosk');

-- ----------------------------
-- Table structure for t_ddh_cluster_service_instance
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_service_instance`;
CREATE TABLE `t_ddh_cluster_service_instance`  (
                                                   `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                                   `cluster_id` int(11) NULL DEFAULT NULL COMMENT '??????id',
                                                   `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                   `service_state` int(11) NULL DEFAULT NULL COMMENT '???????????? 1???????????? 2??????????????? 3??????????????? 4???????????????',
                                                   `update_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                   `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                   `need_restart` int(2) NULL DEFAULT NULL COMMENT '?????????????????? 1????????? 2???????????????',
                                                   `frame_service_id` int(10) NULL DEFAULT NULL COMMENT '????????????id',
                                                   `sort_num` int(2) NULL DEFAULT NULL COMMENT '????????????',
                                                   `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_service_instance
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_service_instance_role_group
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_service_instance_role_group`;
CREATE TABLE `t_ddh_cluster_service_instance_role_group`  (
                                                              `id` int(10) NOT NULL AUTO_INCREMENT,
                                                              `role_group_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                              `service_instance_id` int(11) NULL DEFAULT NULL,
                                                              `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                              `cluster_id` int(11) NULL DEFAULT NULL,
                                                              `role_group_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                              `create_time` datetime NULL DEFAULT NULL,
                                                              PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_service_instance_role_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_service_role_group_config
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_service_role_group_config`;
CREATE TABLE `t_ddh_cluster_service_role_group_config`  (
                                                            `id` int(10) NOT NULL AUTO_INCREMENT,
                                                            `role_group_id` int(10) NULL DEFAULT NULL,
                                                            `config_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
                                                            `config_json_md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                            `config_version` int(2) NULL DEFAULT NULL,
                                                            `config_file_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
                                                            `config_file_json_md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                            `cluster_id` int(10) NULL DEFAULT NULL,
                                                            `create_time` datetime NULL DEFAULT NULL,
                                                            `update_time` datetime NULL DEFAULT NULL,
                                                            `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ddh_cluster_service_role_group_config
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_service_role_instance
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_service_role_instance`;
CREATE TABLE `t_ddh_cluster_service_role_instance`  (
                                                        `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                                        `service_role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????????????????',
                                                        `hostname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??????',
                                                        `service_role_state` int(2) NULL DEFAULT NULL COMMENT '?????????????????? 1:????????????2?????????',
                                                        `update_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                        `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                                        `service_id` int(11) NULL DEFAULT NULL COMMENT '??????id',
                                                        `role_type` int(11) NULL DEFAULT NULL COMMENT '???????????? 1:master2:worker3:client',
                                                        `cluster_id` int(10) NULL DEFAULT NULL COMMENT '??????id',
                                                        `service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                                        `role_group_id` int(10) NULL DEFAULT NULL COMMENT '?????????id',
                                                        `need_restart` int(10) NULL DEFAULT NULL COMMENT '?????????????????? 1????????? 2???????????????',
                                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_service_role_instance
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_service_role_instance_webuis
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_service_role_instance_webuis`;
CREATE TABLE `t_ddh_cluster_service_role_instance_webuis`  (
                                                               `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                                               `service_role_instance_id` int(10) NULL DEFAULT NULL COMMENT '????????????id',
                                                               `web_url` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'URL??????',
                                                               `service_instance_id` int(10) NULL DEFAULT NULL,
                                                               `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
                                                               PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '????????????????????????web ui??? ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_service_role_instance_webuis
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_user
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_user`;
CREATE TABLE `t_ddh_cluster_user`  (
                                       `id` int(10) NOT NULL AUTO_INCREMENT,
                                       `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                       `cluster_id` int(10) NULL DEFAULT NULL,
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_user_group
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_user_group`;
CREATE TABLE `t_ddh_cluster_user_group`  (
                                             `id` int(10) NOT NULL AUTO_INCREMENT,
                                             `user_id` int(10) NULL DEFAULT NULL,
                                             `group_id` int(10) NULL DEFAULT NULL,
                                             `cluster_id` int(10) NULL DEFAULT NULL,
                                             `user_group_type` int(2) NULL DEFAULT NULL COMMENT '1:???????????? 2????????????',
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_variable
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_variable`;
CREATE TABLE `t_ddh_cluster_variable`  (
                                           `id` int(10) NOT NULL AUTO_INCREMENT,
                                           `cluster_id` int(10) NULL DEFAULT NULL,
                                           `variable_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                           `variable_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                           PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ddh_cluster_variable
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_yarn_queue
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_yarn_queue`;
CREATE TABLE `t_ddh_cluster_yarn_queue`  (
                                             `id` int(10) NOT NULL AUTO_INCREMENT,
                                             `queue_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                             `min_core` int(10) NULL DEFAULT NULL,
                                             `min_mem` int(10) NULL DEFAULT NULL,
                                             `max_core` int(10) NULL DEFAULT NULL,
                                             `max_mem` int(10) NULL DEFAULT NULL,
                                             `app_num` int(10) NULL DEFAULT NULL,
                                             `weight` int(2) NULL DEFAULT NULL,
                                             `schedule_policy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'fifo ,fair ,drf',
                                             `allow_preemption` int(2) NULL DEFAULT NULL COMMENT '1: true 2:false',
                                             `cluster_id` int(10) NULL DEFAULT NULL,
                                             `am_share` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                             `create_time` datetime NULL DEFAULT NULL,
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_yarn_queue
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_cluster_zk
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_cluster_zk`;
CREATE TABLE `t_ddh_cluster_zk`  (
                                     `id` int(10) NOT NULL AUTO_INCREMENT,
                                     `zk_server` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                     `myid` int(10) NULL DEFAULT NULL,
                                     `cluster_id` int(10) NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_cluster_zk
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_command
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_command`;
CREATE TABLE `t_ddh_command`  (
                                  `id` int(10) NOT NULL,
                                  `command_type` int(2) NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_ddh_command
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_frame_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_frame_info`;
CREATE TABLE `t_ddh_frame_info`  (
                                     `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                     `frame_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                     `frame_code` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                     `frame_version` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_frame_info
-- ----------------------------
INSERT INTO `t_ddh_frame_info` VALUES (7, NULL, 'DDP-1.0.0', NULL);

-- ----------------------------
-- Table structure for t_ddh_frame_service
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_frame_service`;
CREATE TABLE `t_ddh_frame_service`  (
                                        `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                        `frame_id` int(11) NULL DEFAULT NULL COMMENT '??????id',
                                        `service_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                        `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                        `service_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                        `service_desc` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                        `dependencies` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                        `package_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???????????????',
                                        `service_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
                                        `service_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
                                        `service_json_md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                        `frame_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                        `config_file_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
                                        `config_file_json_md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                        `decompress_package_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                        `sort_num` int(2) NULL DEFAULT NULL COMMENT '????????????',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_frame_service
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_frame_service_role
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_frame_service_role`;
CREATE TABLE `t_ddh_frame_service_role`  (
                                             `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                             `service_id` int(11) NULL DEFAULT NULL COMMENT '??????id',
                                             `service_role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????????????',
                                             `service_role_type` int(11) NULL DEFAULT NULL COMMENT '???????????? 1:master2:worker3:client',
                                             `cardinality` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                             `service_role_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
                                             `service_role_json_md5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                             `frame_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                             `jmx_port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                             `log_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                             PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '?????????????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_frame_service_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_install_step
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_install_step`;
CREATE TABLE `t_ddh_install_step`  (
                                       `id` int(10) NOT NULL AUTO_INCREMENT,
                                       `step_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                       `step_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                       `install_type` int(1) NULL DEFAULT NULL COMMENT '1:????????????2???????????????3???????????????',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_install_step
-- ----------------------------
INSERT INTO `t_ddh_install_step` VALUES (1, '????????????', NULL, 1);
INSERT INTO `t_ddh_install_step` VALUES (2, '??????????????????', NULL, 1);
INSERT INTO `t_ddh_install_step` VALUES (3, '????????????????????????agent', NULL, 1);
INSERT INTO `t_ddh_install_step` VALUES (4, '????????????', NULL, 1);
INSERT INTO `t_ddh_install_step` VALUES (5, '????????????Master??????', NULL, 1);
INSERT INTO `t_ddh_install_step` VALUES (6, '????????????Worker???Client??????', NULL, 1);
INSERT INTO `t_ddh_install_step` VALUES (7, '????????????', NULL, 1);
INSERT INTO `t_ddh_install_step` VALUES (8, '??????????????????', NULL, 1);
INSERT INTO `t_ddh_install_step` VALUES (9, '??????????????????', NULL, 1);

-- ----------------------------
-- Table structure for t_ddh_notice_group
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_notice_group`;
CREATE TABLE `t_ddh_notice_group`  (
                                       `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                       `notice_group_name` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '???????????????',
                                       `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                       PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_notice_group
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_notice_group_user
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_notice_group_user`;
CREATE TABLE `t_ddh_notice_group_user`  (
                                            `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                            `notice_group_id` int(11) NULL DEFAULT NULL COMMENT '?????????id',
                                            `user_id` int(11) NULL DEFAULT NULL COMMENT '??????id',
                                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '?????????-???????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_notice_group_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_role_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_role_info`;
CREATE TABLE `t_ddh_role_info`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                    `role_name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '????????????',
                                    `role_code` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '????????????',
                                    `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '???????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_role_info
-- ----------------------------

-- ----------------------------
-- Table structure for t_ddh_session
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_session`;
CREATE TABLE `t_ddh_session`  (
                                  `id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
                                  `user_id` int(10) NULL DEFAULT NULL,
                                  `ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
                                  `last_login_time` datetime NULL DEFAULT NULL,
                                  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_session
-- ----------------------------
INSERT INTO `t_ddh_session` VALUES ('3f229c41-84ee-4a09-a0b9-76e95f0577dc', 2, '192.168.75.12', '2022-09-07 11:52:12');
INSERT INTO `t_ddh_session` VALUES ('f4d6677e-9acc-4d14-bad0-052ca3d3fe52', 1, '192.168.75.13', '2023-01-06 14:12:22');

-- ----------------------------
-- Table structure for t_ddh_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_ddh_user_info`;
CREATE TABLE `t_ddh_user_info`  (
                                    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????',
                                    `username` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '?????????',
                                    `password` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '??????',
                                    `email` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '??????',
                                    `phone` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '?????????',
                                    `create_time` datetime NULL DEFAULT NULL COMMENT '????????????',
                                    `user_type` int(2) NULL DEFAULT NULL COMMENT '1?????????????????? 2???????????????',
                                    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '???????????????' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_ddh_user_info
-- ----------------------------
INSERT INTO `t_ddh_user_info` VALUES (1, 'admin', '0192023a7bbd73250516f069df18b500', 'xx@163.com', '1865603xxxx', '2022-05-10 16:05:18', 1);

SET FOREIGN_KEY_CHECKS = 1;

