-- ########################################################
-- Q24:查询学生平均成绩及其名次
-- ########################################################



--24.1 查询学生的平均成绩并进行排名，sql 2000用子查询完成，分平均成绩重复时保留名次空缺和不保留名次空缺两种。
select
  t1.*,
  px = (
    select
      count(1)
    from (
        select
          m.SID 学生编号,
          m.Sname 学生姓名,
          isnull(cast(avg(score) as decimal(18, 2)), 0) 平均成绩
        from Student m
        left join SC n on m.SID = n.SID
        group by
          m.SID,
          m.Sname
      ) t2
    where
      平均成绩 > t1.平均成绩
  ) + 1
from (
    select
      m.SID 学生编号,
      m.Sname 学生姓名,
      isnull(cast(avg(score) as decimal(18, 2)), 0) 平均成绩
    from Student m
    left join SC n on m.SID = n.SID
    group by
      m.SID,
      m.Sname
  ) t1
order by
  px
select
  t1.*,
  px = (
    select
      count(distinct 平均成绩)
    from (
        select
          m.SID 学生编号,
          m.Sname 学生姓名,
          isnull(cast(avg(score) as decimal(18, 2)), 0) 平均成绩
        from Student m
        left join SC n on m.SID = n.SID
        group by
          m.SID,
          m.Sname
      ) t2
    where
      平均成绩 >= t1.平均成绩
  )
from (
    select
      m.SID 学生编号,
      m.Sname 学生姓名,
      isnull(cast(avg(score) as decimal(18, 2)), 0) 平均成绩
    from Student m
    left join SC n on m.SID = n.SID
    group by
      m.SID,
      m.Sname
  ) t1
order by
  px;


--24.2 查询学生的平均成绩并进行排名，sql 2005用rank,DENSE_RANK完成，分平均成绩重复时保留名次空缺和不保留名次空缺两种。
select
  t.*,
  px = rank() over(
    order by
      平均成绩 desc
  )
from (
    select
      m.SID 学生编号,
      m.Sname 学生姓名,
      isnull(cast(avg(score) as decimal(18, 2)), 0) 平均成绩
    from Student m
    left join SC n on m.SID = n.SID
    group by
      m.SID,
      m.Sname
  ) t
order by
  px
select
  t.*,
  px = DENSE_RANK() over(
    order by
      平均成绩 desc
  )
from (
    select
      m.SID 学生编号,
      m.Sname 学生姓名,
      isnull(cast(avg(score) as decimal(18, 2)), 0) 平均成绩
    from Student m
    left join SC n on m.SID = n.SID
    group by
      m.SID,
      m.Sname
  ) t
order by
  px;


