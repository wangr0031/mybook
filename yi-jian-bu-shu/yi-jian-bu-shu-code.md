# 一键部署-工具说明

## 部署工具各个流程Code
|模块名称|模块编码|类型|执行方式|
|:-|:-|:-|:-|
|导入Excel规划数据|importPlanningDataAction|简单环节|自动|
|等待主机配置|waitforHostAction|简单环节|自动|
|安装操作系统|installHostAction|简单环节|自动|
|安装Keepalived|iaasKeepalivedAction|简单环节|自动|
|安装Spool|iaasSpoolAction|简单环节|自动|
|安装Oracle|installOracleAction|简单环节|自动|
|安装QMDB|iaasQmdbAction|简单环节|自动|
|QMDB建业务表|oneClickQmdbScriptImportAction|集群模板|自动|
|安装ZCM|zcmInstallAction|集群模板|自动|
|导入项目|createProjectAction|简单环节|自动|
|导入zone|createZoneAction|简单环节|自动|
|导入云盘|createCloudDiskAction|简单环节|自动|
|导入网关|createGatewayClusterAction|简单环节|自动|
|导入基础集群|createBasicClusterAction|简单环节|自动|
|获取业务镜像信息|buildAllImageAction|简单环节|自动|
|上传业务镜像|oneClickImportImageAction|简单环节|自动|
|检测项目镜像|zcmCheckImageExistAction|简单环节|自动|
|安装启动ZOOKEEPER|oneClickZookeeperInstallAction|集群模板|自动|
|安装启动ZMQ|oneClickZmqInstallAction|集群模板|自动|
|安装启动ZCACHE|oneClickZcacheInstallAction|集群模板|自动|
|导入项目环境变量|importProjectEvnAction|简单环节|自动|
|导入数据库脚本|sccImportScriptAction|简单环节|自动|
|导入无状态应用|deploySaaSAppAction|简单环节|自动|
|导入有状态应用|deploySaaSStatefulAppAction|简单环节|自动|