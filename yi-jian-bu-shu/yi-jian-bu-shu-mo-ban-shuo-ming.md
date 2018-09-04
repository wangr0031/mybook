# 一键部署模板说明

## 1. IAAS 部署模板(iaas.xlsx)
---

> **\[info\] 提示**
> 
> 模板过于复杂，请咨询公司系统集成人员

## 2. PAAS&SAAS 部署模板(midware.xlsx)
---

> **\[info\] 说明**
> **midware.xlsx**部署模板文件在Paas和Saas的部署中会使用到
>
> 部署模板文件中需要关注的页签在下文中会详细说明

### 模板文档名称

* 模板文件名称统一为`midware.xlsx`
* 模板文件中各**工作表名称**和**各工作表中字段名称**不能修改

### db info

* **db info页签**是数据库的基础配置信息，各个字段的说明如下
  * `midware_name`：每条数据库配置的别名，在填写**app midware工作表**中的`midware_name`时，填写的内容需要在这里有定义
  * `db_name`：数据库的**service\_name**或**SID**
  * `midware_type`：中间件类型，目前只支持**ORACLE**(注意大写)
  * `ip`：数据库的IP地址或域名
  * `port`：数据库的TCP监听端口号
  * `schema`：数据库实例名
  * `username`：数据库用户名
  * `password`：数据库用户名对应的密码

### midware deploy

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
  |ZCM|**ZCM**|ZCM\_VIR\_IP|ZCM平台部署需要的虚拟IP地址|


### app info

* **app info页签**是应用信息
  * `app_name`：应用名称，与**app midware工作表**的`app_name`字段需要一致,**同时此字段和sftp服务器上的app目录下的zip文件名也要一致**
  * `product_name`：产品名称，与**app midware页签**的`product_name`字段需要一致，**同时此字段和sftp服务器上的目录名也要一致**
  * `app\_type`：应用的类型，分为有状态应用(statefull)和无状态应用(stateless)
  * `seq`：数据库脚本执行的顺序，指定不同产品的脚本的执行先后顺序
  * `project_code`：项目code，在应用配置导入时会根据项目code进行导入
  * `tenant_code`：租户code，暂时没有使用
  * `load_balancer_port`：决定在导入应用时，业务网关导入到哪个业务网关端口中（默认请填写**80**）

### app midware

> **\[danger\] 重要**
>
> **config\_attr\_value**与**midware\_name**不能全部为空，至少需要有一个有值，当两者都有值时**config\_attr\_value**优先级最高

* **app midware**是应用配置信息
  * `product_name`：与**app info工作表**的`product_name`一致，作用也是一样的
  * `app_name`：与**app info工作表**的`app_name`一致
  * `midware_type`：目前支持ORACLE、DUBBO、ZCACHE、ZMQ、ZOOKEEPER、QMDB
  * `config_attr_key`：需要匹配替换的配置项的key值
  * `config_attr_value`：如果这一栏填写了value，程序就不会去**db info工作表**和**midware info工作表**拼接数据
  * `midware_name`：与**db info工作表**或**midware deploy工作表**的`midware_name`一致，程序会以此来拼接出实际的值
  * `config_type`:配置类型，目前仅支持CFG
    > **\[info\] 说明**
    >
    > 例1：如果**midware\_type**是ORACLE且**config\_attr\_key**是jdbc，程序在匹配替换时，会自动匹配成“`jdbc.url`、`jdbc.username`、`jdbc.password`”三个key进行替换
    >
    > 例2：如果**midware\_type**是DUBBO且**config\_attr\_key**是dubbo.registry.address,程序会根据配置获取到设置的值，格式为**zookeeper://172.16.80.44:2181?backup=172.16.80.45:2181,172.16.80.46:2181**
    >
    > 例3：如果**midware\_type**是ZOOKEEPER且**config\_attr\_key**是dubbo.registry.address,程序会根据配置获取到设置的值，格式为**172.16.80.44:2181,172.16.80.45:2181,172.16.80.46:2181**
    >
    > 例4：如果**midware\_type**是QMDB时，需要在**config\_attr\_value**字段中填写

### project env

