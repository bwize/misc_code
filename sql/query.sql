with frac (bg_id, pop_frac, hh_frac, hu_frac) as (
    select
        bg.geoid as bg_id,
        COALESCE(sum(b.pop)/NULLIF(bg.pop,0)::float,0) as pop_frac, 
        COALESCE(sum(b.hh)/NULLIF(bg.hh,0)::float,0) as hh_frac, 
        COALESCE(sum(b.hu)/NULLIF(bg.hu,0)::float,0) as hu_frac
    from apportion_blockgroup_2010 as bg
        inner join apportion_block as b
            on bg.geoid = b.geoid/1000
    where ST_Contains(ST_GeomFromText('{coordinates}', 4326) , b.geom)
    group by bg.geoid, bg.pop, bg.hh, bg.hu
)
select 
sum(frac.pop_frac) as pop_frac,
sum(frac.hh_frac) as hh_frac, 
sum(frac.hu_frac) as hu_frac,

COALESCE(sum(hu_frac * houseunit__total__median_home_value__usd__1) / NULLIF(sum(hu_frac),0),0) as house__total__median_home_value__usd,
COALESCE(sum(hu_frac * houseunit__total__median_home_rent__usd__1) / NULLIF(sum(hu_frac),0),0) as house__total__median_home_rent__usd,
COALESCE(sum(hh_frac * household__total__median_household_income__usd__1) / NULLIF(sum(hh_frac),0),0) as house__total__median_household_income__usd,
COALESCE(sum(hh_frac * household__total__average_family_size__count__1) / NULLIF(sum(hh_frac),0),0) as house__total__average_family_size__count,
--
sum(pop_frac * pop__total__total_pop__count__1) as pop__total__total_pop__count,
sum(pop_frac * pop__total__total_pop_commuting_to_work__count__1) as pop__total__total_pop_commuting_to_work__count,
sum(hu_frac * houseunit__total__total_housing_units__count__1) as house__total__total_housing_units__count,
sum(hh_frac * household__total__total_household__count__1) as house__total__total_household__count,
sum(hu_frac * houseunit__total__total_vacant_housing_units__count__1) as houseunit__total__vacant_housing_unit__count,
sum(hu_frac * houseunit__total__total_occupied_housing_units__count__1) as house__total__total_occupied_housing_units__count,
sum(hu_frac * houseunit__total__total_vehicles_available__count__1) as house__total__total_vehicles_available__count,
--
COALESCE(avg((hu_frac * houseunit__total__vacant_for_sale_only__count__1) / (NULLIF(((hu_frac * houseunit__total__vacant_for_sale_only__count__1) + (hu_frac * houseunit__owner_vs_renter__owner_occupied__count__1)),0))) * 100) as house__total__homeowner_vacancy_rate__percent,
COALESCE(avg((hu_frac * houseunit__total__vacant_for_rent__count__1) / (NULLIF(((hu_frac * houseunit__total__vacant_for_rent__count__1) + (hu_frac * houseunit__owner_vs_renter__renter_occupied__count__2)),0))) * 100) AS house__total__rental_vacancy_rate__percent,
COALESCE(avg((pop_frac * pop__total__college_graduate__count__1) / NULLIF(pop_frac * pop__total__over_25__count__1, 0)) * 100) as pop__total__college_graduation_rate__percent,
COALESCE(avg((pop_frac * pop__total__high_school_graduate__count__1) / NULLIF(pop_frac * pop__total__over_25__count__1, 0)) * 100) as pop__total__high_school_graduation_rate__percent__2,
COALESCE(avg((pop_frac * pop__total__language_other_than_english__count__1) / NULLIF(pop_frac * pop__total__over_5__count__1, 0)) * 100) as pop__total__primary_lang_other_than_english__percent,
--
sum(pop_frac * pop__education__less_than_9th_grade__count__1) as pop__education__less_than_9th_grade__count,
sum(pop_frac * pop__education__9th_to_12th_no_diploma__count__2) as pop__education__9th_to_12th_no_diploma__count,
sum(pop_frac * pop__education__high_school_degree__count__3) as pop__education__high_school_degree__count,
sum(pop_frac * pop__education__some_college_no_degree__count__4) as pop__education__some_college_no_degree__count,
sum(pop_frac * pop__education__associates_degree__count__5) as pop__education__associates_degree__count,
sum(pop_frac * pop__education__bachelors_degree__count__6) as pop__education__bachelors_degree__count,
sum(pop_frac * pop__education__graduate_degree__count__7) as pop__education__graduate_degree__count,
-- 
sum(pop_frac * pop__race__total_pop_white__count__1) as pop__race__white__count,
sum(pop_frac * pop__race__total_pop_black__count__2) as pop__race__black__count,
sum(pop_frac * pop__race__total_pop_american_indian__count__3) as pop__race__american_indian__count,
sum(pop_frac * pop__race__total_pop_asian__count__4) as pop__race__asian__count,
sum(pop_frac * pop__race__total_pop_pacific_islander__count__5) as pop__race__hawaiian__count,
sum(pop_frac * pop__race__total_pop_other__count__6) as pop__race__single_race_other__count,
sum(pop_frac * pop__race__total_pop_hispanic__count__7) as pop__race__hispanic__count,
-- 
sum(pop_frac * pop__age__age_under_5__count__1) as pop__age__under_5__count,
sum(pop_frac * pop__age__age_5_9__count__2) as pop__age__5_9__count,
sum(pop_frac * pop__age__age_10_14__count__3) as pop__age__10_14__count,
sum(pop_frac * pop__age__age_15_19__count__4) as pop__age__15_19__count,
sum(pop_frac * pop__age__age_20_24__count__5) as pop__age__20_24__count,
sum(pop_frac * pop__age__age_25_34__count__6) as pop__age__25_34__count,
sum(pop_frac * pop__age__age_35_44__count__7) as pop__age__35_44__count,
sum(pop_frac * pop__age__age_45_54__count__8) as pop__age__45_54__count,
sum(pop_frac * pop__age__age_55_59__count__9) as pop__age__55_59__count,
sum(pop_frac * pop__age__age_60_64__count__10) as pop__age__60_64__count,
sum(pop_frac * pop__age__age_65_74__count__11) as pop__age__65_74__count,
sum(pop_frac * pop__age__age_75_84__count__12) as pop__age__75_84__count,
sum(pop_frac * pop__age__age_over_85__count__13) as pop__age__over_85__count,
sum(pop_frac * pop__gender__total_pop_female__count__1) as pop__gender__total_pop_female__count,
sum(pop_frac * pop__gender__total_pop_male__count__2) as pop__gender__total_pop_male__count,
-- 
sum(hu_frac * houseunit__owner_vs_renter__owner_occupied__count__1) as house__owner_vs_renter__owner_occupied__count,
sum(hu_frac * houseunit__owner_vs_renter__renter_occupied__count__2) as house__owner_vs_renter__renter_occupied__count,
-- 
sum(hu_frac * houseunit__value__50000_or_less__usd__1) as house__value__50000_or_less__usd,
sum(hu_frac * houseunit__value__50000_to_99999__usd__2) as house__value__50000_to_99999__usd,
sum(hu_frac * houseunit__value__100000_to_149999__usd__3) as house__value__100000_to_149999__usd,
sum(hu_frac * houseunit__value__150000_to_199999__usd__4) as house__value__150000_to_199999__usd,
sum(hu_frac * houseunit__value__200000_to_299999__usd__5) as house__value__200000_to_299999__usd,
sum(hu_frac * houseunit__value__300000_to_499999__usd__6) as house__value__300000_to_499999__usd,
sum(hu_frac * houseunit__value__500000_to_999999__usd__7) as house__value__50000_to_99999__usd,
sum(hu_frac * houseunit__value__1000000_or_more__usd__8) as house__value__1000000_or_more__usd,
-- 
sum(hu_frac * houseunit__rent__200_or_less__usd__1) as house__rent__200_or_less__usd,
sum(hu_frac * houseunit__rent__200_to_299__usd__2) as house__rent__200_to_299__usd,
sum(hu_frac * houseunit__rent__300_to_499__usd__3) as house__rent__300_to_499__usd,
sum(hu_frac * houseunit__rent__500_to_749__usd__4) as house__rent__500_to_749__usd,
sum(hu_frac * houseunit__rent__750_to_999__usd__5) as house__rent__750_to_999__usd,
sum(hu_frac * houseunit__rent__1000_to_1499__usd__6) as house__rent__1000_to_1499__usd,
sum(hu_frac * houseunit__rent__1500_or_more__usd__7) as house__rent__1500_or_more__usd,
-- 
sum(pop_frac * pop__labor_force__in_labor_force__count__1) as pop__labor_force__in_labor_force__count,
sum(pop_frac * pop__labor_force__not_in_labor_force__count__2) as pop__labor_force__not_in_labor_force__count,
sum(pop_frac * pop__military_labor__civilian__count__3) as pop__military_labor__civilian__count,
sum(pop_frac * pop__military_labor__military__count__4) as pop__military_labor__military__count,
sum(pop_frac * pop__civilian_employment__employed__count__5) as pop__civilian_employment__employed__count,
sum(pop_frac * pop__civilian_employment__unemployed__count__6) as pop__civilian_employment__unemployed__count,
-- 
sum(pop_frac * pop__industry__agriculture_fishing_mining__count__1) as pop__employment_industry__agriculture_fishing_mining__count,
sum(pop_frac * pop__industry__construction__count__2) as pop__employment_industry__construction__count,
sum(pop_frac * pop__industry__manufacturing__count__3) as pop__employment_industry__manufacturing__count,
sum(pop_frac * pop__industry__wholesale_trade__count__4) as pop__employment_industry__wholesale_trade__count,
sum(pop_frac * pop__industry__retail_trade__count__5) as pop__employment_industry__retail_trade__count,
sum(pop_frac * pop__industry__transportation__count__6) as pop__employment_industry__transportation__count,
sum(pop_frac * pop__industry__information__count__7) as pop__employment_industry__information__count,
sum(pop_frac * pop__industry__finance_and_insurance__count__8) as pop__employment_industry__finance_and_insurance__count,
sum(pop_frac * pop__industry__scientific_and_professional__count__9) as pop__employment_industry__scientific_and_professional__count,
sum(pop_frac * pop__industry__education_and_health_care__count__10) as pop__employment_industry__education_and_health_care__count,
sum(pop_frac * pop__industry__arts_food_and_entertainment__count__11) as pop__employment_industry__arts_food_and_entertainment__count,
sum(pop_frac * pop__industry__public_administration__count__12) as pop__employment_industry__public_administration__count,
sum(pop_frac * pop__industry__other_services__count__13) as pop__employment_industry__other_services__count,
-- 
sum(hh_frac * household__income__10000_or_less__usd__1) as house__income__10000_or_less__usd,
sum(hh_frac * household__income__10000_to_14999__usd__2) as house__income__10000_to_14999__usd,
sum(hh_frac * household__income__15000_to_24999__usd__3) as house__income__15000_to_24999__usd,
sum(hh_frac * household__income__25000_to_34999__usd__4) as house__income__25000_to_34999__usd,
sum(hh_frac * household__income__35000_to_49999__usd__5) as house__income__35000_to_49999__usd,
sum(hh_frac * household__income__50000_to_74999__usd__6) as house__income__50000_to_74999__usd,
sum(hh_frac * household__income__75000_to_99999__usd__7) as house__income__75000_to_99999__usd,
sum(hh_frac * household__income__100000_to_149999__usd__8) as house__income__100000_to_149999__usd,
sum(hh_frac * household__income__150000_to_199999__usd__9) as house__income__150000_to_199999__usd,
sum(hh_frac * household__income__200000_or_more__usd__10) as house__income__200000_or_more__usd,
sum(hu_frac * houseunit__vehicles__none__count__1) as house__vehicles__none__count,
sum(hu_frac * houseunit__vehicles__one__count__2) as house__vehicles__one__count,
sum(hu_frac * houseunit__vehicles__two__count__3) as house__vehicles__two__count,
sum(hu_frac * houseunit__vehicles__three_or_more__count__4) as house__vehicles__three_or_more__count,
-- 
sum(pop_frac * pop__total__commute_mean_travel_time__minutes__1) as pop__total__commute_mean_travel_time__minutes,
sum(pop_frac * pop__commute__drive_alone__count__1) as pop__commute__drive_alone__count,
sum(pop_frac * pop__commute__drive_carpool__count__2) as pop__commute__drive_carpool__count,
sum(pop_frac * pop__commute__public_transit__count__3) as pop__commute__public_transit__count,
sum(pop_frac * pop__commute__walk__count__4) as pop__commute__walk__count,
sum(pop_frac * pop__commute__other_transit__count__5) as pop__commute__other_transit__count,
sum(pop_frac * pop__commute__work_from_home__count__6) as pop__commute__work_from_home__count,
--
sum(hh_frac * household__total__receive_food_stamps__count__1) as house__total__receive_food_stamps__count,
sum(hh_frac * household__total__below_poverty_level__count__1) as house__total__below_poverty_level__count,
sum(pop_frac * pop__toal__under_20__count__1) as pop__total__under_20__count,
sum(pop_frac * pop__total__over_65__count__1) as pop__total__over_65__count,
sum(pop_frac * pop__education__enrolled_in_school__count__1) as pop__total__enrolled_in_school__count,

