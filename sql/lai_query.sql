--DROP MATERIALIZED VIEW lai_congressionaldistrict_mview

CREATE MATERIALIZED VIEW lai_congressionaldistrict_view AS 
 SELECT geo_congressionaldistrict.name,
    geo_congressionaldistrict.shid,
    sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__total_households__count,
    sum(lai_blkgrps_join.house__total__area_median_income__usd * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__area_median_income__usd,
    sum(lai_blkgrps_join.house__total__blkgrp_median_income_owners__usd * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__blkgrp_median_income_owners__usd,
    sum(lai_blkgrps_join.house__total__blkgrp_median_income_renters__usd * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__blkgrp_median_income_renters__usd,
    sum(lai_blkgrps_join.house__total__avg_hh_size_owners__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__avg_hh_size_owners__avg,
    sum(lai_blkgrps_join.house__total__avg_hh_size_renters__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__avg_hh_size_renters__avg,
    sum(lai_blkgrps_join.house__total__commuters_per_hh_owners__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__commuters_per_hh_owners__avg,
    sum(lai_blkgrps_join.house__total__commuters_per_hh_renters__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__commuters_per_hh_renters__avg,
    sum(lai_blkgrps_join.house__total__pct_renters__percent * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__pct_renters__percent,
    sum(lai_blkgrps_join.house__total__gross_hh_density__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__gross_hh_density__count,
    sum(lai_blkgrps_join.house__total__median_rooms_per_owner_unit__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__median_rooms_per_owner_unit__avg,
    sum(lai_blkgrps_join.house__total__median_rooms_per_renter_unit__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__median_rooms_per_renter_unit__avg,
    sum(lai_blkgrps_join.house__total__pct_detatched_single_family_unit__percent * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__pct_detatched_single_family_unit__percent,
    sum(lai_blkgrps_join.house__total__median_commute_distance__mile * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__median_commute_distance__avg,
    sum(lai_blkgrps_join.house__total__block_density__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__block_density__count,
    sum(lai_blkgrps_join.house__total__employment_access_index__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__employment_access_index__count,
    sum(lai_blkgrps_join.house__total__local_job_density__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__local_job_density__count,
    sum(lai_blkgrps_join.house__total__retail_access_index__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__retail_access_index__count,
    sum(lai_blkgrps_join.house__total__local_retail_job_density__count * lai_blkgrps_join.house__total__total_households__count) / sum(lai_blkgrps_join.house__total__total_households__count) AS household__total__local_retail_job_density__count
   FROM upload.lai_blkgrps_join,
    geo_congressionaldistrict
  WHERE st_intersects(lai_blkgrps_join.geom, geo_congressionaldistrict.geom)
  GROUP BY geo_congressionaldistrict.name, geo_congressionaldistrict.shid;


CREATE MATERIALIZED VIEW lai_blockgroup_mview as
select
         shid,
         name,
         geom,
         house__total__total_households__count as household__total__total_households__count,
         house__total__area_median_income__usd as household__total__area_median_income__usd,     
         house__total__blkgrp_median_income_owners__usd as household__total__blkgrp_median_income_owners__usd,      
         house__total__blkgrp_median_income_renters__usd as household__total__blkgrp_median_income_renters__usd,     
         house__total__avg_hh_size_owners__count as household__total__avg_hh_size_owners__avg,     
         house__total__avg_hh_size_renters__count as household__total__avg_hh_size_renters__avg,      
         house__total__commuters_per_hh_owners__count as household__total__commuters_per_hh_owners__avg,      
         house__total__commuters_per_hh_renters__count as household__total__commuters_per_hh_renters__avg,     
         house__total__pct_renters__percent as household__total__pct_renters__percent,      
         house__total__gross_hh_density__count as household__total__gross_hh_density__count,     
         house__total__median_rooms_per_owner_unit__count as household__total__median_rooms_per_owner_unit__avg,      
         house__total__median_rooms_per_renter_unit__count as household__total__median_rooms_per_renter_unit__avg,     
         house__total__pct_detatched_single_family_unit__percent as household__total__pct_detatched_single_family_unit__percent,     
         house__total__median_commute_distance__mile as household__total__median_commute_distance__avg,      
         house__total__block_density__count as household__total__block_density__count,      
         house__total__employment_access_index__count as household__total__employment_access_index__count,      
         house__total__local_job_density__count as household__total__local_job_density__count,      
         house__total__local_retail_job_density__count as household__total__local_retail_job_density__count,     
         house__total__retail_access_index__count  as household__total__retail_access_index__count

         from upload.lai_blkgrps_join