# FAQ1：手动触发配置文件同步
## 背景

  因为ZCM的自身BUG或操作系统资源不足等问题，容易引发即使在配置管理界面修改了，配置文件也不能及时同步到对应的应用中
## 处理步骤
1. 登录到ZCM系统
2. 打开`配置管理`界面，再次检查配置文件是否修改后被正常保存
3. 在`应用管理`界面，搜索修改的配置文件关联的应用，例如：dms-all-core
4. 点击查看详情按钮，进入应用详情界面
![应用管理](/images/zcm/sou-suo-ying-yong.png)
5. 在应用详情界面，查看所在主机那一栏的状态，是否为**红色**
![应用详情1](/images/zcm/ying-yong-xiang-qing.png)
6. 点击`所在主机`那一栏中的IP地址，进行手动触发配置文件同步
![应用详情2](/images/zcm/ying-yong-xiang-qing-2.png)
7. 等待5~10分钟后，在弹出的触发同步操作界面，点击确定，
![应用详情3](/images/zcm/ying-yong-xiang-qing-3.png)
8. 在配置文件同步过程中，可以查看到所在主机颜色为**蓝色**
![应用详情4](/images/zcm/ying-yong-xiang-qing-4.png)
8. 等待5~10分钟后，配置文件同步完成后，可以看到所在主机颜色为**白色**，表示同步处理完成
![应用详情5](/images/zcm/ying-yong-xiang-qing-5.png)
9. 将应用**重新部署**，使配置文件可以在应用中生效。
![应用详情6](/images/zcm/ying-yong-xiang-qing-6.png)