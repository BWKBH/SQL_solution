select
    sub.id
    , sub.name
    , sum(sub.score) as t_score
from (
        SELECT
            h.hacker_id AS id
            , s.challenge_id as ch_id
            , max(s.score) AS score
            , h.name AS name
        FROM
            hackers AS h
        RIGHT JOIN
            submissions AS s
        ON h.hacker_id = s.hacker_id
        group by
            id, ch_id, name
    ) as sub
group by
    sub.id
    , sub.name
having
    t_score!=0
order by
    t_score desc
    , sub.id