-- ########################################################
-- Q09:查询学过编号为"01"并且也学过编号为"02"的课程的同学的信息
-- ########################################################

  --方法1
select
  Student.*
from Student,
  SC
where
  Student.SID = SC.SID
  and SC.CID = '01'
  and exists (
    Select
      1
    from SC SC_2
    where
      SC_2.SID = SC.SID
      and SC_2.CID = '02'
  )
order by
  Student.SID;
--方法2
select
  Student.*
from Student,
  SC
where
  Student.SID = SC.SID
  and SC.CID = '02'
  and exists (
    Select
      1
    from SC SC_2
    where
      SC_2.SID = SC.SID
      and SC_2.CID = '01'
  )
order by
  Student.SID;
--方法3
select
  m.*
from Student m
where
  SID in (
    select
      SID
    from (
        select
          distinct SID
        from SC
        where
          CID = '01'
        union all
        select
          distinct SID
        from SC
        where
          CID = '02'
      ) t
    group by
      SID
    having
      count(1) = 2
  )
order by
  m.SID;