from django.urls import path as url
from . import views

# 主路由
urlpatterns = [
    url('', views.login),
    url('stu_login/', views.login),
    url('stu_index/', views.index),
]