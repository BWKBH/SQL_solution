select
    distinct(city)
from
    station
where
    left(city,1) not in ('A','E','O','U','I') or
    right(city,1) not in ('A','E','O','U','I')