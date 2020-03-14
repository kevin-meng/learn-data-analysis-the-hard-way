-- ########################################################
--Q31:查询1990年出生的学生名单(注：Student表中Sage列的类型是datetime)
-- ########################################################

select
  *
from Student
where
  year(sage) = 1990
select
  *
from Student
where
  datediff(yy, sage, '1990-01-01') = 0
select
  *
from Student
where
  datepart(yy, sage) = 1990
select
  *
from Student
where
  convert(varchar(4), sage, 120) = '1990';
