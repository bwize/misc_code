CREATE MATERIALIZED VIEW broadband_techtype_state AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_state AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_blockgroup AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_blockgroup AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);




------------------

CREATE MATERIALIZED VIEW broadband_techtype_congressionaldistrict AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_congressionaldistrict AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_county AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_county AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_countysubdivision AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_county_sub AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_lowerdistrict AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_lowerdistrict AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_place AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_place AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_tract AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_tract AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_upperdistrict AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_upperdistrict AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_usd AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_usd AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_zip AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_zip AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_neighborhood AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_neighborhood AS g
    WHERE ST_Intersects(p.geomvalid, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);


------------------

CREATE MATERIALIZED VIEW broadband_techtype_citycouncil AS
SELECT *
FROM crosstab($$
SELECT
res.shid, 
res.techtype,
count(CASE WHEN res.provname IS NOT NULL THEN '1' END)::int AS provider_count
FROM 
    (SELECT p.provname, p.techtype, g.shid FROM upload.broadband_all_merged AS p, geo_citycouncil AS g
    WHERE ST_Intersects(p.geom, g.geom) 
    GROUP BY p.provname, p.techtype, g.shid
    ORDER BY g.shid, p.techtype, p.provname) 
AS res
WHERE res.techtype = ANY('{{1,2,3,4,5,6}}')
GROUP BY res.shid, res.techtype
ORDER BY 1,2,3
$$, 'select m from generate_series(1,6) m') 
AS ct (shid varchar(254), 
    -- 1
    "broadband__dsl__count" int, 
    -- 2
    "broadband__cable__count" int, 
    -- 3
    "broadband__fiber__count" int, 
    -- 4
    "broadband__satellite__count" int, 
    -- 5
    "broadband__wireless__count" int, 
    -- 6
    "broadband__other__count" int);
