# 一键部署模板说明

## 1. IAAS 部署模板(iaas.xlsx)

> **\[info\] 提示**
> 
> 模板过于复杂，请咨询公司系统集成人员

## 2. PAAS&SAAS 部署模板(midware.xlsx)

> **\[info\] 说明**
> **midware.xlsx**部署模板文件在Paas和Saas的部署中会使用到
>
> 部署模板文件中需要关注的页签在下文中会详细说明

### 模板文档名称

* 模板文件名称统一为`midware.xlsx`
* 模板文件中各工作表名称和各工作表中字段名称**不能修改**

### db info页签

* **db info页签**是数据库的基础配置信息，各个字段的说明如下
  * `midware_name`：每条数据库配置的别名，在填写**app midware工作表**中的`midware_name`时，填写的内容需要在这里有定义
  * `db_name`：数据库的**service\_name**或**SID**
  * `midware_type`：中间件类型，目前只支持**ORACLE**(注意大写)
  * `ip`：数据库的IP地址
  * `port`：数据库的TCP监听端口号
  * `schema`：数据库实例名
  * `username`：数据库用户名
  * `password`：数据库用户名对应的密码

### midware deploy页签

* **midware deploy页签**里面配置的是中间件以及ZCM的信息，需要注意修改`attr_value`字段的ip地址
  * `midware_name`：中间件配置别名，在填写**app midware工作表**中`midware_name`时，填写的内容需要在这里有定义
  * `midware_type`：中间件类型，一般不用修改且是**大写**，此处与**app midware工作表**中的`midware_type`对应
  * `role_code`：安装中间件和ZCM时，各个组的名称，**不需要修改**
  * `attr_code`：安装中间件和ZCM时，各项所需要的参数名
  * `attr_value`：与`attr_code`对应的**value**值
    * **attr_value填写说明**
  
  |midware\_type|role\_code|attr\_code|attr\_value 说明|
  |:|:-|:-|:-|
  |ZCACHE|ZCACHE|**HOST_INFO**|按照(IP地址：用户名：密码)的顺序进行填写，用户名一般填root|
  |ZMQ|**CLUSTER\_ATTR\_CODE**|ZOOKEEPER\_SERVER\_LIST|按照(ip地址：zookeeper端口号;ip地址：zookeeper端口号;ip地址：zookeeper端口号)格式，填写zookeeper的集群地址信息|
  |ZMQ|**NAMESRV**|HOST\_INFO|按照(IP地址：用户名：密码)的顺序进行填写，用户名一般填root|
  |ZMQ|**BROKER\_MASTER**|HOST\_INFO|按照(IP地址：用户名：密码)的顺序进行填写，用户名一般填root|
  |ZMQ|**BROKER\_SLAVE**|HOST\_INFO|按照(IP地址：用户名：密码)的顺序进行填写，用户名一般填root|
  |ZOOKEEPER|**ZOOKEEPER**|HOST\_INFO|按照(IP地址：用户名：密码)的顺序进行填写，用户名一般填root|
  |ZCM|**ZCM**|HOST\_INFO||
  |ZCM|**ZCM**|HUBOR\_HOST||
  |ZCM|**ZCM**|ZCM\_HOST||
  |ZCM|**ZCM**|ZCM\_VIR\_IP||


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

