with req as 
    (
        select
            requester_id as id
            , count(accepter_id)
        from
            RequestAccepted 
        group by 
            requester_id
        
        union all

        select
            accepter_id as id   
            , count(requester_id)
        from 
            requestaccepted
        group by
            accepter_id
    )
select
    id,
    sum(count) as num
from 
    req
group by 
    id
order by sum(count) desc
limit 1
;