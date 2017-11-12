# _*_ coding: utf-8 _*_
__author__ = 'Fly'

import re
from django import forms

from operation.models import UseAsk

class UseAskForm(forms.ModelForm):

    class Meta:
        model = UseAsk
        fields = ['name','mobile','course_name']

    def clean_mobile(self):
        """
        验证手机号码是否合法
        :return:
        """
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = "^1[358]\d{9}$|^147\d{8}$|176\d{8}$"
        # compile 将字符串转为pattern形式
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError('手机号码非法',code='mobile_invalid')


