-- ########################################################
-- Q7:查询学过"张三"老师授课的同学的信息
-- ########################################################

select
  distinct Student.*
from Student,
  SC,
  Course,
  Teacher
where
  Student.SID = SC.SID
  and SC.CID = Course.CID
  and Course.TID = Teacher.TID
  and Teacher.Tname = '张三'
order by
  Student.SID;
