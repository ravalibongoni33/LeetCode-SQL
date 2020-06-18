select '[0-5>' as bin, sum(case when duration >= 0 and duration < 5*60 then 1 else 0 end) as total from sessions 
union all
select '[5-10>' as bin, sum(case when duration >= 5*60 and duration < 10*60 then 1 else 0 end) as total from sessions
union all 
select '[10-15>' as bin, sum(case when duration >= 10*60 and duration < 15*60 then 1 else 0 end) as total from sessions
union all 
select '15 or more' as bin, sum(case when duration >= 15*60 then 1 else 0 end) as total from sessions
