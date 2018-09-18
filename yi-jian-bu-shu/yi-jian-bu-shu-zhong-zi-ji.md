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



