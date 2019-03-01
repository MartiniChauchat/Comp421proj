select uid, COUNT(books.tripid) from books join trips t on books.tripid = t.tripid and t.starttime BETWEEN '2018-01-03' AND '2019-01-03' group by uid ORDER BY COUNT(books.tripid);

select uid, COUNT(leads.tripid) from leads join trips on leads.tripid = trips.tripid and trips.starttime between '2018-01-03' and '2019-01-03' group by uid order by count(leads.tripid);

select * from trips join hasstops h on trips.tripid = h.tripid and h.stopname = 'montreal' and starttime between '2019-02-14' and '2019-02-17' and startlocation = 'ottawa' order by price asc;

select username from drivers where username in (select v.owner from vehicles v group by v.owner having count(*) > 0);

select tripid from trips where price >= all (select price from trips);