# 一键部署-SFTP Server

## 基本信息

| ipaddress | username | password | workpath |
| :--- | :--- | :--- | :--- |
| 172.16.17.21 | appserver | appserver | /lvdata/appserver/kunpeng |


## 目录结构

```
[/lvdata/appserver/kunpeng]#tree
├── balc
│   ├── app
│   │   ├── balc-web-product.zip
│   └── sql
│       └── sql.zip
├── cbec
│   ├── app
│   │   ├── cbec.zip
│   └── sql
│       ├── config.json
│       ├── cpc_cbec_cpc_oracle.sql
│       └── sql.zip
├── charging
│   ├── app
│   │   ├── abnsession.zip
│   │   ├── batchrecycle.zip
│   │   ├── cdrgen.zip
│   │   ├── cdrindb.zip
│   │   ├── cdrsplit.zip
│   │   ├── cdrtrans.zip
│   │   ├── dataclean.zip
│   │   ├── dealtop.zip
│   │   ├── filegather.zip
│   │   ├── filerate.zip
│   │   ├── filerefund.zip
│   │   ├── oc.zip
│   │   ├── recmsgcc.zip
│   │   ├── recurrrate.zip
│   │   ├── recurrrefund.zip
│   │   ├── recycle.zip
│   │   ├── rerating.zip
│   │   ├── rulecache.zip
│   │   ├── sendmsg.zip
│   │   └── sy.zip
│   └── sql
│       └── sql.zip
├── cic
│   ├── app
│   │   └── cic-web-product.zip
│   └── sql
│       └── sql.zip
├── cpc
│   ├── app
│   │   ├── cpc-core-service.zip
│   │   └── cpc-core-web.zip
│   └── sql
│       └── sql.zip
├── custc
│   ├── app
│   │   ├── cust-core-service.zip
│   │   ├── cust-core-web.zip
│   │   ├── custview-core-service.zip
│   │   └── custview-core-web.zip
│   └── sql
│       └── sql.zip
├── IaaS.xlsx
├── jobserver
│   ├── app
│   │   └── jobserver.zip
│   └── sql
│       └── sql.zip
├── midware_dbepzcm.xlsx
├── midware_jx.xlsx
├── midware.xlsx
├── midware_yqc.xlsx
├── oc
│   ├── app
│   │   ├── oc-task-product.zip
│   └── sql
│       └── sql.zip
├── olc
│   ├── app
│   └── sql
├── payc
│   ├── app
│   │   └── payc-web-product.zip
│   └── sql
│       └── sql.zip
├── pos
│   ├── app
│   │   ├── pos-order-core-service.zip
│   │   └── pos-order-core-web.zip
│   └── sql
├── pot
│   ├── app
│   │   ├── uportal.zip
│   └── sql
│       └── sql.zip
├── spc
│   ├── app
│   │   └── spc.zip
│   └── sql
│       └── sql.zip
├── src
│   ├── app
│   └── sql
│       └── sql.zip
└── tp
    ├── app
    │   ├── tp.zip
    └── sql
        └── sql.zip

76 directories, 93 files
```

## 解释说明

* `/lvdata/appserver/kunpeng`目录是一键部署工具获取安装包的主目录
* 目录结构是按照**产品**来建立的，其下包含app和sql两目录，分别用来存放应用配置包和数据库脚本包，具体结构解释如下

    ```
    ── tp     ##产品名称，此名称和部署模板中的app info页签的product_name字段需要是一致的，否则无法获取其中的配置
        ├── app  ##应用目录，有几个应用，就会有几个zip文件
        │   ├── tp.zip   ##名称为tp的应用压缩文件
        └── sql   ##存放脚本文件
            └── sql.zip   ##sql.zip文件中，除了包含原有的sql文件，还需要有sql执行的配置文件config.json
    ```

### app目录应用配置zip说明
* app目录下只有zip文件是有效的，子目录与其他格式的文件都是无效的
* 应用配置压缩包的名字需要与应用名一致

```bash
├── cpc-core-web.zip
└── zcm-app-20180714204636    ##cpc-core-web.zip解压后的目录名
    └── cpc-web-core         ##此处的名称，需要与压缩包的名称相同
        ├── app
        │   └── app.json
        └── config
            └── project
                ├── CPC_CORE_WEB
                │   ├── cache_config.properties
                │   ├── cache.properties
                │   ├── dubbo.properties
                │   ├── ftp.properties
                │   ├── interface.properties
                │   ├── jdbc.properties
                │   └── mq.properties
                └── CPC_CORE_WEB_ETC
                    ├── coreConfig.properties
                    └── logback.xml
```

### sql目录`config.json`文件说明
* sql目录下只有zip文件是有效的，子目录与其他格式的文件都是无效的
* zip包的名字必须是**sql.zip**
* **sql.zip**中需要包含`数据库脚本文件`和`config.json`配置文件 
* 配置文件**config.json**的解释如下

```
[
{
  "fileSeq": 1,    ## value值需要唯一，只是序号的作用
  "dataSourceType": "oracle",   ## 数据库类型
  "url": "jdbc:oracle:thin:@172.16.24.148:1521:dbepdb",  ## 连接是数据库连接串
  "username": "cpc",  ## 数据库用户
  "password": "cpc",  ## 数据库用户密码
  "sqlFileList": [  ## 需要执行的sql文件列表，有多个sql文件时，以{}为间隔进行配置
    {
     "fileName": "cic_cic_cic_oracle.sql",  ## 需要执行的sql文件
      "seqnum": 1  ## 执行sql的顺序，有多个sql时决定执行顺序
    },
    {
     "fileName": "cic_cic_cic_oracle_2.sql",  ## 需要执行的sql文件
      "seqnum": 2  ## 执行sql的顺序，有多个sql时决定执行顺序
    }
  ]
},
{
  "fileSeq": 2,  ## 这里做区分成两个，是因为两个文件执行到两个不同的数据库，需要用一级的{}
  "dataSourceType": "oracle",
  "url": "jdbc:oracle:thin:@172.16.24.148:1521:dbepdb",
  "username": "cpc_flow",
  "password": "cpc_flow",
  "sqlFileList": [
    {
      "fileName": "CPC_CPC-FLOW_cpc_flow_oracle.sql",
      "seqnum": 1
    }
  ]
}
]
```



