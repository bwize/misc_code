CREATE INDEX lodes_centroid_wac_2003_indx
  ON lodes.lodes_wac_2003_block_geo_centroid
  USING gist
  (geom);


CREATE INDEX lodes_rac_block_centroid2003_geohash
  ON lodes.lodes_wac_2003_block_geo_centroid
  USING btree
  (st_geohash(geom, 4326) COLLATE pg_catalog."default");
ALTER TABLE lodes.lodes_wac_2003_block_geo_centroid CLUSTER ON lodes_rac_block_centroid2003_geohash;