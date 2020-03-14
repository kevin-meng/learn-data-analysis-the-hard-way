-- ########################################################
--Q32:查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
-- ########################################################

select
  m.CID,
  m.Cname,
  cast(avg(n.score) as decimal(18, 2)) avg_score
from Course m,
  SC n
where
  m.CID = n.CID
group by
  m.CID,
  m.Cname
order by
  avg_score desc,
  m.CID asc;
