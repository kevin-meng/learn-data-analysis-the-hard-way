-- ########################################################
-- Q45:查询选修了全部课程的学生信息
-- ########################################################
  --方法1 根据数量来完成
select
  student.*
from student
where
  SID in (
    select
      SID
    from sc
    group by
      SID
    having
      count(1) = (
        select
          count(1)
        from course
      )
  );
--方法2 使用双重否定来完成
select
  t.*
from student t
where
  t.SID not in (
    select
      distinct m.SID
    from (
        select
          SID,
          CID
        from student,
          course
      ) m
    where
      not exists (
        select
          1
        from sc n
        where
          n.SID = m.SID
          and n.CID = m.CID
      )
  );
--方法3 使用双重否定来完成
select
  t.*
from student t
where
  not exists(
    select
      1
    from (
        select
          distinct m.SID
        from (
            select
              SID,
              CID
            from student,
              course
          ) m
        where
          not exists (
            select
              1
            from sc n
            where
              n.SID = m.SID
              and n.CID = m.CID
          )
      ) k
    where
      k.SID = t.SID
  );