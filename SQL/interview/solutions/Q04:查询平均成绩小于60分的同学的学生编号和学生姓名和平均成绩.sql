-- ########################################################
-- Q04:查询平均成绩小于60分的同学的学生编号和学生姓名和平均成绩
-- ########################################################


  --4.1、查询在sc表存在成绩的学生信息的SQL语句。
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
  cast(avg(b.score) as decimal(18, 2)) < 60
order by
  a.SID;

  
--4.2、查询在sc表中不存在成绩的学生信息的SQL语句。
select
  a.SID,
  a.Sname,
  isnull(cast(avg(b.score) as decimal(18, 2)), 0) avg_score
from Student a
left join sc b on a.SID = b.SID
group by
  a.SID,
  a.Sname
having
  isnull(cast(avg(b.score) as decimal(18, 2)), 0) < 60
order by
  a.SID;