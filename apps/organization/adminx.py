# _*_ coding: utf-8 _*_
__author__ = 'Fly'
__date__ = '17-11-4 下午7:09'

import xadmin

from .models import CityDict,CourseOrg,Teacher

class CityDictAdmin(object):
    list_display = ['name','desc','add_time']
    search_fields = ['name','desc']
    list_filter = ['name','desc','add_time']


class CourseOrgAdmin(object):
    list_display = ['name', 'desc', 'click_nums','fav_nums','image','address','city','add_time']
    search_fields = ['name', 'desc', 'click_nums','fav_nums','image','address','city']
    list_filter = ['name', 'desc', 'click_nums','fav_nums','image','address','city','add_time']

class TeacherAdmin(object):
    list_display = ['org', 'name', 'work_year','work_company','work_position','points','click_nums','fav_nums','add_time']
    search_fields = ['org', 'name', 'work_year','work_company','work_position','points','click_nums','fav_nums']
    list_filter = ['org', 'name', 'work_year','work_company','work_position','points','click_nums','fav_nums','add_time']


xadmin.site.register(CityDict,CityDictAdmin)
xadmin.site.register(CourseOrg,CourseOrgAdmin)
xadmin.site.register(Teacher,TeacherAdmin)
