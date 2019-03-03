select t2.tripid, t2.price, t2.price - avg(t2.price) over (
  partition by t2.numberofseatsavailable
) as realtivePricee from trips t2
where t2.tripid in (
  select t.tripid from trips t
  join hasstops on t.tripid = hasstops.tripid
  where hasstops.stopname = 'BellCentre' and
        t.starttime between '2019-02-14' and '2019-07-17' and
        t.startlocation = 'Quebec'
);