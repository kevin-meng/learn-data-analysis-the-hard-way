-- ########################################################
-- Q6:查询"李"姓老师的数量
-- ########################################################

  --方法1
select
  count(Tname) 李姓老师的数量
from Teacher
where
  Tname like '李%';
  
 --方法2
select
  count(Tname) 李姓老师的数量
from Teacher
where
  left(Tname, 1) = '李';