-- ########################################################
-- Q02、查询"01"课程比"02"课程成绩低的学生的信息及课程分数
-- ########################################################

  --2.1、查询同时存在"01"课程和"02"课程的情况
  
select
  a.*,
  b.score 课程01的分数,
  c.score 课程02的分数
from Student a,
  SC b,
  SC c
where
  a.SID = b.SID
  and a.SID = c.SID
  and b.CID = '01'
  and c.CID = '02'
  and b.score < c.score;

  
--2.2、查询同时存在"01"课程和"02"课程的情况和不存在"01"课程但存在"02"课程的情况
select
  a.*,
  b.score 课程01的分数,
  c.score 课程02的分数
from Student a
left join SC b on a.SID = b.SID
  and b.CID = '01'
left join SC c on a.SID = c.SID
  and c.CID = '02'
where
  isnull(b.score, 0) < c.score;