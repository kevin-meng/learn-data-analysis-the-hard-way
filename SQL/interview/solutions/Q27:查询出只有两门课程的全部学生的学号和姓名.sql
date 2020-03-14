-- ########################################################
-- Q27:查询出只有两门课程的全部学生的学号和姓名
-- ########################################################


select
  Student.SID,
  Student.Sname
from Student,
  SC
where
  Student.SID = SC.SID
group by
  Student.SID,
  Student.Sname
having
  count(SC.CID) = 2
order by
  Student.SID;