sum(pop_frac * pop__language__english_only__count__1) as pop__language__english_only__count,
sum(pop_frac * pop__language__spanish__count__2) as pop__language__spanish__count,
sum(pop_frac * pop__language__other_indo_european__count__3) as pop__language__other_indo_european__count,
sum(pop_frac * pop__language__asian_pacific_islander__count__4) as pop__language__asian_pacific_islander__count,
sum(pop_frac * pop__language__other__count__5) as pop__language__other__count,

sum(pop_frac * pop__generation__generation_z__count__1) as pop__generation__generation_z__count,
sum(pop_frac * pop__generation__generation_y__count__2) as pop__generation__millennial__count,
sum(pop_frac * pop__generation__generation_x__count__3) as pop__generation__generation_x__count,
sum(pop_frac * pop__generation__baby_boomer__count__4) as pop__generation__baby_boomer__count,
sum(pop_frac * pop__generation__silent_generation__count__5) as pop__generation__silent_generation__count,

sum(hu_frac * houseunit__building_age__built_2010_or_later__count__1) as house__building_age__built_2010_or_later__count,
sum(hu_frac * houseunit__building_age__built_2000_to_2009__count__2) as house__building_age__built_2000_to_2009__count,
sum(hu_frac * houseunit__building_age__built_1990_to_1999__count__3) as house__building_age__built_1990_to_1999__count,
sum(hu_frac * houseunit__building_age__built_1980_to_1989__count__4) as house__building_age__built_1980_to_1989__count,
sum(hu_frac * houseunit__building_age__built_1970_to_1979__count__5) as house__building_age__built_1970_to_1979__count,
sum(hu_frac * houseunit__building_age__built_1960_to_1969__count__6) as house__building_age__built_1960_to_1969__count,
sum(hu_frac * houseunit__building_age__built_1950_to_1959__count__7) as house__building_age__built_1950_to_1959__count,
sum(hu_frac * houseunit__building_age__built_1940_to_1949__count__8) as house__building_age__built_1940_to_1949__count,
sum(hu_frac * houseunit__building_age__built_1939_or_earlier__count__9) as house__building_age__built_1939_or_earlier__count,

