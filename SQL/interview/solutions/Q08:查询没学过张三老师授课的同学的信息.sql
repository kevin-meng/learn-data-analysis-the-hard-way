-- ########################################################
-- Q8:查询没学过"张三"老师授课的同学的信息
-- ########################################################

select
  m.*
from Student m
where
  SID not in (
    select
      distinct SC.SID
    from SC,
      Course,
      Teacher
    where
      SC.CID = Course.CID
      and Course.TID = Teacher.TID
      and Teacher.Tname = '张三'
  )
order by
  m.SID;

