
## 项目

## 用户
ZCM是通过项目进行环境隔离，项目与用户的管理是多对多的关系，用户的新增需要通过ZCM的管理用户进行添加(非所内ZCM，默认管理员账户是demo；所内ZCM的管理员账户是zcm)

### 案例1：将已有的项目关联到新创建的用户下
#### 1. 创建用户
* 以管理员用户登录ZCM，然后切换Portal为**IT Center Administrator Portal**
![](/images/zcm/switch_IT_Portal.png)

* 进入**用户管理**界面
![](/images/zcm/click_user_manage.png)

* 点击**新建**按钮，创建用户
  注意：`用户名称`保持和`用户编码`一致，`生效日期`请填写在当前日期之前的时间，如果使用`立即生效`则需要等到第二天
![](/images/zcm/new_user.png)
![](/images/zcm/new_user2.png)

#### 2. 授权角色与门户
* 在**用户管理**界面，选中新创建的用户`授权角色`(此处以dbeptest5为例)
![](/images/zcm/grant_role.png)

* 在打开的`角色授权`页面添加角色，此处添加的角色为**ZCM_ADMIN**，然后点击添加按钮进行添加
![](/images/zcm/grant_role2.png)

* `角色授权`完成界面如下
![](/images/zcm/grant_role_ok.png)

* 门户的授权，在角色授权完成后，默认会拥有门户**ZCM Administrator Portal**，如果需要新增其他门户信息，操作与授权角色方法类似。
![](/images/zcm/grant_portal.png)

#### 3. 将用户加入到租户
* 以新创建的用户登录ZCM系统，默认登录密码为`111111`，在完成初次登录后，需要修改密码
![](/images/zcm/login_zcm.png)
![](/images/zcm/first_modify_passwd_ok.png)

* 打开租户界面(基础设施->租户管理)
![](/images/zcm/renter.png)

* 选择需要添加到对应的租户下(所内ZCM默认是**ZTESOFT**，现场默认只有一个租户)，点击`编辑`按钮，打开租户编辑界面
![](/images/zcm/renter_edit.png)

* 在编辑界面，添加用户(此处添加dbeptest5用户)
![](/images/zcm/renter_add.png)

* 刷新网页后，打开**项目管理**页面(基础设施->项目管理)
![](/images/zcm/zcm_project.png)

* 选择需要添加用户的项目后，点击编辑按钮，在编辑界面中添加上用户，即可(此处添加dbeptest5用户)
![](/images/zcm/add_user_project.png)

* 刷新浏览器后配置生效
![](/images/zcm/add_user_project_ok.png)

















