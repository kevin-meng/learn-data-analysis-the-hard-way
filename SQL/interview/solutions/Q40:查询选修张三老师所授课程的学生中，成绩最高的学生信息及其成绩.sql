-- ########################################################
-- Q40:查询选修"张三"老师所授课程的学生中，成绩最高的学生信息及其成绩
-- ########################################################

--40.1 当最高分只有一个时
select
  top 1 Student.*,
  Course.Cname,
  SC.CID,
  SC.score
from Student,
  SC,
  Course,
  Teacher
where
  Student.SID = SC.SID
  and SC.CID = Course.CID
  and Course.TID = Teacher.TID
  and Teacher.Tname = N'张三'
order by
  SC.score desc;

  
--40.2 当最高分出现多个时
select
  Student.*,
  Course.Cname,
  SC.CID,
  SC.score
from Student,
  SC,
  Course,
  Teacher
where
  Student.SID = SC.SID
  and SC.CID = Course.CID
  and Course.TID = Teacher.TID
  and Teacher.Tname = N'张三'
  and SC.score = (
    select
      max(SC.score)
    from SC,
      Course,
      Teacher
    where
      SC.CID = Course.CID
      and Course.TID = Teacher.TID
      and Teacher.Tname = N'张三'
  );