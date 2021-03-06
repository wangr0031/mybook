# 一键部署-所内部署

> **\[success\] 说明**
>
> 此部署模式适用于所内部署V9项目环境或共用已有ZCM的部署模式
>
> 此部署模式为简略版一键部署，采用简略版的一键部署模式进行环境部署,分为如下几步：
> 
> **1.** 部署中间件(ZK、ZMQ、ZCACHE)
>
> **2.** 部署SAAS层(导入项目环境变量-> 导入数据库脚本 -> 导入无状态应用 -> 导入有状态应用 )

## 基于空环境的部署
### 部署前准备
* 从CMO处获取版本并按照一键部署的目录结构进行目录整理和json文件生成，详细请参考：[一键部署-SFTP说明](/yi-jian-bu-shu/yi-jian-bu-shu-sftp-server.md)
* 获取安装中间件的主机信息(如果是主机版中间件可以不用提前安装，容器版需要提前安装完毕)
* 获取数据库的主机信息，QMDB的主机信息(需要**提前安装**完毕)
* 修改`midware.xlsx`模板文件中的**数据库**，**中间件**，**QMDB**的配置信息
* 修改`midware.xlsx`模板文件中的**项目环境变量**信息


### 部署中间件
简略版部署中间件分为`主机版中间件`和`容器版中间件`
**主机版中间件**的安装需要通过`midware.xlsx`模板文件配置进行安装
**容器版中间件**的安装可以联系ZCM的管理员帮忙创建，但是仍需要更新`midware.xlsx`模板文件(在导入应用阶段会根据此模板中的内容进行配置项替换)

### 部署SAAS层
此处的步骤内容可以参考：[一键部署-SAAS](/yi-jian-bu-shu/yi-jian-bu-shu-saas.md)

## 基于非空环境的部署
基于非空环境的部署常常出现在CD流程中反复测试部署流程的稳定性，因此在部署前需要将之前的旧数据清理掉，之后的安装步骤与基于空环境的部署一样
### 清空环境中的旧数据（顺序）
1. 清理中间件
2. 清理ZCM中的无状态应用
3. 清理ZCM中的有状态应用
4. 清理ZCM中的应用配置
5. 清理ZCM中的网关
6. 清理ZCM中的云盘的内容
7. 清理Oracle数据库中的数据



