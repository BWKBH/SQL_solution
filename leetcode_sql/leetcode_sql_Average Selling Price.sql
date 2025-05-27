-- Write your PostgreSQL query statement below
select 
    p.product_id,
    coalesce(
        round(
            sum(p.price * u.units)/sum(u.units)::numeric
            ,2
            ),0 
        )as average_price
from 
    prices as p
left outer join 
    unitsSold as u
on
    p.start_date <= u.purchase_date
    and p.end_date >= u.purchase_date
    and p.product_id = u.product_id
group by
    p.product_id
;