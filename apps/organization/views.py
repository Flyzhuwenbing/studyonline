from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse

from .models import CourseOrg,CityDict
from .forms import UseAskForm
from courses.models import Course
from operation.models import UserFavorite

# Create your views here.
class OrgView(View):
    #  此get方法用于request.GET方式请求资源
    def get(self,request):
        # 课程机构
        all_orgs = CourseOrg.objects.all()  # SELECT * FROM courseorg
        hot_orgs = all_orgs.order_by('-click_nums')[:2]
        # 城市
        all_cities = CityDict.objects.all()

        #  城市筛选
        city_id = request.GET.get('city', '')  #  从前端得到city_id值（request.GET向服务器请求数据，通常请求参数在url中直接体现）
        if city_id:
            all_orgs = all_orgs.filter(city_id=int(city_id))

        #  类别筛选
        category = request.GET.get('ct','')
        if category:
            all_orgs = all_orgs.filter(category=category)

        # 排序
        sort = request.GET.get('sort','')
        if sort == 'students':
            all_orgs = all_orgs.order_by('-students')
        if sort == 'courses':
            all_orgs = all_orgs.order_by('-course_nums')

        #  记录统计
        org_nums = all_orgs.count()  # SELECT count() FROM courseorg

        # 对课程机构进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_orgs, 5, request=request)
        orgs = p.page(page)
        return render(request,'org-list.html',{
            'all_orgs':orgs,
            'all_cities':all_cities,
            'org_nums': org_nums,
            'city_id':city_id,
            'category':category,
            'hot_orgs':hot_orgs,
            'sort':sort
        })

class AddUserAskView(View):
    '''
    添加咨询
    '''
    def post(self,request):
        userask_form = UseAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            # 返回json格式，为异步请求，避免刷新整个页面
            # 此处json格式数据单双引号不能出错，如此种"{'status':'success'}"书写错误  JSON 的标准：双引号而非单引号！
            return HttpResponse('{"status":"success"}', content_type='application/json')  # '{"status":"success"}'
        else:
            return HttpResponse('{"status":"fail","msg":"添加出错"}',content_type='application/json')

class OrgHomeView(View):
    """
    机构首页
    """
    def get(self,request,org_id):
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))  # 查询courseorg父表信息
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_courses = course_org.course_set.all()[:3]  # 通过父表.属性查course表信息（属性默认为子表小写加上_set)
        all_teachers = course_org.teacher_set.all()[:1]
        return render(request,'org-detail-homepage.html',{
            'all_courses': all_courses,
            'all_teachers':all_teachers,
            'course_org':course_org,
            'current_page':current_page,
            'has_fav':has_fav
        })


class OrgCourseView(View):
    """
    机构课程列表页
    """
    def get(self,request,org_id):
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_courses = course_org.course_set.all()
        return render(request,'org-detail-course.html',{
            'all_courses': all_courses,
            'course_org':course_org,
            'current_page':current_page,
            'has_fav': has_fav
        })


class OrgDescView(View):
    """
    机构介绍页
    """
    def get(self,request,org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request,'org-detail-desc.html',{
            'course_org':course_org,
            'current_page':current_page,
            'has_fav': has_fav
        })


class OrgTeacherView(View):
    """
    机构课程讲师页
    """
    def get(self,request,org_id):
        current_page = 'teacher'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_teachers = course_org.teacher_set.all()
        return render(request,'org-detail-teachers.html',{
            'all_teachers':all_teachers,
            'course_org':course_org,
            'current_page':current_page,
            'has_fav': has_fav
        })


class AddFavView(View):
    """
    用户收藏,用户取消收藏
    """
    def post(self,request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)
        if not request.user.is_authenticated():
            # 判断用户是否登录
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type='application/json')
        else:
            exist_records = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
            # 如果记录已经存在，则表示用户取消收藏
            if exist_records:
                exist_records.delete()
                return HttpResponse('{"status":"success","msg":"收藏"}', content_type='application/json')
            else:
                user_fav = UserFavorite()
                if int(fav_id) > 0 and int(fav_type) > 0:
                    user_fav.user = request.user
                    user_fav.fav_id = int(fav_id)
                    user_fav.fav_type = int(fav_type)
                    user_fav.save()
                    return HttpResponse('{"status":"success","msg":"已收藏"}', content_type='application/json')
                else:
                    return HttpResponse('{"status":"fail","msg":"收藏出错"}', content_type='application/json')








