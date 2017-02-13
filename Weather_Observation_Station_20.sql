if (select count(rank.lat_n) from (
    select lat_n, row_number() over(order by lat_n desc) as descRow, row_number() over(order by lat_n asc) as ascRow
    from station) as rank
    where rank.descRow in (rank.ascRow, rank.ascRow+1, rank.ascRow-1)) = 1
  begin
    select cast(rank.lat_n as numeric(36,4)) from (
    select lat_n, row_number() over(order by lat_n desc) as descRow, row_number() over(order by lat_n asc) as ascRow
    from station) as rank
    where rank.descRow in (rank.ascRow, rank.ascRow+1, rank.ascRow-1)
  end
else
  begin   
    select cast(avg(rank.lat_n) as numeric(36,4)) from (select lat_n, row_number() over(order by lat_n desc) as descRow, row_number() over(order by lat_n asc) as ascRow
    from station) as rank
    where rank.descRow in (rank.ascRow, rank.ascRow+1, rank.ascRow-1)
  end
