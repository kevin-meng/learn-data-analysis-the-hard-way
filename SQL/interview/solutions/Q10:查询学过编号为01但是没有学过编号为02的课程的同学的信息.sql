-- ########################################################
-- Q10:查询学过编号为"01"但是没有学过编号为"02"的课程的同学的信息
-- ########################################################


  --方法1
select
  Student.*
from Student,
  SC
where
  Student.SID = SC.SID
  and SC.CID = '01'
  and not exists (
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
  and SC.CID = '01'
  and Student.SID not in (
    Select
      SC_2.SID
    from SC SC_2
    where
      SC_2.SID = SC.SID
      and SC_2.CID = '02'
  )
order by
  Student.SID;