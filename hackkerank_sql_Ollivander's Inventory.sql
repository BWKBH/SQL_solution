select
    wands.id
    , sub.age
    , sub.min_coin
    , sub.power
from
    (
        select wp.age as age,min(w.coins_needed) as min_coin,w.power as power, w.code as code
        from
            wands  as w
        join
            wands_property as wp
        on w.code=wp.code and wp.is_evil=0
        group by
            code
            , age
            , power
    ) as sub
join
    wands
on sub.min_coin=wands.coins_needed and
    wands.code=sub.code
order by
    sub.power desc,sub.age desc