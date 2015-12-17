alter table dash_usd_geo                                                                                                                                                                
alter column geom                                                                                       
type Geometry(MultiPolygon, 4326)                                                                                   
using ST_Transform(geom, 4326)


CREATE TABLE dash_usd_geo
as select * from dash_usd_geo100

CREATE INDEX usd4326_geo_spatial_index
  ON dash_usd_geo
  USING gist
  (geom);