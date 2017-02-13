select h.hacker_id, name, c.num from hackers as h
inner join (select hacker_id, count(challenge_id) as num from challenges group by hacker_id) as c on c.hacker_id = h.hacker_id
where c.num = (select max(sc) from (
    select count(challenge_id) as sc from challenges group by hacker_id) as c1)
or c.num in(
    select n from (select count(challenge_id) as n from challenges group by hacker_id) as c3
    group by n having count(n) = 1)
order by c.num desc, h.hacker_id
