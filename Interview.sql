Select a.contest_id, a.hacker_id, a.name, sum(ts), sum(tas), sum(tv), sum(tuv) 
from contests as a
     inner join colleges as b on b.contest_id = a.contest_id
     inner join challenges as c on c.college_id = b.college_id
     left join (select challenge_id, sum(total_submissions) as ts, sum(total_accepted_submissions) as tas 
                from submission_stats group by challenge_id) as d on d.challenge_id = c.challenge_id
     left join (select challenge_id, sum(total_views) as tv, sum(total_unique_views) as tuv
                from view_stats group by challenge_id) as e on e.challenge_id = c.challenge_id
group by a.contest_id
order by a.contest_id
