-- ########################################################
-- Q44:检索至少选修两门课程的学生学号
-- ########################################################
select
  student.SID,
  student.Sname
from student,
  SC
where
  student.SID = SC.SID
group by
  student.SID,
  student.Sname
having
  count(1) >= 2
order by
  student.SID;
