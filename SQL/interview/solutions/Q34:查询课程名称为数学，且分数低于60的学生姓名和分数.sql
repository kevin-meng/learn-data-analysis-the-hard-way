-- ########################################################
-- Q34:查询课程名称为"数学"，且分数低于60的学生姓名和分数
-- ########################################################
select
  sname,
  score
from Student,
  SC,
  Course
where
  SC.SID = Student.SID
  and SC.CID = Course.CID
  and Course.Cname = N'数学'
  and score < 60;