sum(hh_frac * household__grapi__less_than_15__percent__1) as house__grapi__less_than_15__percent,
sum(hh_frac * household__grapi__15_to_20__percent__2) as house__grapi__15_to_20__percent,
sum(hh_frac * household__grapi__20_to_25__percent__3) as house__grapi__20_to_25__percent,
sum(hh_frac * household__grapi__25_to_30__percent__4) as house__grapi__25_to_30__percent,
sum(hh_frac * household__grapi__30_to_35__percent__5) as house__grapi__30_to_35__percent,
sum(hh_frac * household__grapi__35_or_more__percent__6) as house__grapi__35_or_more__percent,
sum(hh_frac * household__smocapi__less_than_20__percent__1) as house__smocapi__less_than_20__percent,
sum(hh_frac * household__smocapi__20_to_25__percent__2) as house__smocapi__20_to_25__percent,
sum(hh_frac * household__smocapi__25_to_30__percent__3) as house__smocapi__25_to_30__percent,
sum(hh_frac * household__smocapi__30_to_35__percent__4) as house__smocapi__30_to_35__percent,
sum(hh_frac * household__smocapi__35_or_more__percent__5) as house__smocapi__35_or_more__percent,


COALESCE(avg(hh_frac * household__total__gini__percent) / NULLIF(hh_frac * household__total__total_household__count__1, 0)) as household__total__gini__percent

