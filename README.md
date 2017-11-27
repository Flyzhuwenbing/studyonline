## 基于django框架对在线学习网的开发 （http://www.zhufly.xin）

### 项目简述

本项目实现在线学习网站的搭建，实现注册，登录，找回密码，页面展示等功能。 
采用django框架搭建，MySQL用于存储后台数据，通过Linux+Nginx+MySQL+Gunicorn进行部署
 
### 项目说明

##### 开发环境
* ubuntu (16.04)
* python (3.5.2)
* Django (1.11.7)
* MySQL (5.7)
##### 数据库设计(models)
* 用户
user app model
* 机构
organization app model
* 课程
course app model
* 操作
operation app model

##### 功能设计(views)
1. 用户操作功能
* 登录（session和cookie机制）
* 注册（form表单提交，图片验证码，发送邮件）
* 找回密码（邮件发送）
* 信息修改（修改密码，头像，邮箱，基本信息）
* 全局搜索
* 消息提醒

2. 课程机构功能
* 机构列表（分页，筛选，排序）
* 机构详情（收藏，富文本展示）
* 咨询提交（modelform验证与保存）
3. 课程功能
* 课程列表（分页，排序）
* 课程详情（收藏，章节展示，资源展示，评论）
4. 讲师功能
* 讲师列表（分页，排序）
* 讲师详情（收藏）
5. 全局功能
* 全局404和500页面的配置




