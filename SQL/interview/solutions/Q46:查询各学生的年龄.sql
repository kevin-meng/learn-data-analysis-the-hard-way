-- ########################################################
-- Q46:查询各学生的年龄
-- ########################################################

--46.1 只按照年份来算
select
  *,
  datediff(yy, sage, getdate()) 年龄
from student;


 --46.2 按照出生日期来算，当前月日 < 出生年月的月日则，年龄减一
select
  *,
  case
    when right(convert(varchar(10), getdate(), 120), 5) < right(convert(varchar(10), sage, 120), 5) then datediff(yy, sage, getdate()) - 1
    else datediff(yy, sage, getdate())
  end 年龄
from student;
