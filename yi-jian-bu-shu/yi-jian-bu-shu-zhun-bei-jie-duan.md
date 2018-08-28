# 一键部署-准备阶段

* **机房设施配置**：SN号抄录，BIOS设置，网络设置，磁阵配置

* **YUM源和FTP文件服务器安装**：在所内提供的ISO镜像文件包中会包含，用作后续软件安装的软件仓库

* **一键部署工具安装**：部署工具安装在种子机，种子机与机房中的待安装机器网络是联通的

* [**导入基础文件包到FTP**](/yi-jian-bu-shu/sftp-server.md)：数据库脚本包、应用配置文件包、组件配置文件包等

* [**一键部署模板**](/yi-jian-bu-shu/yi-jian-bu-shu-mo-ban-shuo-ming.md)：根据实际项目部署文档进行填写\(iaas.xlsx和midware.xlsx\)

> **\[info\] 种子机准备步骤**
>
> **1. **种子机操作系统安装
>
> **2. **种子机主机名称修改
>
> **3. **安装Chrony，配置时间服务器，后续安装待安装机器需要以种子机作为NTP同步时间
>
> **4. **上传APP包，并配置YUM源
>
> **5. **启动SIMs系统
>
> **6. **安装并启动一键部署系统\([http://种子机IP地址:8080/appmgr-web/zcmPortalIndex.html](http://172.16.80.101:8080/appmgr-web/zcmPortalIndex.html)\)



