-- ########################################################
-- Q35:查询所有学生的课程及分数情况
-- ########################################################

select
  Student.*,
  Course.Cname,
  SC.CID,
  SC.score
from Student,
  SC,
  Course
where
  Student.SID = SC.SID
  and SC.CID = Course.CID
order by
  Student.SID,
  SC.CID;