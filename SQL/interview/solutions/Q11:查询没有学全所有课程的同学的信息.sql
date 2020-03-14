-- ########################################################
-- Q11:查询没有学全所有课程的同学的信息
-- ########################################################


  --11Q.1:
select
  Student.*
from Student,
  SC
where
  Student.SID = SC.SID
group by
  Student.SID,
  Student.Sname,
  Student.Sage,
  Student.Ssex
having
  count(CID) < (
    select
      count(CID)
    from Course
  ) --11.2
select
  Student.*
from Student
left join SC on Student.SID = SC.SID
group by
  Student.SID,
  Student.Sname,
  Student.Sage,
  Student.Ssex
having
  count(CID) < (
    select
      count(CID)
    from Course
  );
