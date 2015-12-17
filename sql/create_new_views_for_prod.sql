--CREATE VIEW foreign_born_lowerdistrict as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid)) as geoid_trim,
    dash_lowerdistrict_geo.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,
    


    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN dash_lowerdistrict_geo ON dash_lowerdistrict_geo.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '62000%'

--CREATE VIEW foreign_born_state as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    dash_state_geo100.state_str,
    dash_state_geo100.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN dash_state_geo100 ON dash_state_geo100.state_str = substring(geoid from position('US' in geoid)+2 for char_length(geoid))

where geoid ilike '04000%'


--CREATE VIEW foreign_born_tract as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    dash_tract_geo100.tract_str,
    dash_tract_geo100.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN dash_tract_geo100 ON dash_tract_geo100.tract_str = substring(geoid from position('US' in geoid)+2 for char_length(geoid))

where geoid ilike '14000%'


--CREATE VIEW foreign_born_upperdistrict as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid)) as geoid_trim,
    dash_upperdistrict_geo.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN dash_upperdistrict_geo ON dash_upperdistrict_geo.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '61000%'


--CREATE VIEW foreign_born_usd as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    dash_usd_geo100.sch_str,
    dash_usd_geo100.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN dash_usd_geo100 ON dash_usd_geo100.sch_str = substring(geoid from position('US' in geoid)+2 for char_length(geoid))

where geoid ilike '97000%'


--CREATE VIEW foreign_born_place as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    dash_place_geo100.place_str,
    dash_place_geo100.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN dash_place_geo100 ON dash_place_geo100.place_str = substring(geoid from position('US' in geoid)+2 for char_length(geoid))

where geoid ilike '16000%'


--CREATE VIEW foreign_born_county as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    dash_county_geo100.county_str,
    dash_county_geo100.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN dash_county_geo100 ON dash_county_geo100.county_str = substring(geoid from position('US' in geoid)+2 for char_length(geoid))

where geoid ilike '05000%'


--CREATE VIEW foreign_born_congressionaldistrict as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    "substring"(geoheader_2013.geoid::text, "position"(geoheader_2013.geoid::text, 'US'::text) + 2, char_length(geoheader_2013.geoid::text)) AS geoid_trim,
    concat(dash_congressionaldistrict_geo.state, dash_congressionaldistrict_geo.district) AS cd_str,
    dash_congressionaldistrict_geo.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN dash_congressionaldistrict_geo ON concat(dash_congressionaldistrict_geo.state, dash_congressionaldistrict_geo.district) = "substring"(geoheader_2013.geoid::text, "position"(geoheader_2013.geoid::text, 'US'::text) + 2, char_length(geoheader_2013.geoid::text))
  WHERE geoheader_2013.geoid::text ~~* '50000%'::text;


--CREATE VIEW foreign_born_blockgroup as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    dash_blockgroup_geo100.blk_grp_st,
    dash_blockgroup_geo100.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN dash_blockgroup_geo100 ON dash_blockgroup_geo100.blk_grp_st = substring(geoid from position('US' in geoid)+2 for char_length(geoid))

where geoid ilike '15000%'


--CREATE VIEW foreign_born_zip as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    dash_zip_geo100.zip_str,
    dash_zip_geo100.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN dash_zip_geo100 ON dash_zip_geo100.zip_str = substring(geoid from position('US' in geoid)+2 for char_length(geoid))

where geoid ilike '86000%'


--CREATE VIEW foreign_born_countysub as

SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    dash_county_subdivision_geo.county_subdivision_id,
    dash_county_subdivision_geo.shid,
    seq0010_2013.b050050001 / NULLIF(seq0002_2013.b010010001, 0) * 100 as pop__total__born_outside_of_us__percent,

    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
    JOIN dash_county_subdivision_geo ON dash_county_subdivision_geo.county_subdivision_id::numeric = "substring"(geoheader_2013.geoid::text, "position"(geoheader_2013.geoid::text, 'US'::text) + 2, char_length(geoheader_2013.geoid::text))::numeric
  WHERE geoheader_2013.geoid::text ~~* '06000%'::text;
