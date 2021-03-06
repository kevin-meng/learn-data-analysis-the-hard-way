-- ############################################################################################
-- Q43:统计每门课程的学生选修人数（超过5人的课程才统计）。
--     要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列
-- ############################################################################################
select
  Course.CID,
  Course.Cname,
  count(*) 学生人数
from Course,
  SC
where
  Course.CID = SC.CID
group by
  Course.CID,
  Course.Cname
having
  count(*) >= 5
order by
  学生人数 desc,
  Course.CID;
