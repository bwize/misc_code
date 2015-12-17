CREATE MATERIALIZED VIEW foreign_born_pop_lowerdistrict as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid)) as geoid_trim,
    geo_lowerdistrict.shid,
    geoheader_2013.name,

seq0010_2013.b050060001 as pop__total__foreign_born__count

   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN geo_lowerdistrict ON geo_lowerdistrict.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '62000%';



CREATE MATERIALIZED VIEW foreign_born_pop_state as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    --geoheader_2013.geoid,
    --substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid)) as geoid_trim,
    geo_state.geoid,
    geo_state.shid,
    geoheader_2013.name,

    seq0010_2013.b050060001 as pop__total__foreign_born__count

     FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN geo_state ON geo_state.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '04000%';


CREATE MATERIALIZED VIEW foreign_born_pop_tract as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    --geoheader_2013.geoid,
    --substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid)) as geoid_trim,
    geo_tract.geoid,
    geo_tract.shid,
    geoheader_2013.name,
   seq0010_2013.b050060001 as pop__total__foreign_born__count
   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN geo_tract ON geo_tract.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '14000%';

CREATE MATERIALIZED VIEW foreign_born_pop_upperdistrict as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid)) as geoid_trim,
    geo_upperdistrict.shid,
    geoheader_2013.name,
 seq0010_2013.b050060001 as pop__total__foreign_born__count
        
   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN geo_upperdistrict ON geo_upperdistrict.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '61000%';

CREATE MATERIALIZED VIEW foreign_born_pop_usd as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    --geoheader_2013.geoid,
    --substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid)) as geoid_trim,
    geo_usd.geoid,
    geo_usd.shid,
    geoheader_2013.name,
 seq0010_2013.b050060001 as pop__total__foreign_born__count
        
   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN geo_usd ON geo_usd.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '97000%';

CREATE MATERIALIZED VIEW foreign_born_pop_place as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    --geoheader_2013.geoid,
    --substring(geoheader_2013.geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    geo_place.geoid,
    geo_place.shid,
    geoheader_2013.name,
 seq0010_2013.b050060001 as pop__total__foreign_born__count
        
   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN geo_place ON geo_place.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '16000%';

CREATE MATERIALIZED VIEW foreign_born_pop_county as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    --geoheader_2013.geoid,
    --substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    geo_county.geoid,
    geo_county.shid,
    geoheader_2013.name,
 seq0010_2013.b050060001 as pop__total__foreign_born__count

   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN geo_county ON geo_county.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '05000%';

CREATE MATERIALIZED VIEW foreign_born_pop_congressionaldistrict as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    --geoheader_2013.geoid,
    --"substring"(geoheader_2013.geoid::text, "position"(geoheader_2013.geoid::text, 'US'::text) + 2, char_length(geoheader_2013.geoid::text)) AS geoid_trim,
    concat(geo_congressionaldistrict.state, geo_congressionaldistrict.district) AS geoid,
    geo_congressionaldistrict.shid,
    geoheader_2013.name,
   seq0010_2013.b050060001 as pop__total__foreign_born__count
        
   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     
     JOIN geo_congressionaldistrict ON concat(geo_congressionaldistrict.state, geo_congressionaldistrict.district) = "substring"(geoheader_2013.geoid::text, "position"(geoheader_2013.geoid::text, 'US'::text) + 2, char_length(geoheader_2013.geoid::text))
  WHERE geoheader_2013.geoid::text ~~* '50000%'::text;

CREATE MATERIALIZED VIEW foreign_born_pop_countysub as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    --geoheader_2013.geoid,
    --substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    geo_county_subdivision.geoid,
    geo_county_subdivision.shid,
    geoheader_2013.name,
   seq0010_2013.b050060001 as pop__total__foreign_born__count
        
   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
    JOIN geo_county_subdivision ON geo_county_subdivision.geoid::numeric = "substring"(geoheader_2013.geoid::text, "position"(geoheader_2013.geoid::text, 'US'::text) + 2, char_length(geoheader_2013.geoid::text))::numeric
  WHERE geoheader_2013.geoid::text ~~* '06000%'::text;

CREATE MATERIALIZED VIEW foreign_born_pop_zip as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    --geoheader_2013.geoid,
    --substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    geo_zip.geoid,
    geo_zip.shid,
    geoheader_2013.name,
  seq0010_2013.b050060001 as pop__total__foreign_born__count
        
   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
     JOIN geo_zip ON geo_zip.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '86000%';


CREATE MATERIALIZED VIEW foreign_born_pop_countysub as

SELECT seq0103_2013.stusab,
    seq0103_2013.logrecno,
    --geoheader_2013.geoid,
    --substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    geo_county_subdivision.geoid,
    geo_county_subdivision.shid,
    geoheader_2013.name,
  seq0010_2013.b050060001 as pop__total__foreign_born__count
        
   FROM acs_2013.seq0103_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
    JOIN geo_county_subdivision ON geo_county_subdivision.geoid::numeric = "substring"(geoheader_2013.geoid::text, "position"(geoheader_2013.geoid::text, 'US'::text) + 2, char_length(geoheader_2013.geoid::text))::numeric
  WHERE geoheader_2013.geoid::text ~~* '06000%'::text;


--blockgroups

SELECT seq0104_2013.stusab,
   seq0104_2013.logrecno,
   geoheader_2013.geoid,
   substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid)) as geoid_trim,
   geo_blockgroup.geoid,
   geo_blockgroup.shid,
   geoheader_2013.name,
   
seq0010_2013.b050060001 as pop__total__foreign_born__count

  FROM acs_2013.seq0104_2013
    JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
    JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
    JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
    JOIN geo_blockgroup ON geo_blockgroup.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))

where geoheader_2013.geoid ilike '15000%';