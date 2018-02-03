select
    start_date,
    end_date
from
(
    select
        a.start_date,
        b.end_date,
        datediff(day, a.start_date, b.end_date) as comp_days
    from
    (
        select
            start_date,
            row_number() over (order by start_date) as row_num
        from
            projects
        where start_date not in
        (
            select
                end_date
            from
                projects
        )
    ) a
    inner join
    (
        select
            end_date,
            row_number() over (order by end_date) as row_num
        from
            projects
        where end_date not in
        (
            select
                start_date
            from
                projects
        )
    ) b
    on a.row_num = b.row_num
) c
order by comp_days asc, start_date