* **project env工作表**是Charging产品用到的环境变量，但是其他不用环境变量的应用容器中，依旧也会有这些环境变量的定义
  * `project`：**project code**，程序会将项目环境变量导入的填写的项目code中
  * `key`：环境变量的key值
  * `value`：环境变量的value值
  * 环境变量的说明：
    
    |变量名称|变量说明|
    |:-|:-|
    |CC_USER_NAME|cpc用户名，一般情况为cpc|
    |CC_PASSWORD|**cpc数据库密码加密**|
    |CC_DSN|cpc对应dsn名称，可以不改|
    |CC_DB_TYPE|cpc对应数据库类型|
    |RB_USER_NAME|rb用户名，一般情况为rb|
    |RB_PASSWORD|**rb数据库密码加密**|
    |RB_DSN|rb对应dsn名称，可以不改|
    |RB_DB_TYPE|rb对应数据库类型|
    |CUSTCACHE_DS_NAME|zcache地址，只需要填写一个，如127.0.0.1：8001|
    |CUSTCACHE_SET_DS_NAME|zcache地址，只需要填写一个，如127.0.0.1：8001|
    |MDB1_DS_NAME|qmdb信息，格式DSN 空格 ip:port（注意是管理端口），例如ocs 172.16.80.41:13110|
    |MDB1_USER_NAME|qmdb ocs的用户名，一般情况为ocs，不需要改|
    |MDB1_PASSWORD|**qmdb密码，需要密码加密**|
    |MDB1_DIRECT_DS_NAME|qmdb的ocs实例名，一般情况为ocs，不需要改|
    |MQ_NAMESRV_ADDR|zmq地址|
    |zookeeper_connection_string|zk地址|
    |CC_ORACLE_HOST|cpc数据库ip|
    |CC_ORACLE_PORT|cpc数据库port|
    |CC_ORACLE_SERVICE_NAME|cpc数据库服务名|
    |RB_ORACLE_HOST|rb数据库ip|
    |RB_ORACLE_PORT|rb数据库port|
    |RB_ORACLE_SERVICE_NAME|rb数据库服务名|
    |SRC_CDR_PATH|话单目录，无特别要求，保留默认值|
    |SRC_ERR_CDR_PATH|错单目录，无特别要求，保留默认值|
    |CUSTCACHE_PASSWORD|zcache密码需要加密，默认留空，有需要再填值|
    |CUSTCACHE_SET_PASSWORD|zcache密码需要加密，默认留空，有需要再填值|
    |CLEAN_DATA_DURATION|默认留空，有需要再填值|
    |RATE_DATE|默认留空，有需要再填值|

### project
* **project工作表**是在paas安装时，会根据这里的配置信息进行项目的创建
  * `tenant_code`：租户code，固定使用
  * `project_code`：项目code
  * `project_name`：项目名称，最好保持和code一致
  * `paas_platform`：固定使用`zpaas`,不需要做变更
  
### zone
* **zone工作表**是在paas安装时，会根据这里的配置信息进行zone的创建，用来均衡应用的部署
  * `zone_name`：固定使用，可以不做变更
  * `project_code`：和之前定义的`project_code`一致
  * `machine_ip_list`：需要添加入zone中的实际的物理IP

### gateway cluster
* **gateway cluster工作表**是用来在paas安装时，在ZCM系统中创建业务网关，统一IP访问
  * `cluster_name`：业务网关的名称
  * `project_code`：和之前定义的`project_code`一致
  * `machine_ip_list`：由Iaas安装的时候规划和提供
  * `vip`：Iaas安装时分配给zcm的浮动IP
  > 支持**vip**和**machine_ip_list**使用相同的值

### cloud disk

* **cloud disk工作表**是在paas安装时，会将Iaas创建的云盘注册进zcm系统，应用使用云盘时，会从这里获取
  * `tenant_code`：租户code，固定使用
  * `project_code`：项目code
  * `pool_name`：随便定义，建议名称具有意义
  * `machine_ip_list`：Iaas创建云盘同时提供IP
  * `user_name`：暂时没有用到，不能为空
  * `password`：暂时没有用到，不能为空
  * `cloud_disk_name`：云盘的名称，Iaas创建并提供
  * `size`：暂时没有用到，不能为空，需要为数字





