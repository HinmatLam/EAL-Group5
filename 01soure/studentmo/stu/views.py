from django.shortcuts import render
from stu.models import Student


# 跳转登录界面
def login(request):
    return render(request, 'stu/stu_login.html')


# 获取数据跳转到首页
def index(request):
    # 获取用户输入的数据
    dict = request.POST
    username = dict.get('username')
    password = dict.get('password')
    nianji = dict.get('nianji')
    xueqi = dict.get('xueqi')
    # 模糊查询用户名和密码是否正确
    lists = Student.objects.filter(stu_name=username).filter(stu_password=password)
    # 获取列表的长度
    n = len(lists)
    if n > 0:
        if len(nianji) > 0 and len(xueqi) > 0:
            stu = Student.objects.filter(stu_name=username).filter(stu_nianji=nianji).filter(stu_xueqi=xueqi)
            context = {'stu': stu, 'uname': username, 'upwd': password}
            return render(request, 'stu/index.html', context)
        elif len(nianji) > 0:
            stu = Student.objects.filter(stu_name=username).filter(stu_nianji=nianji)
            context = {'stu': stu, 'uname': username, 'upwd': password}
            return render(request, 'stu/index.html', context)
        elif len(xueqi) > 0:
            stu = Student.objects.filter(stu_name=username).filter(stu_xueqi=xueqi)
            context = {'stu': stu, 'uname': username, 'upwd': password}
            return render(request, 'stu/index.html', context)
        else:
            stu = Student.objects.filter(stu_name=username)
            context = {'stu': stu, 'uname': username, 'upwd': password}
            return render(request, 'stu/index.html', context)
    else:
        context = {'msg': '用户名或密码有误！', }
        return render(request, 'stu/stu_login.html', context)
