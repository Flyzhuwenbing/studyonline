from django.shortcuts import render
from django.contrib.auth import authenticate, login
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password

from .models import UserProfile,EmailVerifyRecord
from .forms import LoginForm,RegisterForm,ForgetPwdForm,ModifyPwdForm
from utils.email_send import send_register_email


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
            # user_profile.is_active = False
            user_profile.password = make_password(pass_word)
            user_profile.save()
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
                    return render(request, 'index.html')
                else:
                    return render(request, 'login.html', {'msg': '用户未激活'})

            else:
                return render(request, 'login.html', {'msg': '用户名或密码错误'})
        else:
            return render(request, 'login.html', {'login_form':login_form})

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

#  重置密码
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