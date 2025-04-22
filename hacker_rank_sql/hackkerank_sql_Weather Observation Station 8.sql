select
    distinct(city)
from
    station
where
    SUBSTR(CITY,-1,1) in ('a','e','i','o','u')
    and lower(SUBSTR(CITY,1,1)) in ('a','e','i','o','u');