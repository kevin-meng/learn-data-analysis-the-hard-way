-- ########################################################
-- Q37:查询不及格的课程
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
  and SC.score < 60
order by
  Student.SID,
  SC.CID;