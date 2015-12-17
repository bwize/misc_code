 SELECT 
    geoheader_2013.name,
    geoheader_2013.geoid_acs,
    geoheader_2013.geoid

   FROM acs_2013.geoheader_2013 where name ilike 'Los Angel%' and geoheader_2013.geoid ~~ '31000%'::text


 SELECT geo_cbsa.geoid,
    geo_cbsa.shid,
    geoheader_2013.name,
    seq0002_2013.b010010001 AS total__total_pop,
    seq0002_2013.b010010002 AS gender__female,
    seq0002_2013.b010010026 AS gender__male
       FROM acs_2013.geoheader_2013
     JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
     JOIN geo_cbsa ON geo_cbsa.geoid::text = geoheader_2013.geoid_acs
     WHERE geoheader_2013.geoid::text ~~ '31000%'::text



select geo_cbsa.geoid, geoheader_2013.geoid_acs from acs_2013.geoheader_2013
FULL OUTER JOIN geo_cbsa ON geo_cbsa.geoid::text = geoheader_2013.geoid_acs
where geoheader_2013.geoid_acs is null or geo_cbsa.geoid is null and geoheader_2013.geoid_acs ilike '31000%'

select 
