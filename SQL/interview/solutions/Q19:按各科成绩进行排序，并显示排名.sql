-- ########################################################
-- Q19:按各科成绩进行排序，并显示排名
-- ########################################################

--19.1 sql 2000用子查询完成
  --Score重复时保留名次空缺
select
  t.*,
  px = (
    select
      count(1)
    from SC
    where
      CID = t.CID
      and score > t.score
  ) + 1
from sc t
order by
  t.cid,
  px;
--Score重复时合并名次
select
  t.*,
  px = (
    select
      count(distinct score)
    from SC
    where
      CID = t.CID
      and score >= t.score
  )
from sc t
order by
  t.cid,
  px;
--19.2 sql 2005用rank,DENSE_RANK完成
  --Score重复时保留名次空缺(rank完成)
select
  t.*,
  px = rank() over(
    partition by cid
    order by
      score desc
  )
from sc t
order by
  t.CID,
  px;
--Score重复时合并名次(DENSE_RANK完成)
select
  t.*,
  px = DENSE_RANK() over(
    partition by cid
    order by
      score desc
  )
from sc t
order by
  t.CID,
  px;
