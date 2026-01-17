from django.contrib import admin
from .models import Student


class UserInfoAdmin(admin.ModelAdmin):
    # 列表中的列
    list_display = ['id', 'stu_name', 'stu_password', 'stu_gender', 'stu_age', 'stu_course',
                    'stu_score', 'stu_nianji', 'stu_xueqi']
    # 搜索框
    search_fields = ['id', 'stu_name']


# 站点名称
admin.site.site_header = 'Django学生管理后台管理系统'

# 网页标题
admin.site.site_title = 'Django学生管理后台管理系统'

admin.site.register(Student, UserInfoAdmin)
