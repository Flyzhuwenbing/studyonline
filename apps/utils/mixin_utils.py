# _*_ coding: utf-8 _*_
__author__ = 'Fly'
from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator


#  判断用户是否已经登录，默认为登录,必须登录才能访问
class LoginRequiredMixin(object):

    @method_decorator(login_required(login_url='/login/'))
    def dispatch(self,request,*args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)