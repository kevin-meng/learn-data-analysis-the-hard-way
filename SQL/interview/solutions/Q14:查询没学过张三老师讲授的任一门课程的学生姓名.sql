-- ########################################################
-- Q14:查询没学过"张三"老师讲授的任一门课程的学生姓名
-- ########################################################


select
  student.*
from student
where
  student.SID not in (
    select
      distinct sc.SID
    from sc,
      course,
      teacher
    where
      sc.CID = course.CID
      and course.TID = teacher.TID
      and teacher.tname = '张三'
  )
order by
  student.SID;