-- ########################################################
-- Q25:查询各科成绩前三名的记录
-- ########################################################

--25.1 分数重复时保留名次空缺
select
  m.*,
  n.CID,
  n.score
from Student m,
  SC n
where
  m.SID = n.SID
  and n.score in (
    select
      top 3 score
    from sc
    where
      CID = n.CID
    order by
      score desc
  )
order by
  n.CID,
  n.score desc;

  
--25.2 分数重复时不保留名次空缺，合并名次
  --sql 2000用子查询实现
select
  *
from (
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
  ) m
where
  px between 1
  and 3
order by
  m.Cid,
  m.px;

--sql 2005用DENSE_RANK实现
select
  *
from (
    select
      t.*,
      px = DENSE_RANK() over(
        partition by Cid
        order by
          score desc
      )
    from sc t
  ) m
where
  px between 1
  and 3
order by
  m.CID,
  m.px;