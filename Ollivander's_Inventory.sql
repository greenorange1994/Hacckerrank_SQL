select w.id, wp.age, w.coins_needed, pow from wands_property as wp
inner join (select id, coins_needed, code, [power] as pow, row_number() over(partition by code, [power] order by coins_needed) as RN from wands) as w on w.code = wp.code
where wp.is_evil = 0 and w.RN = 1
order by w.pow desc, wp.age desc 
