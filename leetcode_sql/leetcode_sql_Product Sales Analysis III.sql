with temp as (
    select
        s.*
        ,RANK() over(partition by s.product_id order by s.year asc) as min_year
    from
        sales as s
    )
select 
    t.product_id
    , t.year as first_year
    , t.quantity
    , t.price
from
    temp as t 
where
    t.min_year = 1