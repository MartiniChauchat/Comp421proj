select uid, COUNT(books.tripid) from books
join trips t on
  books.tripid = t.tripid and
  t.starttime between '2019-07-03' and '2019-07-10'
group by uid
order by COUNT(books.tripid) desc;

select uid, COUNT(leads.tripid) from leads
join trips on
  leads.tripid = trips.tripid and
  trips.starttime between '2019-07-03' AND '2019-07-10'
group by uid
order by count(leads.tripid) desc;

select trips.tripId, trips.numberOfSeatsAvailable, trips.price, trips.startTime, trips.title from trips
join hasstops h on trips.tripid = h.tripid
where h.stopname = 'Mcgill' and
      (trips.starttime between '2019-07-01 10:20:00.000000' and '2019-07-17 10:20:00.000000') and
      trips.startlocation = 'Quebec'
order by price asc;

select drivers.userName, drivers.status from drivers
where username in (
  select v.owner from vehicles v
  group by v.owner
  having count(*) > 1
);

select trips.tripid from trips
where price >= all (
  select price from trips
);