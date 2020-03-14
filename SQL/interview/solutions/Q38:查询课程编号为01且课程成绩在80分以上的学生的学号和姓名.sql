-- ########################################################
-- Q38:查询课程编号为01且课程成绩在80分以上的学生的学号和姓名
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
  and SC.CID = '01'
  and SC.score >= 80
order by
  Student.SID,
  SC.CID;