select a.bin, coalesce(a.total,0)
from
(SELECT CASE WHEN duration/60 >= 0 AND duration/60 <= 5
                            THEN '[0-5>'
                            WHEN duration/60 >= 5 AND duration/60 <= 10
                            THEN '[5-10>'
                            WHEN duration/60 >= 10 AND duration/60 <= 15
                            THEN '[10-15>'
                            ELSE '15 or more'
                        END AS bin,
            count(session_id) as total
from sessions
group by bin) a