select h.hacker_id, name from submissions as s
inner join hackers as h on h.hacker_id = s.hacker_id
inner join (select challenge_id, difficulty_level from challenges) as c on c.challenge_id = s.challenge_id
inner join (select difficulty_level, score as full_score from difficulty) as d on d.difficulty_level = c.difficulty_level
where s.score = d.full_score group by h.hacker_id
having count(c.challenge_id) > 1 
order by count(c.challenge_id) desc, h.hacker_id asc
