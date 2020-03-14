-- ########################################################
-- Q03、查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
-- ########################################################

select
  a.SID,
  a.Sname,
  cast(avg(b.score) as decimal(18, 2)) avg_score
from Student a,
  sc b
where
  a.SID = b.SID
group by
  a.SID,
  a.Sname
having
  cast(avg(b.score) as decimal(18, 2)) >= 60
order by
  a.SID;