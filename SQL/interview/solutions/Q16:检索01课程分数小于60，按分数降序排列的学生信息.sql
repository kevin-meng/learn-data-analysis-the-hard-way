-- ########################################################
-- Q16:检索"01"课程分数小于60，按分数降序排列的学生信息
-- ########################################################


select
  student.*,
  sc.CID,
  sc.score
from student,
  sc
where
  student.SID = SC.SID
  and sc.score < 60
  and sc.CID = '01'
order by
  sc.score desc;
