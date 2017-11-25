import json

from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from django.http import HttpResponse, HttpResponseRedirect # 重定向
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.core.urlresolvers import reverse # 将url的name反解成url地址

from .models import UserProfile,EmailVerifyRecord, Banner
from .forms import LoginForm,RegisterForm,ForgetPwdForm,ModifyPwdForm,UploadImageForm,UserInfoForm
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin
from operation.models import UserCourse, UserFavorite, UserMessage
from organization.models import CourseOrg,Teacher
from courses.models import Course




# Create your views here.
# 自定义后台认证方法,可改用email方式登录
class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))  # 采用email登录
            if user.check_password(password):
                return user
        except Exception as e:
            return None

# 激活链接验证
class ActiveUserView(View):
    def get(self,request,active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return render(request, 'active_fail.html')
        return render(request, 'login.html')


# 注册
class RegisterView(View):
    def get(self,request):
        register_form = RegisterForm()
        return render(request, 'register.html', {'register_form':register_form})

    def post(self,request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get('email', '')
            if UserProfile.objects.filter(email=user_name):
                return render(request, 'register.html', {'register_form': register_form,'msg':'用户已经被注册'})  # 若无此判断,会出现如下错误(1062, "Duplicate entry '1@1.com' for key 'username'") 因为用户名重复而username字段设置为唯一
            pass_word = request.POST.get('password', '')
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            user_profile.password = make_password(pass_word)
            self.save = user_profile.save()

            # 写入欢迎注册页面消息
            user_message = UserMessage()
            user_message.user = user_profile.id
            user_message.message = "欢迎注册IT学习网"
            user_message.save()

            send_register_email(user_name,'register')
            return render(request, 'login.html')
        else:
            return render(request, 'register.html',{'register_form':register_form})


# 登录
class LoginView(View):
    def get(self,request):
        return render(request, 'login.html', {})
    def post(self,request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():  # is_valid()用于判断表单数据是否合法:是否符合设定的要求
            user_name = request.POST.get('username', '')  # request.POST为类字典对象，包含表单数据
            pass_word = request.POST.get('password', '')
            user = authenticate(username=user_name, password=pass_word)  # authenticate认证一组给定的用户名和密码 匹配返回user对象，密码无效返回None
            if user is not None:
                if user.is_active:
                    login(request, user)  # 登录，将表单数据提交到服务器
                    return HttpResponseRedirect(reverse('index'))# 重新导向IndexView对于的url
                else:
                    return render(request, 'login.html', {'msg': '用户未激活'})

            else:
                return render(request, 'login.html', {'msg': '用户名或密码错误'})
        else:
            return render(request, 'login.html', {'login_form':login_form})


class LogoutView(View):
    """
    用户登出
    """
    def get(self,request):
        logout(request)
        return HttpResponseRedirect(reverse('index'))



# 忘记密码发送邮件
class ForgetPwdView(View):
    def get(self,request):
        forgetpwd_form = ForgetPwdForm()
        return render(request, 'forgetpwd.html', {'forgetpwd_form':forgetpwd_form})

    def post(self,request):
        forgetpwd_form = ForgetPwdForm(request.POST)
        if forgetpwd_form.is_valid():
            email = request.POST.get('email', '')
            send_register_email(email, 'forget')
            return render(request, 'send_success.html')
        else:
            return render(request, 'forgetpwd.html', {'forgetpwd_form': forgetpwd_form})


#  找回密码
class ResetView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, 'password_reset.html', {'email': email})
        else:
            return render(request, 'active_fail.html')
        return render(request, 'login.html')

#  未登录状态重置密码
class ModifyPwdView(View):
    def post(self,request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            email = request.POST.get('email', '')
            if pwd1 != pwd2:
                return render(request, 'password_reset.html', {'email': email,'msg':'密码不一致'})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd1)
            user.save()
            return render(request, 'login.html')
        else:
            email = request.POST.get('email', '')
            return render(request, 'password_reset.html', {'email': email, 'modify_form': modify_form})


class UserInfoView(LoginRequiredMixin,View):
    """
    用户个人信息
    """
    def get(self,request):
        return render(request, 'usercenter-info.html', {

            })
    def post(self,request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')






class UploadImageView(LoginRequiredMixin, View):
    """
    用户修改头像
    """

    def post(self, request):
        image_form =UploadImageForm(request.POST,request.FILES, instance=request.user)  # instance=request.user用于指定form具有models功能
        if image_form.is_valid():
            # 方法一: 采用form操作models的特性
            image_form.save()

            # 方法二： 被验证通过的表单信息保存在cleaned_data中
            # image = image_form.cleaned_data['image']
            # request.user.image = image
            # request.user.save()

            return HttpResponse('{"status":"success"}', content_type='application/json')  # '{"status":"success"}'
        else:
            return HttpResponse('{"status":"fail","msg":"添加出错"}', content_type='application/json')


class UpdatePwd(View):
    """
    已登录状态修改密码
    """
    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail","msg":"密码不一致"}', content_type='application/json')
            user = request.user
            user.password = make_password(pwd1)
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')


class SendEmailView(LoginRequiredMixin,View):
    """
    发送邮箱验证码
    """
    def get(self,request):
        email = request.GET.get('email','')

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已存在"}', content_type='application/json')
        send_register_email(email, 'update_email')
        return HttpResponse('{"status":"success"}', content_type='application/json')


class UpdateEmailView(LoginRequiredMixin, View):
    """
    修改邮箱
    """
    def post(self, request):
        email = request.POST.get('email', '')
        code = request.POST.get('code', '')

        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"email":"验证码错误"}', content_type='application/json')

class MyCourseView(LoginRequiredMixin, View):
    """
    我的课程
    """
    def get(self, request):
        user_courses = UserCourse.objects.filter(user=request.user)

        return render(request, 'usercenter-mycourse.html', {
            'user_courses': user_courses
        })

class MyFavOrgView(LoginRequiredMixin, View):
    """
    我的收藏机构
    """

    def get(self, request):
        # fav_id是根据fav_type的不同分别赋予course,tecaher,org的id,即表UserFavorite存放的为数据id,而不是具体

        org_list = []
        # 1.由当前user,fav_type=2,取出UserFavorite表中的主键id
        userfav_ids = UserFavorite.objects.filter(user=request.user, fav_type=2)
        # 2.由UserFavorite表中的主键id取出fav_id
        # 3.由fav_id取出CourseOrg表中的主键org_id(fav_id是由org_id赋予的，即org_id==fav_id）
        # 4.由org_id取出org
        for userfav_id in userfav_ids:
            org_id = userfav_id.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)

        return render(request, 'usercenter-fav-org.html', {
            'org_list': org_list
        })

class MyFavCourseView(LoginRequiredMixin, View):
    """
    我的收藏课程
    """

    def get(self, request):
        course_list = []
        userfav_ids = UserFavorite.objects.filter(user=request.user, fav_type=1)
        for userfav_id in userfav_ids:
            course_id = userfav_id.fav_id
            org = Course.objects.get(id=course_id)
            course_list.append(org)

        return render(request, 'usercenter-fav-course.html', {
            'course_list': course_list
        })


class MyFavTeacherView(LoginRequiredMixin, View):
    """
    我的收藏讲师
    """
    def get(self, request):
        teacher_list = []
        userfav_ids = UserFavorite.objects.filter(user=request.user, fav_type=3)
        for userfav_id in userfav_ids:
            teacher_id = userfav_id.fav_id
            org = Teacher.objects.get(id=teacher_id)
            teacher_list.append(org)

        return render(request, 'usercenter-fav-teacher.html', {
            'teacher_list': teacher_list
        })


class MyMessageView(LoginRequiredMixin, View):
    """
    我的消息
    """
    def get(self, request):
        all_message = UserMessage.objects.filter(user=request.user.id)

        # 用户进入个人消息后清空未读消息记录
        all_unread_messages = UserMessage.objects.filter(user=request.user.id, has_read=False)
        for unread_message in all_unread_messages:
            unread_message.has_read = True
            unread_message.save()
        # 对个人消息进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_message, 1, request=request)
        messages = p.page(page)
        return render(request, 'usercenter-message.html', {
            'messages':messages

        })


class IndexView(View):
    """
    首页
    """
    def get(self,request):
        # 取出轮播图
        all_banners = Banner.objects.all().order_by('index')
        courses = Course.objects.filter(is_banner=False)[:6]
        banner_courses = Course.objects.filter(is_banner=False)[:3]
        course_orgs = CourseOrg.objects.all()[:15]
        return render(request,'index.html', {
            'all_banners':all_banners,
            'courses':courses,
            'banner_courses':banner_courses,
            'course_orgs':course_orgs

        })


def page_not_found(request):
    # 全局404处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('404.html',{})
    response.status_code = 404
    return response

def page_error(request):
    # 全局500处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response


# def user_login(request):
#     if request.method == "POST":
#         user_name = request.POST.get('username', '')  # request.POST为类字典对象，包含表单数据
#         pass_word = request.POST.get('password', '')
#         user = authenticate(username=user_name, password=pass_word)  # authenticate认证一组给定的用户名和密码 匹配返回user对象，密码无效返回None
#         if user is not None:
#             login(request, user)  # 登录，将表单数据提交到服务器
#             return render(request, 'index.html')
#         else:
#             return render(request, 'login.html', {'msg' : '用户名或密码错误' })
#     elif request.method == "GET":
#         return render(request, 'login.html')