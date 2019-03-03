select t.startLocation, c.cityname, count(books.uid) from books
inner join trips t on books.tripid = t.tripid
  inner join hasstops h on t.tripid = h.tripid
  inner join stops s on h.cityid = s.cityid and h.stopname = s.stopname
  inner join cities c on s.cityid = c.cityid
group by (t.startLocation, c.cityname)
order by count(books.uid) desc;