# 一键部署-SFTP Server
---

## 基本信息

| ipaddress | username | password | workpath |
| :--- | :--- | :--- | :--- |
| sftp地址 | sftp用户名 | sftp用户密码 | /lvdata/appserver/kunpeng |


## 目录结构

```
[/lvdata/appserver/kunpeng]#tree 
├── app_stateful
│   ├── med
│   │   └── app
│   │       └── med-backend-product.zip
│   ├── olc
│   │   └── app
│   │       └── olc-all-product.zip
│   └── sett
│       └── app
│           └── sett-backend-product.zip
├── app_stateless
│   ├── balc
│   │   ├── app
│   │   │   └── balc-web-product.zip
│   │   └── sql
│   │       ├── balc_product_balc_bc_oracle.sql
│   │       ├── balc_product_init_balc_bc_oracle.sql
│   │       ├── config.json
│   │       └── sql.zip
│   ├── bcc
│   │   ├── app
│   │   │   └── bcc-all-product.zip
│   │   └── sql
│   │       ├── bcc_product_ebc_ebc_oracle.sql
│   │       ├── config.json
│   │       └── sql.zip
│   ├── charging
│   │   ├── app
│   │   │   ├── charging-abnsession-product.zip
│   │   │   ├── charging-cdrgen-product.zip
│   │   │   ├── charging-cdrindb-product.zip
│   │   │   ├── charging-cdrsplit-product.zip
│   │   │   ├── charging-cdrtrans-product.zip
│   │   │   ├── charging-dealtop-product.zip
│   │   │   ├── charging-filegather-product.zip
│   │   │   ├── charging-filerate-product.zip
│   │   │   ├── charging-filerefund-product.zip
│   │   │   ├── charging-ocims-product.zip
│   │   │   ├── charging-ocin-product.zip
│   │   │   ├── charging-ocismp-product.zip
│   │   │   ├── charging-oc-product.zip
│   │   │   ├── charging-ocps-product.zip
│   │   │   ├── charging-ocsms-product.zip
│   │   │   ├── charging-recurrrate-product.zip
│   │   │   ├── charging-recurrrefund-product.zip
│   │   │   ├── charging-recycle-product.zip
│   │   │   ├── charging-rerating-product.zip
│   │   │   ├── charging-rulecache-product.zip
│   │   │   ├── charging-sendmsg-product.zip
│   │   │   ├── charging-service-product.zip
│   │   │   ├── charging-sy-product.zip
│   │   │   └── charging-tool-product.zip
│   │   └── sql
│   │       ├── charging_product_all_rb_oracle.sql
│   │       ├── config.json
│   │       └── sql.zip
│   ├── cic
│   │   ├── app
│   │   │   ├── cic-createtable-product.zip
│   │   │   ├── cic-indb-product.zip
│   │   │   ├── cic-ussd-product.zip
│   │   │   └── cic-web-product.zip
│   │   └── sql
│   │       ├── cic_product_all_cic_oracle.sql
│   │       ├── config.json
│   │       └── sql.zip
│   ├── cpc
│   │   ├── app
│   │   │   ├── cpc-cbec-product.zip
│   │   │   ├── cpc-service-product.zip
│   │   │   ├── cpc-tp-product.zip
│   │   │   ├── cpc-uos-product.zip
│   │   │   └── cpc-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── cpc_core_cpc_cpc_flow_oracle.sql
│   │       ├── cpc_core_cpc_cpc_oracle.sql
│   │       ├── cpc_core_init_cpc_cpc_oracle.sql
│   │       ├── cpc_product_cbec_cpc_oracle.sql
│   │       ├── cpc_product_cpc_cpc_oracle.sql
│   │       ├── cpc_product_init_cpc_cpc_oracle.sql
│   │       ├── cpc_product_tp_cpc_oracle.sql
│   │       └── sql.zip
│   ├── csc
│   │   ├── app
│   │   │   ├── csc-bpm-product.zip
│   │   │   └── csc-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── csc_prodcut_init_web_oc_oracle.sql
│   │       ├── csc_product_all_oc_oracle.sql
│   │       ├── csc_product_bpm_oc_oracle.sql
│   │       └── sql.zip
│   ├── custc
│   │   ├── app
│   │   │   ├── custc-custservice-product.zip
│   │   │   ├── custc-custviewservice-product.zip
│   │   │   ├── custc-custviewweb-product.zip
│   │   │   └── custc-custweb-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── custc_core_custc_custc_oracle.sql
│   │       ├── custc_core_init_custc_custc_oracle.sql
│   │       ├── custc_core_init_ftf_oracle.sql
│   │       ├── custc_product_custc_custc_oracle.sql
│   │       ├── custc_product_init_custc_custc_oracle.sql
│   │       └── sql.zip
│   ├── dabp
│   │   ├── app
│   │   │   └── dabp-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── dabp_product_bp_stbp_oracle.sql
│   │       ├── dabp_product_dap_dap_oracle.sql
│   │       ├── dabp_product_init_bp_stbp_oracle.sql
│   │       ├── dabp_product_init_dap_dap_oracle.sql
│   │       └── sql.zip
│   ├── drm
│   │   ├── app
│   │   │   └── drm-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── drm_product_drm_drm_oracle.sql
│   │       └── sql.zip
│   ├── eshop
│   │   ├── app
│   │   │   └── eshop-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── eshop_product_all_cic_oracle.sql
│   │       └── sql.zip
│   ├── irc
│   │   ├── app
│   │   │   ├── irc-ar-product.zip
│   │   │   ├── irc-bmc-product.zip
│   │   │   ├── irc-co-product.zip
│   │   │   ├── irc-inv-product.zip
│   │   │   ├── irc-prof-product.zip
│   │   │   └── irc-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── irc_bpm_ab_oracle.sql
│   │       ├── irc_product_all_ab_oracle.sql
│   │       ├── irc_product_all_inv_oracle.sql
│   │       └── sql.zip
│   ├── jobserver
│   │   ├── app
│   │   │   └── jobserver-all-core.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── Jobserver_core_all_ftf_oracle.sql
│   │       └── sql.zip
│   ├── med
│   │   ├── app
│   │   │   └── med-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── med_prodcut_all_med_oracle.sql
│   │       └── sql.zip
│   ├── oc
│   │   ├── app
│   │   │   ├── oc-lifecycle-product.zip
│   │   │   ├── oc-service-product.zip
│   │   │   ├── oc-spc-product.zip
│   │   │   └── oc-task-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── oc_core_init_oc_oc_oracle.sql
│   │       ├── oc_core_oc_oc_oracle.sql
│   │       ├── oc_product_init_oc_oc_oracle.sql
│   │       ├── oc_product_oc_oc_oracle.sql
│   │       ├── oc_product_spc_oc_oracle.sql
│   │       └── sql.zip
│   ├── olc
│   │   └── app
│   ├── payc
│   │   ├── app
│   │   │   └── payc-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── payc_product_init_payc_bc_oracle.sql
│   │       ├── payc_product_payc_bc_oracle.sql
│   │       └── sql.zip
│   ├── pcrf
│   │   ├── app
│   │   │   ├── pcrf-cloudapp-new-product.zip
│   │   │   ├── pcrf-pcrf-new-product.zip
│   │   │   ├── pcrf-phub-new-product.zip
│   │   │   ├── pcrf-rulecache-new-product.zip
│   │   │   ├── pcrf-shub-new-product.zip
│   │   │   ├── pcrf-spr-new-product.zip
│   │   │   └── pcrf-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── pcrf_product_all_pcb_oracle.sql
│   │       ├── pcrf_product_all_pcc_oracle.sql
│   │       ├── pcrf_product_init_all_pcc_oracle.sql
│   │       └── sql.zip
│   ├── pos
│   │   └── app
│   │       └── pos-web-product.zip
│   ├── pot
│   │   ├── app
│   │   │   └── pot-uportal-core.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── grant_core_init_ftf_oracle.sql
│   │       ├── menu_oracle.sql
│   │       ├── pot_core_init_uportal_ftf_oracle.sql
│   │       ├── pot_core_uportal_ftf_oracle.sql
│   │       └── sql.zip
│   ├── sett
│   │   ├── app
│   │   │   └── sett-web-product.zip
│   │   └── sql
│   │       ├── config.json
│   │       ├── sett_prodcut_bf_sett_oracle.sql
│   │       ├── sett_prodcut_init_sett_oracle.sql
│   │       ├── sett_prodcut_tf_sett_oracle.sql
│   │       ├── sett_product_all_sett_oracle.sql
│   │       └── sql.zip
│   └── src
│       ├── app
│       │   └── src-web-product.zip
│       └── sql
│           ├── config.json
│           ├── sql.zip
│           └── src_product_all_src_oralce.sql
├── iaas.xlsx
└── midware.xlsx

69 directories, 161 files
```

