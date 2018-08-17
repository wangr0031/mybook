# 一键部署-PAAS

> **[info] 输入/输出**
> 
> 输入：一键部署模板
> 
> 输出：每步动作安装状态和结果，MQ Topic创建

## PAAS层部署步骤细分如下：

* ### ZCM、ZCAMP的安装与启动
  * 安装云平台所需的程序
 
* ### 导入项目
  * 通过读取模板文件`midware.xls`中的`zone`页签中的配置创建Zone
   
* ### 创建Zone

* ### 创建云盘信息
  * 通过读取模板文件`midware.xls`中的`cloud disk`页签中的配置，创建需要的云盘和对应的云盘大小

* ### 创建网关
  * 通过读取模板文件`midware.xls`中的`gateway cluster`页签中的配置进行创建网关
  * **machine\_ip\_list**和**vip**字段填入的数值是zcm的k8s的node节点的物理IP

* ### 获取业务镜像信息

* ### 上传业务镜像

* ### 检测项目镜像

* ### 安装启动ZOOKEEPER

* ### 安装启动ZMQ

* ### 安装启动ZCACHE







