select
    sub.city
    , length(sub.city)
from
    (
        select
            city
        from
            station
        where
            length(city) = (select min(length(city)) from station)
        order by
            city
        limit 1
        ) as sub;

select
    sub.city
    , length(sub.city)
from (
    select
        city
    from
        station
    where
        length(city) = (select max(length(city)) from station)
    order by
        city
    limit 1
) as sub;

