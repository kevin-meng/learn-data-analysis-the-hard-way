-- ########################################################
-- Q39:求每门课程的学生人数
-- ########################################################

select
  Course.CID,
  Course.Cname,
  count(*) 学生人数
from Course,
  SC
where
  Course.CID = SC.CID
group by
  Course.CID,
  Course.Cname
order by
  Course.CID,
  Course.Cname;