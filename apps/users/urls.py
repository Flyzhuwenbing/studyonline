# _*_ coding: utf-8 _*_
__author__ = 'Fly'
from django.conf.urls import url,include

from .views import UserInfoView, UploadImageView, UpdatePwd, SendEmailView, UpdateEmailView,MyCourseView
from .views import MyFavOrgView, MyFavCourseView, MyFavTeacherView, MyMessageView
urlpatterns = [
    # 用户信息
    url(r'^info/$', UserInfoView.as_view(), name="user_info"),

    # 用户修改头像
    url(r'^image/upload/$', UploadImageView.as_view(), name="image_upload"),

    # 个人用户中心修改密码
    url(r'^update/pwd/$', UpdatePwd.as_view(), name="update_pwd"),

    # 发送邮箱验证码
    url(r'^sendemail_code/$', SendEmailView.as_view(), name="sendemail_code"),

    # 修改邮箱
    url(r'^update_email/$', UpdateEmailView.as_view(), name="update_email"),

    # 我的课程
    url(r'mycourse/$', MyCourseView.as_view(), name="my_course"),

    # 我收藏的课程机构
    url(r'myfav/org/$', MyFavOrgView.as_view(), name="myfav_org"),

    # 我收藏的课程课程
    url(r'myfav/course/$', MyFavCourseView.as_view(), name="myfav_course"),

    # 我收藏的课程老师
    url(r'myfav/teacher/$', MyFavTeacherView.as_view(), name="myfav_teacher"),

    # 我的消息
    url(r'mymessage/$', MyMessageView.as_view(), name="my_message"),
]

