-- ########################################################
-- Q29:查询名字中含有"风"字的学生信息
-- ########################################################


select
  *
from student
where
  sname like N'%风%'
select
  *
from student
where
  charindex(N'风', sname) > 0;