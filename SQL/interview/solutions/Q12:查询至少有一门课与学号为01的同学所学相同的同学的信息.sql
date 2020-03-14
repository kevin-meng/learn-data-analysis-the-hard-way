-- ########################################################
-- Q12:查询至少有一门课与学号为"01"的同学所学相同的同学的信息
-- ########################################################


select
  distinct Student.*
from Student,
  SC
where
  Student.SID = SC.SID
  and SC.CID in (
    select
      CID
    from SC
    where
      SID = '01'
  )
  and Student.SID <> '01';

