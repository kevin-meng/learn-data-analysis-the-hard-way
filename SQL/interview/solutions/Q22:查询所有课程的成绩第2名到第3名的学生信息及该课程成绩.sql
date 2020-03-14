-- ########################################################
-- Q22:查询所有课程的成绩第2名到第3名的学生信息及该课程成绩--
-- ########################################################


  -- 22.1 sql 2000 用子查询完成 --Score重复时保留名次空缺
select
  *
from (
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
  ) m
where
  px between 2
  and 3
order by
  m.cid,
  m.px;
--Score重复时合并名次
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
  px between 2
  and 3
order by
  m.cid,
  m.px;
--22.2 sql 2005用rank,DENSE_RANK完成
  --Score重复时保留名次空缺(rank完成)
select
  *
from (
    select
      t.*,
      px = rank() over(
        partition by cid
        order by
          score desc
      )
    from sc t
  ) m
where
  px between 2
  and 3
order by
  m.CID,
  m.px;
--Score重复时合并名次(DENSE_RANK完成)
select
  *
from (
    select
      t.*,
      px = DENSE_RANK() over(
        partition by cid
        order by
          score desc
      )
    from sc t
  ) m
where
  px between 2
  and 3
order by
  m.CID,
  m.px;
