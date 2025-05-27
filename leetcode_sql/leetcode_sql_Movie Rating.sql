with user_rank as (
    select
        user_id,
        count(movie_id) as user_rank
    from 
        movierating
    group by 
        user_id
    ),
    movie_rank as (
    select
        movie_id,
        avg(rating)
    from 
        movierating
    where
        created_at >= to_date('2020-02-01','yyyy-mm-dd') and 
        created_at <= to_date('2020-02-29','yyyy-mm-dd')
    group by movie_id
    ),

    highest_user_name as (
    select
        u.name as results
    from
        user_rank as ur
    join
        users as u
    on ur.user_id = u.user_id
    order by
        ur.user_rank desc
        , u.name
    limit 1
    ),
    highest_movie_name as (
    select 
        m.title as results
    from
        movie_rank as mr
    join
        movies as m
    on mr.movie_id = m.movie_id
    order by
        avg desc
        , title asc
    limit 1
    )
select
    *
from
    highest_user_name
union all
select 
    *
from 
    highest_movie_name;