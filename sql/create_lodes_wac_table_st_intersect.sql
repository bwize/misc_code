-- Materialized View: lodes.lodes_wac_2003_blockgroup

-- DROP MATERIALIZED VIEW lodes.lodes_wac_2003_blockgroup;

CREATE MATERIALIZED VIEW lodes.lodes_wac_2003_blockgroup AS 
 SELECT geo.geoid,
    geo.shid,
    sum(l.lodes_wac__total_number_of_jobs) AS lodes_rac__total_number_of_jobs,
    sum(l.lodes_wac__number_of_jobs_29_or_younger) AS lodes_rac__number_of_jobs_29_or_younger,
    sum(l.lodes_wac__number_of_jobs_30_to_34) AS lodes_rac__number_of_jobs_30_to_34,
    sum(l.lodes_wac__number_of_jobs_55_or_older) AS lodes_rac__number_of_jobs_55_or_older,
    sum(l.lodes_wac__number_of_jobs_1250_month_or_less) AS lodes_rac__number_of_jobs_1250_month_or_less,
    sum(l.lodes_wac__number_of_jobs_1251_to_3333_month) AS lodes_rac__number_of_jobs_1251_to_3333_month,
    sum(l.lodes_wac__number_of_jobs_greater_than_3333_month) AS lodes_rac__number_of_jobs_greater_than_3333_month,
    sum(l.lodes_wac__number_of_jobs_agr_forestry_fish_hunt) AS lodes_rac__number_of_jobs_agr_forestry_fish_hunt,
    sum(l.lodes_wac__number_of_jobs_mining_quarry_oil_gas) AS lodes_rac__number_of_jobs_mining_quarry_oil_gas,
    sum(l.lodes_wac__number_of_jobs_utilities) AS lodes_rac__number_of_jobs_utilities,
    sum(l.lodes_wac__number_of_jobs_construction) AS lodes_rac__number_of_jobs_construction,
    sum(l.lodes_wac__number_of_jobs_manufacturing) AS lodes_rac__number_of_jobs_manufacturing,
    sum(l.lodes_wac__number_of_jobs_wholesale_trade) AS lodes_rac__number_of_jobs_wholesale_trade,
    sum(l.lodes_wac__number_of_jobs_retail_trade) AS lodes_rac__number_of_jobs_retail_trade,
    sum(l.lodes_wac__number_of_jobs_transport_warehousing) AS lodes_rac__number_of_jobs_transport_warehousing,
    sum(l.lodes_wac__number_of_jobs_information) AS lodes_rac__number_of_jobs_information,
    sum(l.lodes_wac__number_of_jobs_finance_insurance) AS lodes_rac__number_of_jobs_finance_insurance,
    sum(l.lodes_wac__number_of_jobs_real_estate_rental_leasing) AS lodes_rac__number_of_jobs_real_estate_rental_leasing,
    sum(l.lodes_wac__number_of_jobs_prof_sci_tech_services) AS lodes_rac__number_of_jobs_prof_sci_tech_services,
    sum(l.lodes_wac__number_of_jobs_mgmt) AS lodes_rac__number_of_jobs_mgmt,
    sum(l.lodes_wac__number_of_jobs_admin_support_waste_mgmt) AS lodes_rac__number_of_jobs_admin_support_waste_mgmt,
    sum(l.lodes_wac__number_of_jobs_edu_services) AS lodes_rac__number_of_jobs_edu_services,
    sum(l.lodes_wac__number_of_jobs_health_care_social_assist) AS lodes_rac__number_of_jobs_health_care_social_assist,
    sum(l.lodes_wac__number_of_jobs_arts_entertainment_rec) AS lodes_rac__number_of_jobs_arts_entertainment_rec,
    sum(l.lodes_wac__number_of_jobs_accomodation_food_srvcs) AS lodes_rac__number_of_jobs_accomodation_food_srvcs,
    sum(l.lodes_wac__number_of_jobs_other_services) AS lodes_rac__number_of_jobs_other_services,
    sum(l.lodes_wac__number_of_jobs_public_admin) AS lodes_rac__number_of_jobs_public_admin,
    sum(l.lodes_wac__number_of_jobs_race_white) AS lodes_rac__number_of_jobs_race_white,
    sum(l.lodes_wac__number_of_jobs_race_black) AS lodes_rac__number_of_jobs_race_black,
    sum(l.lodes_wac__number_of_jobs_race_american_indian) AS lodes_rac__number_of_jobs_race_american_indian,
    sum(l.lodes_wac__number_of_jobs_race_asian) AS lodes_rac__number_of_jobs_race_asian,
    sum(l.lodes_wac__number_of_jobs_race_hawaiian_other_pacific) AS lodes_rac__number_of_jobs_race_hawaiian_other_pacific,
    sum(l.lodes_wac__number_of_jobs_race_two_or_more_races) AS lodes_rac__number_of_jobs_race_two_or_more_races,
    sum(l.lodes_wac__number_of_jobs_not_hispanic) AS lodes_rac__number_of_jobs_not_hispanic,
    sum(l.lodes_wac__number_of_jobs_hispanic) AS lodes_rac__number_of_jobs_hispanic,
    sum(l.lodes_wac__number_of_jobs_edu_less_than_high_school) AS lodes_rac__number_of_jobs_edu_less_than_high_school,
    sum(l.lodes_wac__number_of_jobs_edu_high_school_or_equivalent) AS lodes_rac__number_of_jobs_edu_high_school_or_equivalent,
    sum(l.lodes_wac__number_of_jobs_edu_some_college_or_assoc_degree) AS lodes_rac__number_of_jobs_edu_some_college_or_assoc_degree,
    sum(l.lodes_wac__number_of_jobs_edu_bachelor_or_advanced_degree) AS lodes_rac__number_of_jobs_edu_bachelor_or_advanced_degree,
    sum(l.lodes_wac__number_of_jobs_sex_male) AS lodes_rac__number_of_jobs_sex_male,
    sum(l.lodes_wac__number_of_jobs_sex_female) AS lodes_rac__number_of_jobs_sex_female,
    sum(l.lodes_wac__number_of_jobs_firm_age_0_1) AS lodes_wac__number_of_jobs_firm_age_0_1,
    sum(l.lodes_wac__number_of_jobs_firm_age_2_3) AS lodes_wac__number_of_jobs_firm_age_2_3,
    sum(l.lodes_wac__number_of_jobs_firm_age_4_5) AS lodes_wac__number_of_jobs_firm_age_4_5,
    sum(l.lodes_wac__number_of_jobs_firm_age_6_10) AS lodes_wac__number_of_jobs_firm_age_6_10,
    sum(l.lodes_wac__number_of_jobs_firm_age_11_or_more) AS lodes_wac__number_of_jobs_firm_age_11_or_more,
    sum(l.lodes_wac__number_of_jobs_firm_size_0_19) AS lodes_wac__number_of_jobs_firm_size_0_19,
    sum(l.lodes_wac__number_of_jobs_firm_size_20_49) AS lodes_wac__number_of_jobs_firm_size_20_49,
    sum(l.lodes_wac__number_of_jobs_firm_size_50_249) AS lodes_wac__number_of_jobs_firm_size_50_249,
    sum(l.lodes_wac__number_of_jobs_firm_size_250_499) AS lodes_wac__number_of_jobs_firm_size_250_499,
    sum(l.lodes_wac__number_of_jobs_firm_size_500_or_more) AS lodes_wac__number_of_jobs_firm_size_500_or_more
   FROM lodes.lodes_wac_2003_block_geo_centroid l,
    geo_blockgroup geo
  WHERE st_intersects(l.geom, geo.geom)
  GROUP BY geo.shid, geo.geoid
WITH DATA;

ALTER TABLE lodes.lodes_wac_2003_blockgroup
  OWNER TO postgres;
