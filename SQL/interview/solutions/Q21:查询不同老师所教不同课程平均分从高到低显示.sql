-- ########################################################
-- Q21:查询不同老师所教不同课程平均分从高到低显示
-- ########################################################

select
  m.TID,
  m.Tname,
  cast(avg(o.score) as decimal(18, 2)) avg_score
from Teacher m,
  Course n,
  SC o
where
  m.TID = n.TID
  and n.CID = o.CID
group by
  m.TID,
  m.Tname
order by
  avg_score desc;
