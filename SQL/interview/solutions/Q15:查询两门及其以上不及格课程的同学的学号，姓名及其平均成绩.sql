-- ########################################################
-- Q15:查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩
-- ########################################################


select
  student.SID,
  student.sname,
  cast(avg(score) as decimal(18, 2)) avg_score
from student,
  sc
where
  student.SID = SC.SID
  and student.SID in (
    select
      SID
    from SC
    where
      score < 60
    group by
      SID
    having
      count(1) >= 2
  )
group by
  student.SID,
  student.sname;