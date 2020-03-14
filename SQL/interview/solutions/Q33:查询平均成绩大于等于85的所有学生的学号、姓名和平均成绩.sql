-- ########################################################
-- Q33:查询平均成绩大于等于85的所有学生的Q学号:姓名和平均成绩
-- ########################################################-
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
  cast(avg(b.score) as decimal(18, 2)) >= 85
order by
  a.SID;