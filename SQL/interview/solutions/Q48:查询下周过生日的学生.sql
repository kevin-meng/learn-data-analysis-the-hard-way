-- ########################################################
-- Q48:查询下周过生日的学生
-- ########################################################
select
  *
from student
where
  datediff(
    week,
    datename(yy, getdate()) + right(convert(varchar(10), sage, 120), 6),
    getdate()
  ) = -1;