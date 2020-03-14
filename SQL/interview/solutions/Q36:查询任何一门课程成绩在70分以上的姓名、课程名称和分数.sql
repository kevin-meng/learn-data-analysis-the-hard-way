-- ########################################################
-- Q36:查询任何一门课程成绩在70分以上的Q姓名:课程名称和分数
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
  and SC.score >= 70
order by
  Student.SID,
  SC.CID;