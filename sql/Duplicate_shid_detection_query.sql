select t2.shid, count(t1.shid)/2 from all_over18_place as t1
join all_over18_place as t2 on t1.shid = t2.shid
group by t2.shid
having count(t1.shid) > 1;

-- 
-- select * from all_over18_place where shid = 'country:us/state:tx/place:sunset_cdp'
-- 
-- delete from all_over18_place where place_str = '4871274'