--COALESCE(sum(hh_frac * house__total__area_median_income__usd) / NULLIF(sum(hh_frac),0),0) as house__total__area_median_income__usd,
--COALESCE(sum(hh_frac * house__total__blkgrp_median_income_owners__usd) / NULLIF(sum(hh_frac),0),0) as house__total__blkgrp_median_income_owners__usd,
--COALESCE(sum(hh_frac * house__total__blkgrp_median_income_renters__usd) / NULLIF(sum(hh_frac),0),0) as house__total__blkgrp_median_income_renters__usd,
--COALESCE(sum(hh_frac * house__total__avg_hh_size_owners__count) / NULLIF(sum(hh_frac),0),0) as house__total__avg_hh_size_owners__count,
--COALESCE(sum(hh_frac * house__total__avg_hh_size_renters__count) / NULLIF(sum(hh_frac),0),0) as house__total__avg_hh_size_renters__count,
--COALESCE(sum(hh_frac * house__total__median_rooms_per_owner_unit__count) / NULLIF(sum(hh_frac),0),0) as house__total__median_rooms_per_owner_unit__count,
--COALESCE(sum(hh_frac * house__total__median_rooms_per_renter_unit__count) / NULLIF(sum(hh_frac),0),0) as house__total__median_rooms_per_renter_unit__count,
--COALESCE(sum(hh_frac * house__total__median_commute_distance__mile) / NULLIF(sum(hh_frac),0),0) as house__total__median_commute_distance__mile,
--
--avg(hh_frac * house__total__pct_renters__percent) * 100 as house__total__pct_renters__percent,
--avg(hh_frac * house__total__pct_detatched_single_family_unit__percent) as house__total__pct_detatched_single_family_unit__percent,

--sum(hh_frac * house__total__total_households__count) as house__total__total_households__count,
--avg(hh_frac * house__total__commuters_per_hh_owners__count) as house__total__commuters_per_hh_owners__count,
--avg(hh_frac * house__total__commuters_per_hh_renters__count) as house__total__commuters_per_hh_renters__count,
--sum(hh_frac * house__total__gross_hh_density__count) as house__total__gross_hh_density__count,
--sum(hh_frac * house__total__block_density__count) as house__total__block_density__count,
--sum(hh_frac * house__total__employment_access_index__count) as house__total__employment_access_index__count,
--sum(hh_frac * house__total__local_job_density__count) as house__total__local_job_density__count,
--sum(hh_frac * house__total__local_retail_job_density__count) as house__total__local_retail_job_density__count,
--sum(hh_frac * house__total__retail_access_index__count) as house__total__retail_access_index__count



from frac
inner join apportion_blockgroup_chartypes as v
    on v.geoid = frac.bg_id
;
