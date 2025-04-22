select
    c.contest_id
    , c.hacker_id
    , c.name
    , sum(sts) sts
    , sum(stas) stas
    , sum(stv) stv
    , sum(stuv) stuv

from
    contests c
    left join colleges c2 on c.contest_id = c2.contest_id
    left join challenges c3 on c2.college_id = c3.college_id
    left join (
        select
            challenge_id,
            coalesce(sum(total_views), 0) stv,
            coalesce(sum(total_unique_views), 0) stuv
        from
            view_stats vs
        group by
            challenge_id
        ) sub1 on sub1.challenge_id = c3.challenge_id
left join (
        select
            challenge_id,
            coalesce(sum(total_submissions), 0) sts,
            coalesce(sum(total_accepted_submissions), 0) stas
        from
            submission_stats s
        group by
            challenge_id
        ) sub2 on sub2.challenge_id = c3.challenge_id
group by
    c.contest_id,
    c.hacker_id,
    c.name
having
    stv + stuv + sts + stas > 0
order by
    c.hacker_id