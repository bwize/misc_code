CREATE MATERIALIZED VIEW broadband_maxup_congressionaldistrict AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxadup::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxadup, g.shid FROM upload.broadband_all_merged AS p, geo_congressionaldistrict AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxadup, g.shid
    ORDER BY g.shid, p.maxadup, p.provname) 
AS res

WHERE res.maxadup = ANY('{{2,3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxadup
ORDER BY 1,2,3
$$, 'select m from generate_series(2,11) m') 
AS ct (shid varchar(254), 
    --2
    "broadband__max_upload__200_kbps_to_768_kbps__count" int,
    -- 3
    "broadband__max_upload__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_upload__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_upload__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_upload__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_upload__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_upload__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_upload__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_upload__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_upload__greater_than_1_gbps__count" int);                  


-----------------------------------------------------------------




CREATE MATERIALIZED VIEW broadband_maxup_usd AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxadup::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxadup, g.shid FROM upload.broadband_all_merged AS p, geo_usd AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxadup, g.shid
    ORDER BY g.shid, p.maxadup, p.provname) 
AS res

WHERE res.maxadup = ANY('{{2,3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxadup
ORDER BY 1,2,3
$$, 'select m from generate_series(2,11) m') 
AS ct (shid varchar(254), 
    --2
    "broadband__max_upload__200_kbps_to_768_kbps__count" int,
    -- 3
    "broadband__max_upload__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_upload__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_upload__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_upload__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_upload__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_upload__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_upload__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_upload__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_upload__greater_than_1_gbps__count" int);                  


-----------------------------------------------------------------





CREATE MATERIALIZED VIEW broadband_maxup_citycouncil AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxadup::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxadup, g.shid FROM upload.broadband_all_merged AS p, geo_citycouncil AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxadup, g.shid
    ORDER BY g.shid, p.maxadup, p.provname) 
AS res

WHERE res.maxadup = ANY('{{2,3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxadup
ORDER BY 1,2,3
$$, 'select m from generate_series(2,11) m') 
AS ct (shid varchar(254), 
    --2
    "broadband__max_upload__200_kbps_to_768_kbps__count" int,
    -- 3
    "broadband__max_upload__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_upload__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_upload__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_upload__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_upload__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_upload__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_upload__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_upload__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_upload__greater_than_1_gbps__count" int);                  


-----------------------------------------------------------------





CREATE MATERIALIZED VIEW broadband_maxup_zip AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxadup::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxadup, g.shid FROM upload.broadband_all_merged AS p, geo_zip AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxadup, g.shid
    ORDER BY g.shid, p.maxadup, p.provname) 
AS res

WHERE res.maxadup = ANY('{{2,3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxadup
ORDER BY 1,2,3
$$, 'select m from generate_series(2,11) m') 
AS ct (shid varchar(254), 
    --2
    "broadband__max_upload__200_kbps_to_768_kbps__count" int,
    -- 3
    "broadband__max_upload__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_upload__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_upload__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_upload__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_upload__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_upload__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_upload__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_upload__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_upload__greater_than_1_gbps__count" int);                  


-----------------------------------------------------------------





CREATE MATERIALIZED VIEW broadband_maxup_neighborhood AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxadup::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxadup, g.shid FROM upload.broadband_all_merged AS p, geo_neighborhood AS g
    WHERE ST_Intersects(p.geom, g.geomvalid) 
    GROUP BY p.provname, p.maxadup, g.shid
    ORDER BY g.shid, p.maxadup, p.provname) 
AS res

WHERE res.maxadup = ANY('{{2,3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxadup
ORDER BY 1,2,3
$$, 'select m from generate_series(2,11) m') 
AS ct (shid varchar(254), 
    --2
    "broadband__max_upload__200_kbps_to_768_kbps__count" int,
    -- 3
    "broadband__max_upload__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_upload__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_upload__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_upload__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_upload__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_upload__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_upload__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_upload__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_upload__greater_than_1_gbps__count" int);                  


-----------------------------------------------------------------





CREATE MATERIALIZED VIEW broadband_maxup_tract AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxadup::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxadup, g.shid FROM upload.broadband_all_merged AS p, geo_tract AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxadup, g.shid
    ORDER BY g.shid, p.maxadup, p.provname) 
AS res

WHERE res.maxadup = ANY('{{2,3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxadup
ORDER BY 1,2,3
$$, 'select m from generate_series(2,11) m') 
AS ct (shid varchar(254), 
    --2
    "broadband__max_upload__200_kbps_to_768_kbps__count" int,
    -- 3
    "broadband__max_upload__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_upload__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_upload__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_upload__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_upload__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_upload__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_upload__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_upload__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_upload__greater_than_1_gbps__count" int);                  


-----------------------------------------------------------------





CREATE MATERIALIZED VIEW broadband_maxup_blockgroup AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxadup::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxadup, g.shid FROM upload.broadband_all_merged AS p, geo_blockgroup AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxadup, g.shid
    ORDER BY g.shid, p.maxadup, p.provname) 
AS res

WHERE res.maxadup = ANY('{{2,3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxadup
ORDER BY 1,2,3
$$, 'select m from generate_series(2,11) m') 
AS ct (shid varchar(254), 
    --2
    "broadband__max_upload__200_kbps_to_768_kbps__count" int,
    -- 3
    "broadband__max_upload__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_upload__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_upload__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_upload__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_upload__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_upload__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_upload__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_upload__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_upload__greater_than_1_gbps__count" int);                  

------------------------------------------------------------------


---------------------------------------


