select 
    activity_date as day,
    count(distinct(user_id)) as active_users
from 
    activity
where
    to_date('2019-07-27','yyyy-mm-dd') >= activity_date
    and activity_date > to_date('2019-06-27','yyyy-mm-dd')
group by
    activity_date
;