-- ########################################################
-- Q28:查询Q男生:女生人数
-- ########################################################

select
  count(Ssex) as 男生人数
from Student
where
  Ssex = N'男'
select
  count(Ssex) as 女生人数
from Student
where
  Ssex = N'女'
select
  sum(
    case
      when Ssex = N'男' then 1
      else 0
    end
  ) 男生人数,
  sum(
    case
      when Ssex = N'女' then 1
      else 0
    end
  ) 女生人数
from student
select
  case
    when Ssex = N'男' then N'男生人数'
    else N'女生人数'
  end 男女情况,
  count(1) 人数
from student
group by
  case
    when Ssex = N'男' then N'男生人数'
    else N'女生人数'
  end;