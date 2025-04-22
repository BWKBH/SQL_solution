SELECT
    t1.start_date
    , t2.end_date
FROM
    (
        SELECT
            start_date, row_number() over(order by start_date) as id
        FROM
            projects
        WHERE
            start_date not in (SELECT end_date FROM projects)
    ) t1
    left join
    (SELECT
            end_date,row_number() over(order by end_date) as id
        FROM
            projects
        WHERE
            end_date not in (SELECT start_date FROM projects)
    ) t2
    on t1.id=t2.id
order by datediff(t2.end_date,t1.start_date), t1.start_date