-- ########################################################
-- Q17:按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩
-- ########################################################



--17.1 SQL 2000 静态
select
  a.SID 学生编号,
  a.Sname 学生姓名,
  max(
    case
      c.Cname
      when '语文' then b.score
      else null
    end
  ) 语文,
  max(
    case
      c.Cname
      when '数学' then b.score
      else null
    end
  ) 数学,
  max(
    case
      c.Cname
      when '英语' then b.score
      else null
    end
  ) 英语,
  cast(avg(b.score) as decimal(18, 2)) 平均分
from Student a
left join SC b on a.SID = b.SID
left join Course c on b.CID = c.CID
group by
  a.SID,
  a.Sname
order by
  平均分 desc;
  
  
  
  
   --17.2 SQL 2000 动态
  declare @sql nvarchar(4000)
set
  @sql = 'select a.SID ' + '学生编号' + ' , a.Sname ' + '学生姓名'
select
  @sql = @sql + ',max(case c.Cname when ''' + Cname + ''' then b.score else null end) ' + Cname + ' '
from (
    select
      distinct Cname
    from Course
  ) as t
set
  @sql = @sql + ' , cast(avg(b.score) as decimal(18,2)) ' + '平均分' + ' from Student a left join SC b on a.SID = b.SID left join Course c on b.CID = c.CID
group by a.SID , a.Sname order by ' + '平均分' + ' desc' exec(@sql)