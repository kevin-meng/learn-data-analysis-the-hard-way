-- ########################################################
-- Q41:查询不同课程成绩相同的学生的学生Q编号:课程Q编号:学生成绩
-- ########################################################

  --方法1
select
  m.*
from SC m,(
    select
      CID,
      score
    from SC
    group by
      CID,
      score
    having
      count(1) > 1
  ) n
where
  m.CID = n.CID
  and m.score = n.score
order by
  m.CID,
  m.score,
  m.SID;
--方法2
select
  m.*
from SC m
where
  exists (
    select
      1
    from (
        select
          CID,
          score
        from SC
        group by
          CID,
          score
        having
          count(1) > 1
      ) n
    where
      m.CID = n.CID
      and m.score = n.score
  )
order by
  m.CID,
  m.score,
  m.SID;