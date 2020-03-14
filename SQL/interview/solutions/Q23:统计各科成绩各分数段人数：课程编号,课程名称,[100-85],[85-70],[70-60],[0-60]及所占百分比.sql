-- ########################################################
-- Q23:统计各科成绩各分数段人数：课程编号,课程名称, 100-85 , 85-70 , 70-60 , 0-60 及所占百分比
-- ########################################################


 --23.1 统计各科成绩各分数段人数：课程编号,课程名称, 100-85 , 85-70 , 70-60 , 0-60
  --横向显示
select
  Course.CID 课程编号,
  Cname as 课程名称,
  sum(
    case
      when score >= 85 then 1
      else 0
    end
  ) 85 -100,
  sum(
    case
      when score >= 70
      and score < 85 then 1
      else 0
    end
  ) 70 -85,
  sum(
    case
      when score >= 60
      and score < 70 then 1
      else 0
    end
  ) 60 -70,
  sum(
    case
      when score < 60 then 1
      else 0
    end
  ) 0 -60
from sc,
  Course
where
  SC.CID = Course.CID
group by
  Course.CID,
  Course.Cname
order by
  Course.CID;
--纵向显示1(显示存在的分数段)
select
  m.CID 课程编号,
  m.Cname 课程名称,
  分数段 = (
    case
      when n.score >= 85 then '85-100'
      when n.score >= 70
      and n.score < 85 then '70-85'
      when n.score >= 60
      and n.score < 70 then '60-70'
      else '0-60'
    end
  ),
  count(1) 数量
from Course m,
  sc n
where
  m.CID = n.CID
group by
  m.CID,
  m.Cname,
  (
    case
      when n.score >= 85 then '85-100'
      when n.score >= 70
      and n.score < 85 then '70-85'
      when n.score >= 60
      and n.score < 70 then '60-70'
      else '0-60'
    end
  )
order by
  m.CID,
  m.Cname,
  分数段;
--纵向显示2(显示存在的分数段，不存在的分数段用0显示)
select
  m.CID 课程编号,
  m.Cname 课程名称,
  分数段 = (
    case
      when n.score >= 85 then '85-100'
      when n.score >= 70
      and n.score < 85 then '70-85'
      when n.score >= 60
      and n.score < 70 then '60-70'
      else '0-60'
    end
  ),
  count(1) 数量
from Course m,
  sc n
where
  m.CID = n.CID
group by
  all m.CID,
  m.Cname,
  (
    case
      when n.score >= 85 then '85-100'
      when n.score >= 70
      and n.score < 85 then '70-85'
      when n.score >= 60
      and n.score < 70 then '60-70'
      else '0-60'
    end
  )
order by
  m.CID,
  m.Cname,
  分数段;
--23.2 统计各科成绩各分数段人数：课程编号,课程名称, 100-85 , 85-70 , 70-60 , <60 及所占百分比
  --横向显示
select
  m.CID 课程编号,
  m.Cname 课程名称,
  (
    select
      count(1)
    from SC
    where
      CID = m.CID
      and score < 60
  ) 0 -60,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score < 60
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 百分比,
  (
    select
      count(1)
    from SC
    where
      CID = m.CID
      and score >= 60
      and score < 70
  ) 60 -70,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 60
        and score < 70
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 百分比,
  (
    select
      count(1)
    from SC
    where
      CID = m.CID
      and score >= 70
      and score < 85
  ) 70 -85,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 70
        and score < 85
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 百分比,
  (
    select
      count(1)
    from SC
    where
      CID = m.CID
      and score >= 85
  ) 85 -100,
  cast(
    (
      select
        count(1)
      from SC
      where
        CID = m.CID
        and score >= 85
    ) * 100.0 / (
      select
        count(1)
      from SC
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 百分比
from Course m
order by
  m.CID;
--纵向显示1(显示存在的分数段)
select
  m.CID 课程编号,
  m.Cname 课程名称,
  分数段 = (
    case
      when n.score >= 85 then '85-100'
      when n.score >= 70
      and n.score < 85 then '70-85'
      when n.score >= 60
      and n.score < 70 then '60-70'
      else '0-60'
    end
  ),
  count(1) 数量,
  cast(
    count(1) * 100.0 / (
      select
        count(1)
      from sc
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 百分比
from Course m,
  sc n
where
  m.CID = n.CID
group by
  m.CID,
  m.Cname,
  (
    case
      when n.score >= 85 then '85-100'
      when n.score >= 70
      and n.score < 85 then '70-85'
      when n.score >= 60
      and n.score < 70 then '60-70'
      else '0-60'
    end
  )
order by
  m.CID,
  m.Cname,
  分数段;
--纵向显示2(显示存在的分数段，不存在的分数段用0显示)
select
  m.CID 课程编号,
  m.Cname 课程名称,
  分数段 = (
    case
      when n.score >= 85 then '85-100'
      when n.score >= 70
      and n.score < 85 then '70-85'
      when n.score >= 60
      and n.score < 70 then '60-70'
      else '0-60'
    end
  ),
  count(1) 数量,
  cast(
    count(1) * 100.0 / (
      select
        count(1)
      from sc
      where
        CID = m.CID
    ) as decimal(18, 2)
  ) 百分比
from Course m,
  sc n
where
  m.CID = n.CID
group by
  all m.CID,
  m.Cname,
  (
    case
      when n.score >= 85 then '85-100'
      when n.score >= 70
      and n.score < 85 then '70-85'
      when n.score >= 60
      and n.score < 70 then '60-70'
      else '0-60'
    end
  )
order by
  m.CID,
  m.Cname,
  分数段;