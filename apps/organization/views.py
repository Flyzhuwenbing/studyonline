from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import CourseOrg,CityDict


# Create your views here.
class OrgView(View):
    def get(self,request):
        all_orgs = CourseOrg.objects.all()  # SELECT * FROM courseorg
        org_nums = all_orgs.count()  # SELECT count() FROM courseorg
        all_cities = CityDict.objects.all()
        #  取出筛选的城市
        city_id = request.GET.get('city', '')  #  得到city_id值（request.GET向服务器请求数据，通常请求参数在url中直接体现）
        if city_id:
            all_orgs = CourseOrg.objects.fiter(city_id=int(city_id))
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
        })
