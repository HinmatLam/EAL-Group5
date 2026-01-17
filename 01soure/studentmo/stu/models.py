from django.db import models


class Student(models.Model):
    id = models.IntegerField(primary_key=True)
    stu_name = models.CharField('姓名', max_length=100)
    stu_password = models.CharField('密码', max_length=100)
    stu_gender = models.CharField('性别', max_length=100)
    stu_age = models.CharField('年龄', max_length=10)
    stu_course = models.CharField('科目', max_length=100)
    stu_score = models.IntegerField('分数', default=0)
    stu_nianji = models.CharField('年级', max_length=100)
    stu_xueqi = models.CharField('学期', max_length=100)

    # 修改显示的表的名字
    class Meta:
        db_table = "student"
        # 给模型类起一个更可读的名字
        verbose_name = '学生'
        # 模型的复数形式
        verbose_name_plural = '学生信息表'

    # 作为外键显示的字段
    def __str__(self):
        return self.stu_name
