-- ########################################################
-- Q13:查询和"01"号的同学学习的课程完全相同的其他同学的信息
-- ########################################################-


select
  Student.*
from Student
where
  SID in (
    select
      distinct SC.SID
    from SC
    where
      SID <> '01'
      and SC.CID in (
        select
          distinct CID
        from SC
        where
          SID = '01'
      )
    group by
      SC.SID
    having
      count(1) = (
        select
          count(1)
        from SC
        where
          SID = '01'
      )
  );
