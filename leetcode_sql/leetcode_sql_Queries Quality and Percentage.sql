select
    query_name,
    round(avg(rating/position :: numeric),2) as quality,
    round(avg(case
        when rating < 3 then 1
        else 0
    end)*100,2) as poor_query_percentage
from 
    queries
group by
    query_name

