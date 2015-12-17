
 SELECT seq0001_2013.stusab,
    seq0001_2013.logrecno,
    geoheader_2013.geoid,
    substring(geoid from position('US' in geoid)+2 for char_length(geoid)) as geoid_trim,
    dash_blockgroup_geo.blk_grp_st,
    dash_blockgroup_geo.shid,
    COALESCE(seq0103_2013.b250040002 / NULLIF((seq0103_2013.b250040002 + seq0103_2013.b250030003), 0), 0) * 100 AS houseunit__total__rental_vacancy_rate__percent__1,
    geoheader_2013.name
   FROM acs_2013.seq0001_2013
     JOIN acs_2013.geoheader_2013 USING (stusab, logrecno)
     JOIN acs_2013.seq0103_2013 USING (stusab, logrecno)
     JOIN dash_blockgroup_geo ON dash_blockgroup_geo.blk_grp_st = substring(geoid from position('US' in geoid)+2 for char_length(geoid))

where geoid ilike '15000%' order by COALESCE(seq0103_2013.b250040002 / NULLIF((seq0103_2013.b250040002 + seq0103_2013.b250030003), 0), 0) * 100 DESC