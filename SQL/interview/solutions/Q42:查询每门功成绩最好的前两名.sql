-- ########################################################
-- Q42:查询每门功成绩最好的前两名
-- ########################################################

select
  t.*
from sc t
where
  score in (
    select
      top 2 score
    from sc
    where
      CID = T.CID
    order by
      score desc
  )
order by
  t.CID,
  t.score desc;
