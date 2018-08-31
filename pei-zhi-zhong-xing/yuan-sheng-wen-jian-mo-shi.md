# 原生文件模式

原生文件配置是为了适应多语言和应用的一种普遍性适应、低侵入的方案；以原生文件的方式，通过在ZCM管理，使用docker容器挂载技术实现的配置管理装载的配置中心管理方案。

## 配置说明

* ### 创建配置组
![](/pei-zhi-zhong-xing/chuang-jian-pei-zhi-zu.png)
* ### 新增配置文件

  * 创建配置文件
  
  ![](/pei-zhi-zhong-xing/chuang-jian-pei-zhi-wen-jian-1.png)
  
  * 录入配置文件信息(原则上配置文件的内容是没有约束的，但是为了方便部署，所有的配置文件中的配置项需要是key-value的形式)
  
  ![](/pei-zhi-zhong-xing/chuang-jian-pei-zhi-wen-jian-3.png)
  
* ### 文件操作(配置文件支持增删改查)

![](/pei-zhi-zhong-xing/wen-jian-cao-zuo.png)
* ### 配置历史查询和回滚

  * 在历史页面可以查看到修改的历史变更记录
  
  ![](/pei-zhi-zhong-xing/wen-jian-hui-gun-1.png)
  
  * 选择需要回滚的历史页，可以进行回滚操作
  
  ![](/pei-zhi-zhong-xing/wen-jian-hui-gun-2.png)

## 应用接入
* ### 基本流程

![](/pei-zhi-zhong-xing/ying-yong-jie-ru-0.png)

* ### 应用管理接入配置中心的配置
新建应用，可以选择按文件映射也可以选择按目录(目录映射管理的是配置组)的映射
  * 文件挂载到指定应用中：
  
  ![](/pei-zhi-zhong-xing/ying-yong-jie-ru-1.png)
  
  * 按组挂载，映射配置中心中的组到业务容器的指定目录(目录映射目录的关系)
  
  ![](/pei-zhi-zhong-xing/ying-yong-jie-ru-2.png)

## 配置规范

* 应用关联配置组和配置文件，不能交叉，如选择配置组挂载到容器中的目录，不能够再在此目录下进行文件挂载操作；同理，目录不能相互包含
* 业务容器挂载的文件是权限为只读，不允许用户到容器中进行修改，所有修改需在配置中心发起
* 原生配置文件的配置中心中，一个配置组和一个应用强关联
* 原生文件配置仅支持文件以及一级目录的挂载服务，业务应用的配置目录不可以有多级
* 配置中心不是文件管理系统，配置中心中管理的配置文件一定是需要修改的配置信息集合，其他配置请业务应用自行管理




