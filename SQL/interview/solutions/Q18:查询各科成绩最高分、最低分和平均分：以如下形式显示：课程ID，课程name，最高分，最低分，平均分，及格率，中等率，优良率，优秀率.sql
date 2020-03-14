-- ########################################################
 --Q18:查询各科成绩最Q高分:最低分和平均分：以如下形式显示：课程ID，课程name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率
  --及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90
-- ########################################################



  --方法1
select
  m.CID 课程编号,
  m.Cname 课程名称,
  max(n.score) 最高分,
  min(n.score) 最低分,
  cast(avg(n.score) as decimal(18, 2)) 平均分,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 60
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 及格率,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 70
        and score < 80
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 中等率,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 80
        and score < 90
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 优良率,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 90
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 优秀率
from Course m,
  SC n
where
  m.CID = n.CID
group by
  m.CID,
  m.Cname
order by
  m.CID;




  
--方法2
select
  m.CID 课程编号,
  m.Cname 课程名称,
  (
    select
      max(score)
    from SC
    where
      CID = m.CID
  ) 最高分,
  (
    select
      min(score)
    from SC
    where
      CID = m.CID
  ) 最低分,
  (
    select
      cast(avg(score) as decimal(18, 2))
    from SC
    where
      CID = m.CID
  ) 平均分,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 60
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 及格率,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 70
        and score < 80
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 中等率,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 80
        and score < 90
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 优良率,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 90
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 优秀率
from Course m
order by
  m.CID;