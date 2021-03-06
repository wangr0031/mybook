# 种子机说明

## 种子机部署步骤

> **\[info\] 种子机准备步骤**
>
> **1. **种子机操作系统，docker和镜像仓库安装
>
> **2. **种子机主机名称修改
>
> **3. **安装Chrony，配置时间服务器，后续安装待安装机器需要以种子机作为NTP同步时间
>
> **4. **上传APP包，并配置YUM源
>
> **5. **安装并启动一键部署系统 [http://种子机IP地址:8080/appmgr-web/zcmPortalIndex.html]

## 压缩镜像解压缩到种子机
* 在`/root/image`目录下检查是否有`docker_restore.py`和`tar-split`和`restore.sh`文件，这三个文件不能缺少
* 在`/root/image`目录下创建子目录，如`unzip_20180918`
* 将压缩镜像文件(**images.squashfs** 和 **restore_layers.sh**)拷贝到`/root/image/unzip_20180918`目录下
* 在`/root/image`目录下执行命令`restore.sh unzip_20180918`即可解压镜像压缩文件

## 一键部署步骤失败手动解决后跳过该步骤
* 登录一键部署数据库(Mysql)
* 切换到用户**zcamp_common_process**下
* 执行如下命令，查询当前步骤状态

```
select id,ins_process_id,name,action,created_date,start_date,end_date,state,state_desc
from cp_ins_task
order by id desc limit 20;
```
* 将需要跳过的步骤的`action`修改为**successAction**
![](/images/oneclickdeploy/zhong-zi-ji-mysql1.png)

> **\[info\] Tips**
>
> 如果界面**重新部署**按钮出不来，可以先把`cp_ins_process` 表的`state`改成**P**
>
> 在通过历史界面进入，此时按钮将会展现，然后再将状态改回为F
>

## 点击开始按钮后，界面报主键冲突错误
* 登录到一键部署工具后台，查看`bussiness.log`日志，一般会在里面查看到对应的是哪个表主键冲突了
* 修改`am_table_seq`表中记录的对应表的序列，可以修复因为序列重复而出现的主键冲突错误。

```
select * from am_table_seq where table_name=upper('cp_ins_task');
```




