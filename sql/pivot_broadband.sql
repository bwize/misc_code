SELECT *
FROM crosstab($$
select 
res.shid, 
res.maxaddown::int,
count(CASE WHEN res.provname is not null THEN '1' END)::int as provider_count
from (
	select p.provname, p.maxaddown, g.shid from upload.broadband_ia_test as p, geo_state as g
        WHERE ST_Intersects(p.geom, g.geom) 
	group by p.provname, p.maxaddown, g.shid
	order by g.shid, p.maxaddown, p.provname
) as res
where res.maxaddown = any('{{3,4,5,6,7,8,9,10,11}}')
group by res.shid, res.maxaddown
order by 1,2,3
$$, 'select m from generate_series(3,11) m') 
AS ct (shid varchar(254), "three" int, "four" int, "five" int, "six" int,"seven" int, "eight" int,"nine" int, "ten" int,"eleven" int)                   