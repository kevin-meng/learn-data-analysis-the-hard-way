-- ########################################################
-- Q05:查询所有同学的学生Q编号:学生Q姓名:选课Q总数:所有课程的总成绩
-- ########################################################




  --51:查询所有有成绩的SQL。
select
  a.SID 学生编号,
  a.Sname 学生姓名,
  count(b.CID) 选课总数,
  sum(score) 所有课程的总成绩
from Student a,
  SC b
where
  a.SID = b.SID
group by
  a.SID,
  a.Sname
order by
  a.SID;




-- Q5.2:查询所有(包括有成绩和无成绩)的SQL。
select
  a.SID 学生编号,
  a.Sname 学生姓名,
  count(b.CID) 选课总数,
  sum(score) 所有课程的总成绩
from Student a
left join SC b on a.SID = b.SID
group by
  a.SID,
  a.Sname
order by
  a.SID;