## 解释说明

* `/lvdata/appserver/kunpeng`目录是一键部署工具获取安装包的主目录
* 目录结构是按照有状态应用和无状态应用创建两个目录
* `app_stateful`是存放有状态应用的应用配置
* `app_stateless`是存放无状态应用的应用配置和脚本包
* 在`app_stateful`或`app_stateless`目录下按照**产品**来建立的，其下包含app和sql两目录，分别用来存放应用配置包和数据库脚本包，具体结构解释如下

    ```
  ├── balc  ##产品名称，此名称和部署模板中的app info工作表的product_name字段需要是一致的,否则无法获取其中的配置
  │   ├── app  ##应用目录，有几个应用，就会有几个zip文件
  │   │   └── balc-web-product.zip  ##名称为balc-web-product的应用压缩文件
  │   └── sql  ##存放脚本文件
  │       ├── balc_product_balc_bc_oracle.sql
  │       ├── balc_product_init_balc_bc_oracle.sql
  │       ├── config.json
  │       └── sql.zip ##sql.zip文件中,除了包含原有的sql文件,还需要有sql执行的配置文件config.json
    ```

### app目录`应用配置zip` 说明
* **app**目录下只有zip文件是有效的，子目录与其他格式的文件都是无效的
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

### sql目录`config.json` 文件说明
* sql目录下只有zip文件是有效的，子目录与其他格式的文件都是无效的
* zip包的名字必须是**sql.zip**
* **sql.zip**中需要包含`数据库脚本文件`和`config.json`配置文件 
* 配置文件**config.json**的解释如下

```
[
{
  "fileSeq": 1,    ## value值需要唯一，只是序号的作用
  "dataSourceType": "oracle",   ## 数据库类型
  "url": "jdbc:oracle:thin:@172.16.24.148:1521:dbepdb",  ## 连接是数据库连接串,注意是用冒号":"
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



