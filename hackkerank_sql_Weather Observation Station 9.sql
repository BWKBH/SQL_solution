select
    distinct(city) 
from
    station
where
    left(city,1) not in ('A','E','O','I','U')