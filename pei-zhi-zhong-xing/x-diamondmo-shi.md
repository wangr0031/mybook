# x-Diamond模式
  K-V模式是针对JAVA的细粒度配置项管理方案，业务应用需要引入ZCMConfig的JAVA依赖，并依据规范详细配置
## 配置说明
* ### 创建KV配置组
   选择K-V模式，输入信息，创建K-V配置组
   
![](/pei-zhi-zhong-xing/kv-chuang-jian-1.png)

* ### 配置项的增删改查
   配置项支持增删改查和批量操作
   
   ![](/pei-zhi-zhong-xing/kv-zeng-shan-gai-cha.png)

* ### 配置项的跨配置组复制
  配置项支持跨配置组复制，需要注意的是，配置项需要在对应的配置组中是唯一的，无能有重复，否则会复制失败
  
  ![](/pei-zhi-zhong-xing/kv-kua-pei-zhi-zu-fu-zhi.png)
  
* ### 查询配置项修改历史
   配置项的修改历史，都是依次入库的，可以在界面查询到详细信息
   
   ![](/pei-zhi-zhong-xing/kv-cha-kan-li-shi.png)

## 接入说明
* ### 基本流程
![](/pei-zhi-zhong-xing/kv-jie-ru-yuan-li.png)

* ### 应用接入
x-Diamond模式，新建应用时，映射配置到应用中，只有一种，即选择配置组进行映射

![](/pei-zhi-zhong-xing/kv-ying-yong-jie-ru-1.png)


## 配置规范
客户端在做接入时需要调整配置文件中两个bean的配置，涉及组标识groupId（用于区分产品域）、组件标识artifactId（用于区分产品）、profile（用于区分环境），需要遵循的取值原则如下：

* 组标识groupId：主要配置区分产品域，根据不同产品域客户端接入时需要配置的值为

|序号|产品线|组标识groupId|
|:-|:-|:-|
|1|BSS|com.ztesoft.bss|
|2|OSS|com.ztesoft.oss|
|3|DAT|com.ztesoft.dat|
|4|PaaS|com.ztesoft.paas|

* 组件标识artifactId：主要区分产品，根据不同产品域的产品列表（取【产品缩写】列的值）在客户端接入时配置的值

* profile标识：主要区分不同的环境

|序号|环境|组标识|
|:-|:-|:-|
|1|开发环境|DEV|
|2|测试环境|CS|
|3|生产环境|**SC**|
|4|灰度环境|HD|
