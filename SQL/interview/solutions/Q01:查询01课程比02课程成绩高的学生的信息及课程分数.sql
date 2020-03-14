-- ########################################################
-- Q01:查询01课程比02课程成绩高的学生的信息及课程分数
-- ########################################################
--1.1、查询同时存在"01"课程和"02"课程的情况

select
  a.*,
  b.score,  -- 课程01的分数,
  c.score --  课程02的分数
from Student a,
  SC b,
  SC c
where
  a.SID = b.SID
  and a.SID = c.SID
  and b.CID = '01'
  and c.CID = '02'
  and b.score > c.score;

--1.2、查询同时存在"01"课程和"02"课程的情况和存在"01"课程但可能不存在"02"课程的情况
-- (不存在时显示为null)(以下存在相同内容时不再解释)

select
  a.*,
  b.score,-- 课程01的分数,
  c.score-- 课程02的分数
from Student a
left join SC b on a.SID = b.SID
  and b.CID = '01'
left join SC c on a.SID = c.SID
  and c.CID = '02'
where
  b.score > isnull(c.score);
