# FAQ

**Q1**：一键部署工具是如何确定不同应用需要起多个容器的？

**A**：通过提供的镜像配置文件包里的**app.json**文件中的“**replicas**”的值来确定需要起几个

**Q2**：能否只部署一个产品，而不是全部部署？

**A**：可以只部署一个产品，只需要在`midware.xlsx`文件中只定义一个应用即可

**Q3**：云盘创建的大小在哪里配置的？

**A**：在“midware.xlsx”文件中的云盘定义的页签中新增了云盘大小的设置栏

**Q4**：技术组件的安装是在哪里定义的？

**A**：在“midware.xlsx”文件**midware deploy工作表**定义的

**Q5**：为什么charging产品有18个应用，但是共用同一个镜像？

**A**：根据charging产品不同应用的app.json文件中的`BUSINESS_TYPE`的值来拉起不同的进程，如下所示

```
{
    "attrId": 24968,
    "attrName": "BUSINESS_TYPE",
    "attrValue": "ABNS"
}
```

**Q6**：zmq，zookeeper，zcache已经安装了，如何删除后重新安装

**A**：执行下面的命令进行技术组件的删除操作

1&gt; 卸载zmq

```
rm -rf /opt/broker_slave /opt/broker_master /opt/zmq_namesrv && ps -ef|grep zmq|grep -v grep | awk  '{ printf ("sudo kill -9 %d \n", $2)}'  | sh;ps -ef |grep zmq
```

2&gt; 卸载zookeeper

```
rm -rf /opt/zookeeper && ps -ef|grep zookeeper|grep -v grep | awk  '{ printf ("sudo kill -9 %d \n", $2)}'  | sh;ps -ef|grep zookeeper
```

3&gt; 卸载zcache

```
1>su - zcache
2>执行 rc-destroy.sh
```

**Q7**：是否可以使用两台机器进行系统安装？

A：不可以，D-BEP整套系统**至少**需要**5个节点**，需要部署在5台不同的物理机上。

**Q8**：QMDB如何启动集群？  
A：  
1&gt; 停集群

```
mdbCluster admin/admin@ocs --oper stop --cluster
```

2&gt; 启动主管理节点进程:ocs为实例名，qmgr\_ocs/qmgr\_ocs为管理节点主机用户，密码

```
mdbcMgrServer -c ocs --server qmgr_ocs/qmgr_ocs@管理节点IP:管理端口
mdbcMgrServer -c ocs --server qmgr_ocs/qmgr_ocs@172.16.80.61:13110
```

3&gt; 启动集群

```
mdbCluster admin/admin@ocs --oper start --cluster
```

108机器的启动qmdb的命令如下：

```
su - qmgr_ocs
mdbcMgrServer -c ocs --server qmgr_ocs/qmgr_ocs@172.16.24.108:13110; 
mdbCluster admin/admin@ocs --oper start --cluster

su - qmgr_pcc
mdbcMgrServer -c pcc --server qmgr_pcc@172.16.24.108:13210;
mdbCluster admin/admin@pcc --oper start --cluster
```

---

## 一键部署各模块负责人：更新于20180911

| 模块名称 | 问题解决人 |
| :--- | :--- |
| 一键部署-IaaS | 王玉鹏 |
| 一键部署-IaaS-安装操作系统 | 王玉鹏 |
| 一键部署-IaaS-安装Keepalived | 王玉鹏 |
| 一键部署-IaaS-安装Spool | 王玉鹏 |
| 一键部署-IaaS-安装Oracle | 王玉鹏 |
| 一键部署-IaaS-安装QMDB | 王列豹/王玉鹏 |
| 一键部署-IaaS-QMDB初始化 | 闫其粹 |
| 一键部署-PaaS | 闫其粹 |
| 一键部署-PaaS-安装ZCM | 李林/杜家根 |
| 一键部署-PaaS-导入项目 | 金鑫 |
| 一键部署-PaaS-导入Zone | 金鑫 |
| 一键部署-PaaS-导入云盘信息 | 金鑫 |
| 一键部署-PaaS-导入网关 | 金鑫 |
| 一键部署-PaaS-导入基础集群\(有状态应用\) | 孙冉 |
| 一键部署-PaaS-获取业务镜像信息 | 闫其粹 |
| 一键部署-PaaS-上传业务镜像 | 闫其粹 |
| 一键部署-PaaS-同步业务镜像 | 闫其粹 |
| 一键部署-PaaS-检测业务镜像 | 闫其粹 |
| 一键部署-PaaS-安装并启动ZK | 闫其粹 |
| 一键部署-PaaS-安装并启动ZMQ | 闫其粹 |
| 一键部署-PaaS-安装并启动ZCACHE | 闫其粹 |
| 一键部署-SaaS | 程海明 |
| 一键部署-SaaS-导入项目环境变量 | 闫其粹 |
| 一键部署-SaaS-导入数据库脚本 | 昌龙 |
| 一键部署-SaaS-导入无状态应用 | 黄宇峰/季恒婧 |
| 一键部署-SaaS-导入有状态应用 | 孙冉 |



