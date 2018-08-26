# 一键部署模板说明

## 1. IAAS 部署模板

> **\[info\] 提示**
> 
> 模板过于复杂，请咨询公司系统集成人员

## 2. PAAS&SAAS 部署模板

在部署业务系统时，需要**关注**部署模板中的产品名称、应用名称与SFTP上的压缩包的名称以及应用的名称是否一致

### 模板文档名称

* 组件&应用一键部署模板\(全中心应用\).xlsx或其他约定好的名称

### db\_info页签

* **db\_info页签**是数据库的配置信息，各个字段的说明如下
  * `midware_name`：此处需要与**app midware页签**中的`midware_name`字段的内容一致
  * `db_name`：数据库的service\_name
  * `midware_type`：中间件类型，目前只支持oracle
  * `ip`：数据库ip地址
  * `port`：数据库的TCP端口号
  * `schema`：数据库实例
  * `username`：数据库用户名
  * `password`：数据库用户名对应的密码

### midware deploy页签

* **midware deploy页签**里面配置的是中间件以及ZCM的信息，需要注意修改`attr_value`字段的ip地址
  * `midware_name`：此处需要与**app\_midware页签**的`midware_name`字段的内容一致
  * `midware_type`：中间件类型，一般不用修改
  * `attr_value`：一般需要修改`attr_code=HOST_INFO`的ip地址

### app info页签

* **app info页签**是应用信息
  * `app_name`：应用名称，与**app\_midware页签**的`app_name`字段需要一致,**同时此字段和sftp服务器上的app目录下的zip文件名也要一致**
  * `product_name`：产品名称，与**app\_midware页签**的`product_name`字段需要一致，**同时此字段和sftp服务器上的目录名也要一致**
  * `image_name`：镜像名称，由CMO提供，目前不使用该字段
  * `project_code`：项目名称，在应用配置导入时会根据项目code进行导入
  * `load_balancer_port`：决定在导入应用时，业务网关导入到哪个业务网关端口中（默认请填写**80**）

### app midware页签

> **\[danger\] 重要**
>
> **config\_attr\_value**与**midware\_name**不能全部为空，至少需要有一个有值，当两者都有值时**config\_attr\_value**优先级最高

* **app midware页签**是应用组件配置信息，`old_app_name`字段无效，只是临时比较字段，后期可能会删除
  * `product_name`：与**app info页签**的`product_name`一致
  * `app_name`：与**app info页签**的`app_name`一致
  * `midware_type`：目前支持ORACLE、DUBBO、ZCACHE、ZMQ、ZOOKEEPER、QMDB
  * `config_attr_key`：需要匹配替换的配置项的key值
  * `config_attr_value`：如果这一栏填写了value，程序就不会去**db\_info页签**和**midware\_info页签**拼接数据
  * `midware_name`：与**db\_info页签**或**midware\_deploy页签**的`midware_name`一致，程序会以此来拼接出实际的值
  * `config_type`:配置类型，目前仅支持CFG
    > **\[info\] 说明**
    >
    > 例1：如果**midware\_type**是ORACLE且**config\_attr\_key**是jdbc，程序在匹配替换时，会自动匹配成“`jdbc.url`、`jdbc.username`、`jdbc.password`”三个key进行替换
    >
    > 例2：如果**midware\_type**是DUBBO且**config\_attr\_key**是dubbo.registry.address,程序会根据配置获取到设置的值
    >
    > 例3：如果**midware\_type**是QMDB时，需要在**config\_attr\_value**中填写

### project\_env页签

* **project\_env页签**是Charging产品用到的环境变量，但是其他不用环境变量的应用中，依旧也会有这些环境变量

### cloud disk页签

* **cloud disk页签**用来配置需要创建哪些云盘和对应的云盘大小
  * `cloud_disk_name`：云盘的名称
  * `size`：云盘的大小

> **\[info\] 说明**
>
> 在安装PAAS的时候会读取此处的配置信息进行云盘创建，在应用部署的时候，会读取**app.json**文件中的云盘挂载路径进行挂载

### project页签

