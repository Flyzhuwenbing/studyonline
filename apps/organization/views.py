from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import CourseOrg,CityDict


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