CREATE MATERIALIZED VIEW broadband_maxdown_congressionaldistrict AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxaddown::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxaddown, g.shid FROM upload.broadband_all_merged AS p, geo_congressionaldistrict AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxaddown, g.shid
    ORDER BY g.shid, p.maxaddown, p.provname) 
AS res

WHERE res.maxaddown = ANY('{{3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxaddown
ORDER BY 1,2,3
$$, 'select m from generate_series(3,11) m') 
AS ct (shid varchar(254), 
    -- 3
    "broadband__max_download__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_download__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_download__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_download__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_download__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_download__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_download__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_download__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_download__greater_than_1_gbps__count" int); 



----------------------------------------------------------------------  `


CREATE MATERIALIZED VIEW broadband_maxdown_usd AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxaddown::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxaddown, g.shid FROM upload.broadband_all_merged AS p, geo_usd AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxaddown, g.shid
    ORDER BY g.shid, p.maxaddown, p.provname) 
AS res

WHERE res.maxaddown = ANY('{{3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxaddown
ORDER BY 1,2,3
$$, 'select m from generate_series(3,11) m') 
AS ct (shid varchar(254), 
    -- 3
    "broadband__max_download__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_download__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_download__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_download__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_download__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_download__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_download__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_download__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_download__greater_than_1_gbps__count" int); 



----------------------------------------------------------------------  



CREATE MATERIALIZED VIEW broadband_maxdown_citycouncil AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxaddown::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxaddown, g.shid FROM upload.broadband_all_merged AS p, geo_citycouncil AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxaddown, g.shid
    ORDER BY g.shid, p.maxaddown, p.provname) 
AS res

WHERE res.maxaddown = ANY('{{3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxaddown
ORDER BY 1,2,3
$$, 'select m from generate_series(3,11) m') 
AS ct (shid varchar(254), 
    -- 3
    "broadband__max_download__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_download__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_download__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_download__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_download__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_download__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_download__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_download__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_download__greater_than_1_gbps__count" int); 



----------------------------------------------------------------------  



CREATE MATERIALIZED VIEW broadband_maxdown_zip AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxaddown::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxaddown, g.shid FROM upload.broadband_all_merged AS p, geo_zip AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxaddown, g.shid
    ORDER BY g.shid, p.maxaddown, p.provname) 
AS res

WHERE res.maxaddown = ANY('{{3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxaddown
ORDER BY 1,2,3
$$, 'select m from generate_series(3,11) m') 
AS ct (shid varchar(254), 
    -- 3
    "broadband__max_download__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_download__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_download__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_download__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_download__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_download__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_download__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_download__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_download__greater_than_1_gbps__count" int); 



----------------------------------------------------------------------  



CREATE MATERIALIZED VIEW broadband_maxdown_neighborhood AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxaddown::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxaddown, g.shid FROM upload.broadband_all_merged AS p, geo_neighborhood AS g
    WHERE ST_Intersects(p.geom, g.geomvalid) 
    GROUP BY p.provname, p.maxaddown, g.shid
    ORDER BY g.shid, p.maxaddown, p.provname) 
AS res

WHERE res.maxaddown = ANY('{{3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxaddown
ORDER BY 1,2,3
$$, 'select m from generate_series(3,11) m') 
AS ct (shid varchar(254), 
    -- 3
    "broadband__max_download__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_download__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_download__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_download__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_download__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_download__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_download__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_download__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_download__greater_than_1_gbps__count" int); 



----------------------------------------------------------------------  



CREATE MATERIALIZED VIEW broadband_maxdown_tract AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxaddown::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxaddown, g.shid FROM upload.broadband_all_merged AS p, geo_tract AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxaddown, g.shid
    ORDER BY g.shid, p.maxaddown, p.provname) 
AS res

WHERE res.maxaddown = ANY('{{3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxaddown
ORDER BY 1,2,3
$$, 'select m from generate_series(3,11) m') 
AS ct (shid varchar(254), 
    -- 3
    "broadband__max_download__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_download__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_download__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_download__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_download__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_download__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_download__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_download__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_download__greater_than_1_gbps__count" int); 



----------------------------------------------------------------------  



CREATE MATERIALIZED VIEW broadband_maxdown_blockgroup AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.maxaddown::int,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.maxaddown, g.shid FROM upload.broadband_all_merged AS p, geo_blockgroup AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.maxaddown, g.shid
    ORDER BY g.shid, p.maxaddown, p.provname) 
AS res

WHERE res.maxaddown = ANY('{{3,4,5,6,7,8,9,10,11}}')
GROUP BY res.shid, res.maxaddown
ORDER BY 1,2,3
$$, 'select m from generate_series(3,11) m') 
AS ct (shid varchar(254), 
    -- 3
    "broadband__max_download__768_kbps_to_1.5_mbps__count" int, 
    -- 4
    "broadband__max_download__1.5_mbps_to_3_mbps__count" int, 
    -- 5
    "broadband__max_download__3_mbps_to_6_mbps__count" int, 
    -- 6
    "broadband__max_download__6_mbps_to_10_mbps__count" int, 
    -- 7
    "broadband__max_download__10_mbps_to_25_mbps__count" int, 
    -- 8
    "broadband__max_download__25_mbps_to_50_mbps__count" int, 
    -- 9
    "broadband__max_download__50_mbps_to_100_mbps__count" int, 
    -- 10
    "broadband__max_download__100_mbps_to_1_gbps__count" int, 
    -- 11
    "broadband__max_download__greater_than_1_gbps__count" int); 