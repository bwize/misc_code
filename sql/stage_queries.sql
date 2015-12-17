delete from dashboard_public_characteristic
where geom_feature_id in (
select f.id
from dashboard_public_polygonfeature f,
     dashboard_public_featureclass fc
where fc.id = f.feature_class_id
  and fc.system_name in ('neighborhoods')
);


delete from dashboard_public_polygonfeature
where feature_class_id in (
  select fc.id
  from dashboard_public_featureclass fc
  where fc.system_name in ('neighborhoods')
);


delete from dashboard_public_featureclass fc
where fc.system_name in ('neighborhoods');