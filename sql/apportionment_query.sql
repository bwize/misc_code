
-- DROP MATERIALIZED VIEW apportion_blockgroup_chartypes;

CREATE MATERIALIZED VIEW apportion_blockgroup_chartypes AS 

 SELECT geo_blockgroup.geoid::bigint, geo_blockgroup.shid,
    --
    -- Total population
    seq0002_2013.b010010001 as pop__total__total_pop__count__1,
    seq0002_2013.b010010002 as pop__gender__total_pop_female__count__1,
    seq0002_2013.b010010026 as pop__gender__total_pop_male__count__2,
    --
    -- Education
    seq0043_2013.b150030002 + seq0043_2013.b150030003 + seq0043_2013.b150030004 + seq0043_2013.b150030005 + seq0043_2013.b150030006 + seq0043_2013.b150030007 + seq0043_2013.b150030008 + seq0043_2013.b150030009 + seq0043_2013.b150030010 + seq0043_2013.b150030011 + seq0043_2013.b150030012 as pop__education__less_than_9th_grade__count__1,
    seq0043_2013.b150030013 + seq0043_2013.b150030014 + seq0043_2013.b150030015 + seq0043_2013.b150030016 as pop__education__9th_to_12th_no_diploma__count__2,
    seq0043_2013.b150030017 + seq0043_2013.b150030018 as pop__education__high_school_degree__count__3,
    seq0043_2013.b150030020 + seq0043_2013.b150030019 as pop__education__some_college_no_degree__count__4,
    seq0043_2013.b150030021 as pop__education__associates_degree__count__5,
    seq0043_2013.b150030022 as pop__education__bachelors_degree__count__6,
    seq0043_2013.b150030023 + seq0043_2013.b150030024 + seq0043_2013.b150030025 as pop__education__graduate_degree__count__7,
    --
    -- Age breakdowns
    seq0002_2013.b010010003 + seq0002_2013.b010010027 as pop__age__under_5__count__1,
    seq0002_2013.b010010004 + seq0002_2013.b010010028 as pop__age__5_9__count__2,
    seq0002_2013.b010010005 + seq0002_2013.b010010029 as pop__age__10_14__count__3,
    seq0002_2013.b010010006 + seq0002_2013.b010010007 + seq0002_2013.b010010030 + seq0002_2013.b010010031 as pop__age__15_19__count__4,
    seq0002_2013.b010010008 + seq0002_2013.b010010009 + seq0002_2013.b010010010 + seq0002_2013.b010010032 + seq0002_2013.b010010033 + seq0002_2013.b010010034 as pop__age__20_24__count__5,
    seq0002_2013.b010010011 + seq0002_2013.b010010012 + seq0002_2013.b010010035 + seq0002_2013.b010010036 as pop__age__25_34__count__6,
    seq0002_2013.b010010013 + seq0002_2013.b010010014 + seq0002_2013.b010010037 + seq0002_2013.b010010038 as pop__age__35_44__count__7,
    seq0002_2013.b010010015 + seq0002_2013.b010010016 + seq0002_2013.b010010039 + seq0002_2013.b010010040 as pop__age__45_54__count__8,
    seq0002_2013.b010010017 + seq0002_2013.b010010041 as pop__age__55_59__count__9,
    seq0002_2013.b010010018 + seq0002_2013.b010010019 + seq0002_2013.b010010042 + seq0002_2013.b010010043 as pop__age__60_64__count__10,
    seq0002_2013.b010010020 + seq0002_2013.b010010021 + seq0002_2013.b010010022 + seq0002_2013.b010010044 + seq0002_2013.b010010045 + seq0002_2013.b010010046 as pop__age__65_74__count__11,
    seq0002_2013.b010010023 + seq0002_2013.b010010024 + seq0002_2013.b010010047 + seq0002_2013.b010010048 as pop__age__75_84__count__12,
    seq0002_2013.b010010025 + seq0002_2013.b010010049 as pop__age__over_85__count__13,
    --  
    -- Population over 18
    seq0002_2013.b010010007 + seq0002_2013.b010010008 + seq0002_2013.b010010009 + seq0002_2013.b010010010 + seq0002_2013.b010010011 + seq0002_2013.b010010012 + seq0002_2013.b010010013 + seq0002_2013.b010010014 + seq0002_2013.b010010015 + seq0002_2013.b010010016 + seq0002_2013.b010010017 + seq0002_2013.b010010018 + seq0002_2013.b010010019 + seq0002_2013.b010010020 + seq0002_2013.b010010021 + seq0002_2013.b010010022 + seq0002_2013.b010010023 + seq0002_2013.b010010024 + seq0002_2013.b010010025 +
    seq0002_2013.b010010031 + seq0002_2013.b010010032 + seq0002_2013.b010010033 + seq0002_2013.b010010034 + seq0002_2013.b010010035 + seq0002_2013.b010010036 + seq0002_2013.b010010037 + seq0002_2013.b010010038 + seq0002_2013.b010010039 + seq0002_2013.b010010040 + seq0002_2013.b010010041 + seq0002_2013.b010010042 + seq0002_2013.b010010043 + seq0002_2013.b010010044 + seq0002_2013.b010010045 + seq0002_2013.b010010046 + seq0002_2013.b010010047 + seq0002_2013.b010010048 + seq0002_2013.b010010049 as pop__total__18_and_over__count__1,
    --
    -- Race breakdown   
    seq0005_2013.b030020003 as pop__race__white__count__1,
    seq0005_2013.b030020004 as pop__race__black__count__2,
    seq0005_2013.b030020012 as pop__race__hispanic__count__3,
    seq0005_2013.b030020005 as pop__race__american_indian__count__4,
    seq0005_2013.b030020006 as pop__race__asian__count__5,
    seq0005_2013.b030020007 as pop__race__hawaiian__count__6,
    seq0005_2013.b030020008 as pop__race__single_race_other__count__7,
    seq0005_2013.b030020009 as pop__race__two_or_more_races_other__count__8,
    -- 
    -- Housing breakdowns
    seq0103_2013.b250010001 as houseunit__total__total_housing_units__count__1,

    seq0107_2013.b250750002 + seq0107_2013.b250750003 + seq0107_2013.b250750004 + seq0107_2013.b250750005 + seq0107_2013.b250750006 + seq0107_2013.b250750007 + seq0107_2013.b250750008 + seq0107_2013.b250750009 as houseunit__value__50000_or_less__usd__1,
    seq0107_2013.b250750010 + seq0107_2013.b250750011 + seq0107_2013.b250750012 + seq0107_2013.b250750013 + seq0107_2013.b250750014 as houseunit__value__50000_to_99999__usd__2,
    seq0107_2013.b250750015 + seq0107_2013.b250750016 as houseunit__value__100000_to_149999__usd__3,
    seq0107_2013.b250750017 + seq0107_2013.b250750018 as houseunit__value__150000_to_199999__usd__4,
    seq0107_2013.b250750019 + seq0107_2013.b250750020 as houseunit__value__200000_to_299999__usd__5,
    seq0107_2013.b250750021 + seq0107_2013.b250750022 as houseunit__value__300000_to_499999__usd__6,
    seq0107_2013.b250750023 + seq0107_2013.b250750024 as houseunit__value__500000_to_999999__usd__7,
    seq0107_2013.b250750025 as houseunit__value__1000000_or_more__usd__8,

    seq0106_2013.b250630003 + seq0106_2013.b250630004 + seq0106_2013.b250630005 as houseunit__rent__200_or_less__usd__1,
    seq0106_2013.b250630007 + seq0106_2013.b250630006 as houseunit__rent__200_to_299__usd__2,
    seq0106_2013.b250630008 + seq0106_2013.b250630009 + seq0106_2013.b250630010 + seq0106_2013.b250630011 as houseunit__rent__300_to_499__usd__3,
    seq0106_2013.b250630012 + seq0106_2013.b250630013 + seq0106_2013.b250630014 + seq0106_2013.b250630015  + seq0106_2013.b250630016 as houseunit__rent__500_to_749__usd__4,
    seq0106_2013.b250630017 + seq0106_2013.b250630018 + seq0106_2013.b250630019 as houseunit__rent__750_to_999__usd__5,
    seq0106_2013.b250630020 + seq0106_2013.b250630021 as houseunit__rent__1000_to_1499__usd__6,
    seq0106_2013.b250630022 + seq0106_2013.b250630023 as houseunit__rent__1500_or_more__usd__7,

    seq0106_2013.b250640001 as houseunit__total__median_home_rent__usd__1,
    --
    -- Renter vs owner occupied
    seq0103_2013.b250030002 as houseunit__owner_vs_renter__owner_occupied__count__1,
    seq0103_2013.b250030003 as houseunit__owner_vs_renter__renter_occupied__count__2,

    --
    -- Employment breakdowns
    --seq0076_2013.b230010090 + seq0076_2013.b230010097 + seq0076_2013.b230010104 + 
    --seq0076_2013.b230010111 + seq0076_2013.b230010118 + seq0076_2013.b230010125 + 
    --seq0076_2013.b230010132 + seq0076_2013.b230010139 + seq0076_2013.b230010146 + 
    --seq0076_2013.b230010153 + seq0076_2013.b230010160 + seq0076_2013.b230010165 + 
    --seq0076_2013.b230010170 + seq0076_2013.b230010004 + seq0076_2013.b230010011 + 
    --seq0076_2013.b230010018 + seq0076_2013.b230010025 + seq0076_2013.b230010032 + 
    --seq0076_2013.b230010039 + seq0076_2013.b230010046 + seq0076_2013.b230010053 + 
    --seq0076_2013.b230010060 + seq0076_2013.b230010067  + seq0076_2013.b230010074 + 
    --seq0076_2013.b230010079 + seq0076_2013.b230010084 as pop__labor_force__in_labor_force__count__1,
    --
    --seq0076_2013.b230010095 + seq0076_2013.b230010102 + seq0076_2013.b230010109 + 
    --seq0076_2013.b230010116 + seq0076_2013.b230010123 + seq0076_2013.b230010130 + 
    --seq0076_2013.b230010137 + seq0076_2013.b230010144 + seq0076_2013.b230010173 + 
    --seq0076_2013.b230010151 + seq0076_2013.b230010158 + seq0076_2013.b230010163 + 
    --seq0076_2013.b230010168 + seq0076_2013.b230010009 + seq0076_2013.b230010016 + 
    --seq0076_2013.b230010023 + seq0076_2013.b230010030 + seq0076_2013.b230010037 + 
    --seq0076_2013.b230010044 + seq0076_2013.b230010051 + seq0076_2013.b230010058 + 
    --seq0076_2013.b230010065 + seq0076_2013.b230010072  + seq0076_2013.b230010077 + 
    --seq0076_2013.b230010082 + seq0076_2013.b230010087 as pop__labor_force__not_in_labor_force__count__2,

    --seq0076_2013.b230010092 + seq0076_2013.b230010099 + seq0076_2013.b230010106 + 
    --seq0076_2013.b230010113 + seq0076_2013.b230010120 + seq0076_2013.b230010127 + 
    --seq0076_2013.b230010134 + seq0076_2013.b230010141 + seq0076_2013.b230010148 + 
    --seq0076_2013.b230010155 + seq0076_2013.b230010161 + seq0076_2013.b230010162 + 
    --seq0076_2013.b230010166 + seq0076_2013.b230010167 + seq0076_2013.b230010171 + 
    --seq0076_2013.b230010172 + seq0076_2013.b230010006 + seq0076_2013.b230010013 + 
    --seq0076_2013.b230010020 + seq0076_2013.b230010027 + seq0076_2013.b230010034 + 
    --seq0076_2013.b230010041 + seq0076_2013.b230010048 + seq0076_2013.b230010055 + 
    --seq0076_2013.b230010062 + seq0076_2013.b230010069  + seq0076_2013.b230010075 + 
    --seq0076_2013.b230010076 + seq0076_2013.b230010080 + seq0076_2013.b230010081 + 
    --seq0076_2013.b230010085  + seq0076_2013.b230010086 as pop__military_labor__civilian__count__1,

    --seq0076_2013.b230010091 + seq0076_2013.b230010098 + seq0076_2013.b230010105 + 
    --seq0076_2013.b230010112 + seq0076_2013.b230010119 + seq0076_2013.b230010126 + 
    --seq0076_2013.b230010133 + seq0076_2013.b230010140 + seq0076_2013.b230010147 + 
    --seq0076_2013.b230010154 + seq0076_2013.b230010005 + seq0076_2013.b230010012 + 
    --seq0076_2013.b230010019 + seq0076_2013.b230010026 + seq0076_2013.b230010033 + 
    --seq0076_2013.b230010040 + seq0076_2013.b230010047 + seq0076_2013.b230010054 + 
    --seq0076_2013.b230010061 + seq0076_2013.b230010068 as pop__military_labor__military__count__2,
    --
    --seq0076_2013.b230010093 + seq0076_2013.b230010100 + seq0076_2013.b230010107 + 
    --seq0076_2013.b230010114 + seq0076_2013.b230010121 + seq0076_2013.b230010128 + 
    --seq0076_2013.b230010135 + seq0076_2013.b230010142 + seq0076_2013.b230010149 + 
    --seq0076_2013.b230010156  + seq0076_2013.b230010161 + seq0076_2013.b230010166 + 
    --seq0076_2013.b230010171  + seq0076_2013.b230010007 + seq0076_2013.b230010014 + 
    --seq0076_2013.b230010021 + seq0076_2013.b230010028 + seq0076_2013.b230010035 + 
    --seq0076_2013.b230010042 + seq0076_2013.b230010049 + seq0076_2013.b230010056 + 
    --seq0076_2013.b230010063 + seq0076_2013.b230010070  + seq0076_2013.b230010075 + 
    --seq0076_2013.b230010080 + seq0076_2013.b230010085  as pop__civilian_employment__employed__count__1,

    --seq0076_2013.b230010094 + seq0076_2013.b230010101 + seq0076_2013.b230010108 + 
    --seq0076_2013.b230010115 + seq0076_2013.b230010122 + seq0076_2013.b230010129 + 
    --seq0076_2013.b230010136 + seq0076_2013.b230010143 + seq0076_2013.b230010150 + 
    --seq0076_2013.b230010157  + seq0076_2013.b230010162 + seq0076_2013.b230010167 + 
    --seq0076_2013.b230010172  + seq0076_2013.b230010008 + seq0076_2013.b230010015 + 
    --seq0076_2013.b230010022 + seq0076_2013.b230010029 + seq0076_2013.b230010036 + 
    --seq0076_2013.b230010043 + seq0076_2013.b230010050 + seq0076_2013.b230010057 + 
    --seq0076_2013.b230010064 + seq0076_2013.b230010071  + seq0076_2013.b230010076 + 
    --seq0076_2013.b230010081 + seq0076_2013.b230010086  as pop__civilian_employment__unemployed__count__2,


    seq0079_2013.b230250002 as pop__labor_force__in_labor_force__count__1,
    seq0079_2013.b230250007 as pop__labor_force__not_in_labor_force__count__2,
    seq0079_2013.b230250003 as pop__military_labor__civilian__count__1,
    seq0079_2013.b230250006 as pop__military_labor__military__count__2,
    seq0079_2013.b230250004 as pop__civilian_employment__employed__count__1,
    seq0079_2013.b230250005 as pop__civilian_employment__unemployed__count__2,


    seq0082_2013.c240300003 + seq0082_2013.c240300030 as pop__industry__agriculture_fishing_mining__count__1,
    seq0082_2013.c240300006 + seq0082_2013.c240300033 as pop__industry__construction__count__2,
    seq0082_2013.c240300007 + seq0082_2013.c240300034 as pop__industry__manufacturing__count__3,
    seq0082_2013.c240300008 + seq0082_2013.c240300035 as pop__industry__wholesale_trade__count__4,
    seq0082_2013.c240300009 + seq0082_2013.c240300036 as pop__industry__retail_trade__count__5,
    seq0082_2013.c240300010 + seq0082_2013.c240300037 as pop__industry__transportation__count__6,
    seq0082_2013.c240300013 + seq0082_2013.c240300040 as pop__industry__information__count__7,
    seq0082_2013.c240300014 + seq0082_2013.c240300041 as pop__industry__finance_and_insurance__count__8,
    seq0082_2013.c240300017 + seq0082_2013.c240300044 as pop__industry__scientific_and_professional__count__9,
    seq0082_2013.c240300021 + seq0082_2013.c240300048 as pop__industry__education_and_health_care__count__10,
    seq0082_2013.c240300024 + seq0082_2013.c240300051 as pop__industry__arts_food_and_entertainment__count__11,
    seq0082_2013.c240300028 + seq0082_2013.c240300055 as pop__industry__public_administration__count__12,
    seq0082_2013.c240300027 + seq0082_2013.c240300054 as pop__industry__other_services__count__13,
    --
    -- Income
    seq0059_2013.b190010002 as household__income__10000_or_less__usd__1,
    seq0059_2013.b190010003 as household__income__10000_to_14999__usd__2,
    seq0059_2013.b190010004 + seq0059_2013.b190010005 as household__income__15000_to_24999__usd__3,
    seq0059_2013.b190010006 + seq0059_2013.b190010007 as household__income__25000_to_34999__usd__4,
    seq0059_2013.b190010008 + seq0059_2013.b190010009 + seq0059_2013.b190010010 as household__income__35000_to_49999__usd__5,
    seq0059_2013.b190010011 + seq0059_2013.b190010012 as household__income__50000_to_74999__usd__6,
    seq0059_2013.b190010013 as household__income__75000_to_99999__usd__7,
    seq0059_2013.b190010014 + seq0059_2013.b190010015 as household__income__100000_to_149999__usd__8,
    seq0059_2013.b190010016 as household__income__150000_to_199999__usd__9,
    seq0059_2013.b190010017 as household__income__200000_or_more__usd__10,

    seq0107_2013.b250770001 as houseunit__total__median_home_value__usd__1,

    seq0059_2013.b190130001 as household__total__median_household_income__usd__1,

    seq0103_2013.b250100001 as household__total__average_household_size__count__1,

    seq0037_2013.b110050001 as household__total__total_household__count__1,

    --Language other than English
    COALESCE((seq0045_2013.b160040004 + seq0045_2013.b160040026 + seq0045_2013.b160040048 + seq0045_2013.b160040009 + seq0045_2013.b160040031 + seq0045_2013.b160040053 +
    seq0045_2013.b160040014 + seq0045_2013.b160040036 + seq0045_2013.b160040058 +seq0045_2013.b160040019 + seq0045_2013.b160040041 + seq0045_2013.b160040063)
    / NULLIF((seq0002_2013.b010010001 - (seq0002_2013.b010010003 + seq0002_2013.b010010027)), 0),0) * 100
    as total__language_other_than_english,
    --
    -- Vehicles and commute breakdowns 
    seq0105_2013.b250440003 + seq0105_2013.b250440010 AS houseunit__vehicles__none__count__1,
    seq0105_2013.b250440004 + seq0105_2013.b250440011 AS houseunit__vehicles__one__count__2,
    seq0105_2013.b250440005 + seq0105_2013.b250440012 AS houseunit__vehicles__two__count__3,
    seq0105_2013.b250440006 + seq0105_2013.b250440007 + seq0105_2013.b250440008 + seq0105_2013.b250440013 + seq0105_2013.b250440014 + seq0105_2013.b250440015 AS houseunit__vehicles__three_or_more__count__4,

    seq0028_2013.b083010003 + seq0028_2013.b083010004 + seq0028_2013.b083010010 + seq0028_2013.b083010019 + seq0028_2013.b083010020  as pop__total__total_pop_commuting_to_work__count__1,

    seq0028_2013.b083010003 as pop__commute__drive_alone__count__1,
    seq0028_2013.b083010004 as pop__commute__drive_carpool__count__2,
    seq0028_2013.b083010010 as pop__commute__public_transit__count__3,
    seq0028_2013.b083010019 as pop__commute__walk__count__4,
    seq0028_2013.b083010020 as pop__commute__other_transit__count__5,
    seq0028_2013.b083010021 as pop__commute__work_from_home__count__6,

    COALESCE((seq0023_2013.b080130002 + seq0023_2013.b080130003) / NULLIF(seq0023_2013.b080120001, 0), 0) as total__commute_mean_travel_time,

    seq0028_2013.b083030002 as pop__commute_time__less_than_5_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__5_to_9_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__10_to_14_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__15_to_19_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__20_to_24_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__25_to_29_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__30_to_34_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__35_to_39_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__40_to_44_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__45_to_59_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__60_to_89_min__count__1,
    seq0028_2013.b083030002 as pop__commute_time__more_than_90_min__count__1,
    --
    -- Building ages
    seq0105_2013.b250340002 as houseunit__building_age__built_2010_or_later__count__1,
    seq0105_2013.b250340003 as houseunit__building_age__built_2000_to_2009__count__2,
    seq0105_2013.b250340004 as houseunit__building_age__built_1990_to_1999__count__3,
    seq0105_2013.b250340005 as houseunit__building_age__built_1980_to_1989__count__4,
    seq0105_2013.b250340006 as houseunit__building_age__built_1970_to_1979__count__5,
    seq0105_2013.b250340007 as houseunit__building_age__built_1960_to_1969__count__6,
    seq0105_2013.b250340008 as houseunit__building_age__built_1950_to_1959__count__7,
    seq0105_2013.b250340009 as houseunit__building_age__built_1940_to_1949__count__8,
    seq0105_2013.b250340010 as houseunit__building_age__built_1939_or_earlier__count__9,
    --
    -- Generation breakdowns
    seq0002_2013.b010010003 + seq0002_2013.b010010027 + seq0002_2013.b010010004 + seq0002_2013.b010010028 + seq0002_2013.b010010005 + seq0002_2013.b010010029 + seq0002_2013.b010010006 + seq0002_2013.b010010030 as pop__generation__generation_z__count__1,
    seq0002_2013.b010010007 + seq0002_2013.b010010031 + seq0002_2013.b010010008 + seq0002_2013.b010010009 + seq0002_2013.b010010010 + seq0002_2013.b010010032 + seq0002_2013.b010010033 + seq0002_2013.b010010034 + seq0002_2013.b010010011 + seq0002_2013.b010010012 + seq0002_2013.b010010035 + seq0002_2013.b010010036 as pop__generation__millennials__count__2,
    seq0002_2013.b010010013 + seq0002_2013.b010010014 + seq0002_2013.b010010015 + seq0002_2013.b010010037 + seq0002_2013.b010010038 + seq0002_2013.b010010039 as pop__generation__generation_x__count__3,
    seq0002_2013.b010010016 + seq0002_2013.b010010040 + seq0002_2013.b010010017 + seq0002_2013.b010010041 + seq0002_2013.b010010018 + seq0002_2013.b010010019 + seq0002_2013.b010010042 + seq0002_2013.b010010043 + seq0002_2013.b010010020 + seq0002_2013.b010010021 + seq0002_2013.b010010044 + seq0002_2013.b010010045 pop__generation__baby_boomer__count__4,
    seq0002_2013.b010010022 + seq0002_2013.b010010046 + seq0002_2013.b010010023 + seq0002_2013.b010010024 + seq0002_2013.b010010047 + seq0002_2013.b010010048 + seq0002_2013.b010010025 + seq0002_2013.b010010049 as pop__generation__silent_generation__count__5,
    --
    -- Language
    seq0045_2013.b160020002 AS pop__language__english_only__count__1,
    seq0045_2013.b160020003 AS pop__language__spanish__count__2,
    seq0045_2013.b160020006 AS pop__language__other_indo_european__count__3,
    seq0045_2013.b160020009  AS pop__language__asian_pacific_islander__count__4,
    seq0045_2013.b160020012  AS pop__language__other__count__5,
    --
    -- Graduation 
    seq0041_2013.b140070002 as pop__education__enrolled_in_school__count__1,

    COALESCE((seq0043_2013.b150030022 + seq0043_2013.b150030023 + seq0043_2013.b150030024 + seq0043_2013.b150030025) / NULLIF(seq0043_2013.b150030001, 0),0) * 100 AS pop__total__college_graduation_rate__percent,

    COALESCE((seq0043_2013.b150030017 + seq0043_2013.b150030018 + seq0043_2013.b150030019 + seq0043_2013.b150030020 + seq0043_2013.b150030021 + seq0043_2013.b150030022 + seq0043_2013.b150030023 + seq0043_2013.b150030024 + seq0043_2013.b150030025) / NULLIF(seq0043_2013.b150030001, 0),0) * 100 AS pop__total__high_school_graduation_rate__percent,

    -- ? 
    seq0002_2013.b010010003 + seq0002_2013.b010010027 + seq0002_2013.b010010004 + seq0002_2013.b010010028 + seq0002_2013.b010010005 + seq0002_2013.b010010029 + seq0002_2013.b010010006 + seq0002_2013.b010010007 + seq0002_2013.b010010030 + seq0002_2013.b010010031 AS pop__total__under_20__count__1,
    -- 
    -- Poverty
    seq0054_2013.b170170002 AS household__total__below_poverty_level__count__1,
    seq0075_2013.b220020002 AS household__total__receive_food_stamps__count__1,
    --
    -- Vacancy rates
    COALESCE(seq0103_2013.b250040004 / NULLIF((seq0103_2013.b250030002 + seq0103_2013.b250040004), 0), 0) * 100 AS total__homeowner_vacancy_rate,
    seq0103_2013.b250040001 AS houseunit__total__vacant_housing_unit__count__1,

    COALESCE(seq0103_2013.b250040002 / NULLIF((seq0103_2013.b250040002 + seq0103_2013.b250030003), 0), 0) * 100 AS houseunit__total__rental_vacancy_rate__percent__1,

    seq0002_2013.b010010011 + seq0002_2013.b010010012 + seq0002_2013.b010010035 + seq0002_2013.b010010036 + seq0002_2013.b010010013 + seq0002_2013.b010010014 + seq0002_2013.b010010037 + seq0002_2013.b010010038 + seq0002_2013.b010010015 + seq0002_2013.b010010016 + seq0002_2013.b010010039 + seq0002_2013.b010010040 + seq0002_2013.b010010017 + seq0002_2013.b010010041 + seq0002_2013.b010010018 + seq0002_2013.b010010019 + seq0002_2013.b010010042 + seq0002_2013.b010010043 + seq0002_2013.b010010020 + seq0002_2013.b010010021 + seq0002_2013.b010010022 + seq0002_2013.b010010044 + seq0002_2013.b010010045 + seq0002_2013.b010010046 + seq0002_2013.b010010023 + seq0002_2013.b010010024 + seq0002_2013.b010010047 + seq0002_2013.b010010048 + seq0002_2013.b010010025 + seq0002_2013.b010010049 as pop__total__over_25__count__1,
    

    seq0103_2013.b250040004 AS houseunit__total__vacant_for_sale_only__count__1,
    seq0103_2013.b250040002 AS houseunit__total__vacant_for_rent__count__1,
    --
    -- Population over 5 
    seq0002_2013.b010010001 - (seq0002_2013.b010010003 + seq0002_2013.b010010027) AS pop__total__over_5__count__1,
    --    
    -- Grapi and smocapi
    seq0106_2013.b250700002 + seq0106_2013.b250700003 as household__grapi__less_than_15__percent__1,
    seq0106_2013.b250700004 as household__grapi__15_to_20__percent__2,
    seq0106_2013.b250700005 as household__grapi__20_to_25__percent__3,
    seq0106_2013.b250700006 as household__grapi__25_to_30__percent__4,
    seq0106_2013.b250700007 as household__grapi__30_to_35__percent__5,
    seq0106_2013.b250700008 + seq0106_2013.b250700009 + seq0106_2013.b250700010 as household__grapi__35_or_more__percent__6,


    seq0107_2013.b250910003 + seq0107_2013.b250910004 + seq0107_2013.b250910005 as household__smocapi__less_than_20__percent__1,
    seq0107_2013.b250910006 as household__smocapi__20_to_25__percent__2,
    seq0107_2013.b250910007 as household__smocapi__25_to_30__percent__3,
    seq0107_2013.b250910008 as household__smocapi__30_to_35__percent__4,
    seq0107_2013.b250910009 + seq0107_2013.b250910010 + seq0107_2013.b250910011 as household__smocapi__35_or_more__percent__5,
    --
    -- Pop over 65 (retired)
    seq0002_2013.b010010020 + seq0002_2013.b010010021 + seq0002_2013.b010010022 + 
    seq0002_2013.b010010044 + seq0002_2013.b010010045 + seq0002_2013.b010010046 + 
    seq0002_2013.b010010023 + seq0002_2013.b010010024 + seq0002_2013.b010010047 + 
    seq0002_2013.b010010048 + seq0002_2013.b010010025 + seq0002_2013.b010010049 AS pop__total__over_65__count__1,
    --
    -- Houseunit breakdowns
    seq0103_2013.b250070003 AS houseunit__owner_occupied__15_to_24__count,
    seq0103_2013.b250070004 AS houseunit__owner_occupied__25_to_34__count,
    seq0103_2013.b250070005 AS houseunit__owner_occupied__35_to_44__count,
    seq0103_2013.b250070006 AS houseunit__owner_occupied__45_to_54__count,
    seq0103_2013.b250070007 AS houseunit__owner_occupied__55_to_59__count,
    seq0103_2013.b250070008 AS houseunit__owner_occupied__60_to_64__count,
    seq0103_2013.b250070009 AS houseunit__owner_occupied__65_to_74__count,
    seq0103_2013.b250070010 AS houseunit__owner_occupied__75_to_84__count,
    seq0103_2013.b250070011 AS houseunit__owner_occupied__85_and_older__count,

    seq0103_2013.b250070013 AS houseunit__renter_occupied__15_to_24__count,
    seq0103_2013.b250070014 AS houseunit__renter_occupied__25_to_34__count,
    seq0103_2013.b250070015 AS houseunit__renter_occupied__35_to_44__count,
    seq0103_2013.b250070016 AS houseunit__renter_occupied__45_to_54__count,
    seq0103_2013.b250070017 AS houseunit__renter_occupied__55_to_59__count,
    seq0103_2013.b250070018 AS houseunit__renter_occupied__60_to_64__count,
    seq0103_2013.b250070019 AS houseunit__renter_occupied__65_to_74__count,
    seq0103_2013.b250070020 AS houseunit__renter_occupied__75_to_84__count,
    seq0103_2013.b250070021 AS houseunit__renter_occupied__85_and_older__count,

    seq0104_2013.b250240002 as houseunit__units_in_structure__1_unit_detached__count,
    seq0104_2013.b250240003 as houseunit__units_in_structure__1_unit_attached__count,
    seq0104_2013.b250240004 as houseunit__units_in_structure__2_units__count,
    seq0104_2013.b250240005 as houseunit__units_in_structure__3_or_4_units__count,
    seq0104_2013.b250240006 as houseunit__units_in_structure__5_to_9_units__count,
    seq0104_2013.b250240007 as houseunit__units_in_structure__10_to_19_units__count,
    seq0104_2013.b250240008 as houseunit__units_in_structure__20_to_49_units__count,
    seq0104_2013.b250240009 as houseunit__units_in_structure__50_units_or_more__count,
    seq0104_2013.b250240010 as houseunit__units_in_structure__mobile_homes__count,
    seq0104_2013.b250240011 as houseunit__units_in_structure__boat_rv_van_etc__count,

    seq0105_2013.b250380003 + seq0105_2013.b250380010 as household__moved_in__2010_or_later__count,
    seq0105_2013.b250380004 + seq0105_2013.b250380011 as household__moved_in__2000_to_2009__count,
    seq0105_2013.b250380005 + seq0105_2013.b250380012 as household__moved_in__1990_to_1999__count,
    seq0105_2013.b250380006 + seq0105_2013.b250380013 as household__moved_in__1980_to_1989__count,
    seq0105_2013.b250380007 + seq0105_2013.b250380014 as household__moved_in__1970_to_1979__count,
    seq0105_2013.b250380008 + seq0105_2013.b250380015 as household__moved_in__1969_or_earlier__count,
    --
    -- Population under 18 (total and by gender) and workforce
    seq0002_2013.b010010003 + seq0002_2013.b010010004 + seq0002_2013.b010010005 + 
    seq0002_2013.b010010006 + seq0002_2013.b010010027 + seq0002_2013.b010010028 + 
    seq0002_2013.b010010029 + seq0002_2013.b010010030 as pop__total__under_18__count,

    seq0078_2013.b230130003 AS pop__median_age_of_workers__female__count,
    seq0078_2013.b230130002 AS pop__median_age_of_workers__male__count,

    seq0023_2013.b080080001 AS pop__total__workers_16_and_over__count,

    seq0065_2013.b193010001 AS pop__total__per_capita_income__usd,

    seq0002_2013.b010010007 + seq0002_2013.b010010008 + seq0002_2013.b010010009 + 
    seq0002_2013.b010010010 + seq0002_2013.b010010011 + seq0002_2013.b010010012 + 
    seq0002_2013.b010010013 + seq0002_2013.b010010014 + seq0002_2013.b010010015 + 
    seq0002_2013.b010010016 + seq0002_2013.b010010017 + seq0002_2013.b010010018 + 
    seq0002_2013.b010010019 + seq0002_2013.b010010020 + seq0002_2013.b010010021 + 
    seq0002_2013.b010010022 + seq0002_2013.b010010023 + seq0002_2013.b010010024 + 
    seq0002_2013.b010010025 AS pop__18_and_over__male__count,

    seq0002_2013.b010010031 + seq0002_2013.b010010032 + seq0002_2013.b010010033 + 
    seq0002_2013.b010010034 + seq0002_2013.b010010035 + seq0002_2013.b010010036 + 
    seq0002_2013.b010010037 + seq0002_2013.b010010038 + seq0002_2013.b010010039 + 
    seq0002_2013.b010010040 + seq0002_2013.b010010041 + seq0002_2013.b010010042 + 
    seq0002_2013.b010010043 + seq0002_2013.b010010044 + seq0002_2013.b010010045 +
    seq0002_2013.b010010046 + seq0002_2013.b010010047 + seq0002_2013.b010010048 + 
    seq0002_2013.b010010049 as pop__18_and_over__female__count,   

    seq0002_2013.b010010007 + seq0002_2013.b010010008 + seq0002_2013.b010010009 + 
    seq0002_2013.b010010010 + seq0002_2013.b010010011 + seq0002_2013.b010010012 + 
    seq0002_2013.b010010013 + seq0002_2013.b010010014 + seq0002_2013.b010010015 + 
    seq0002_2013.b010010016 + seq0002_2013.b010010017 + seq0002_2013.b010010018 + 
    seq0002_2013.b010010019 + seq0002_2013.b010010020 + seq0002_2013.b010010021 + 
    seq0002_2013.b010010022 + seq0002_2013.b010010023 + seq0002_2013.b010010024 + 
    seq0002_2013.b010010025 + seq0002_2013.b010010031 + seq0002_2013.b010010032 + 
    seq0002_2013.b010010033 + seq0002_2013.b010010034 + seq0002_2013.b010010035 + 
    seq0002_2013.b010010036 + seq0002_2013.b010010037 + seq0002_2013.b010010038 + 
    seq0002_2013.b010010039 + seq0002_2013.b010010040 + seq0002_2013.b010010041 +
    seq0002_2013.b010010042 + seq0002_2013.b010010043 + seq0002_2013.b010010044 + 
    seq0002_2013.b010010045 + seq0002_2013.b010010046 + seq0002_2013.b010010047 +
    seq0002_2013.b010010048 + seq0002_2013.b010010049 as pop__18_and_over__all__count,

    seq0010_2013.b050060001 AS pop__total__foreign_born__count,

    -- Health insurance for noninstituionalized population
    -- under 18 insured and uninsured
    seq0114_2013.b270010004 + seq0114_2013.b270010007 + seq0114_2013.b270010032 + seq0114_2013.b270010035 as pop__total_count__noninstitutionalized_under_18_insured,
    (seq0114_2013.b270010004 + seq0114_2013.b270010007 + seq0114_2013.b270010032 + seq0114_2013.b270010035) / 
    (seq0114_2013.b270010003 + 
    seq0114_2013.b270010006 + 
    seq0114_2013.b270010031 + 
    seq0114_2013.b270010034                   
    ) * 100 as pop__total_percent__noninstitutionalized_under_18_insured,  
                                                                    
    seq0114_2013.b270010005 + seq0114_2013.b270010008 + seq0114_2013.b270010033 + seq0114_2013.b270010036 as pop__total_count__noninstitutionalized_under_18_uninsured,            
    (seq0114_2013.b270010005 + seq0114_2013.b270010008 + seq0114_2013.b270010033 + seq0114_2013.b270010036) / 
    (seq0114_2013.b270010003 + 
    seq0114_2013.b270010006 + 
    seq0114_2013.b270010031 + 
    seq0114_2013.b270010034                   
    ) * 100 as pop__total_percent__noninstitutionalized_under_18_uninsured,  
                                                                    
    -- over 18 insured and uninsured
    seq0114_2013.b270010010 + seq0114_2013.b270010013 + seq0114_2013.b270010016 + seq0114_2013.b270010019 + seq0114_2013.b270010022 +
    seq0114_2013.b270010025 + seq0114_2013.b270010028 + seq0114_2013.b270010038 + seq0114_2013.b270010041 + seq0114_2013.b270010044 + 
    seq0114_2013.b270010047 + seq0114_2013.b270010050 + seq0114_2013.b270010053 + seq0114_2013.b270010056 as pop__total_count__noninstitutionalized_over_18_insured,

    (seq0114_2013.b270010010 + seq0114_2013.b270010013 + seq0114_2013.b270010016 + seq0114_2013.b270010019 + seq0114_2013.b270010022 +
    seq0114_2013.b270010025 + seq0114_2013.b270010028 + seq0114_2013.b270010038 + seq0114_2013.b270010041 + seq0114_2013.b270010044 + 
    seq0114_2013.b270010047 + seq0114_2013.b270010050 + seq0114_2013.b270010053 + seq0114_2013.b270010056) / 
    (seq0114_2013.b270010009 +                                                                                             
    seq0114_2013.b270010012 +                                                                                             
    seq0114_2013.b270010015 +                                                                                             
    seq0114_2013.b270010018 +                                                                                             
    seq0114_2013.b270010021 +                                                                                             
    seq0114_2013.b270010024 +                                                                                             
    seq0114_2013.b270010027 +                                                                                             
    seq0114_2013.b270010037 +                                                                                             
    seq0114_2013.b270010040 +                                                                                             
    seq0114_2013.b270010043 +                                                                                             
    seq0114_2013.b270010046 +                                                                                             
    seq0114_2013.b270010049 +                                                                                             
    seq0114_2013.b270010052 +                                                                                             
    seq0114_2013.b270010055   
    ) * 100 as pop__total_percent__noninstitutionalized_over_18_insured, 

    seq0114_2013.b270010011 + seq0114_2013.b270010014 + seq0114_2013.b270010017 + seq0114_2013.b270010020 + seq0114_2013.b270010023 +
    seq0114_2013.b270010026 + seq0114_2013.b270010029 + seq0114_2013.b270010039 + seq0114_2013.b270010042 + seq0114_2013.b270010045 +
    seq0114_2013.b270010048 + seq0114_2013.b270010051 + seq0114_2013.b270010054 + seq0114_2013.b270010057 as pop__total_count__noninstitutionalized_over_18_uninsured,

    (seq0114_2013.b270010011 + seq0114_2013.b270010014 + seq0114_2013.b270010017 + seq0114_2013.b270010020 + seq0114_2013.b270010023 +
    seq0114_2013.b270010026 + seq0114_2013.b270010029 + seq0114_2013.b270010039 + seq0114_2013.b270010042 + seq0114_2013.b270010045 +
    seq0114_2013.b270010048 + seq0114_2013.b270010051 + seq0114_2013.b270010054 + seq0114_2013.b270010057) / 
    (seq0114_2013.b270010009 +                                                                                             
    seq0114_2013.b270010012 +                                                                                             
    seq0114_2013.b270010015 +                                                                                             
    seq0114_2013.b270010018 +                                                                                             
    seq0114_2013.b270010021 +                                                                                             
    seq0114_2013.b270010024 +                                                                                             
    seq0114_2013.b270010027 +                                                                                             
    seq0114_2013.b270010037 +                                                                                             
    seq0114_2013.b270010040 +                                                                                             
    seq0114_2013.b270010043 +                                                                                             
    seq0114_2013.b270010046 +                                                                                             
    seq0114_2013.b270010049 +                                                                                             
    seq0114_2013.b270010052 +                                                                                             
    seq0114_2013.b270010055   
    ) * 100 as pop__total_percent__noninstitutionalized_over_18_uninsured,       

    -- total uninstitutionalized population insured and uninsured
    seq0114_2013.b270010004 + seq0114_2013.b270010007 + seq0114_2013.b270010032 + seq0114_2013.b270010035 + seq0114_2013.b270010010 + 
    seq0114_2013.b270010013 + seq0114_2013.b270010016 + seq0114_2013.b270010019 + seq0114_2013.b270010022 + seq0114_2013.b270010025 + 
    seq0114_2013.b270010028 + seq0114_2013.b270010038 + seq0114_2013.b270010041 + seq0114_2013.b270010044 + seq0114_2013.b270010047 + 
    seq0114_2013.b270010050 + seq0114_2013.b270010053 + seq0114_2013.b270010056 as pop__total_count__noninstitutionalized_insured,

    (seq0114_2013.b270010004 + seq0114_2013.b270010007 + seq0114_2013.b270010032 + seq0114_2013.b270010035 + seq0114_2013.b270010010 + 
    seq0114_2013.b270010013 + seq0114_2013.b270010016 + seq0114_2013.b270010019 + seq0114_2013.b270010022 + seq0114_2013.b270010025 + 
    seq0114_2013.b270010028 + seq0114_2013.b270010038 + seq0114_2013.b270010041 + seq0114_2013.b270010044 + seq0114_2013.b270010047 + 
    seq0114_2013.b270010050 + seq0114_2013.b270010053 + seq0114_2013.b270010056) / 
    (seq0114_2013.b270010001) * 100 as pop__total_percent__noninstitutionalized_insured, 

    seq0114_2013.b270010005 + seq0114_2013.b270010008 + seq0114_2013.b270010033 + seq0114_2013.b270010036 + seq0114_2013.b270010011 + 
    seq0114_2013.b270010014 + seq0114_2013.b270010017 + seq0114_2013.b270010020 + seq0114_2013.b270010023 + seq0114_2013.b270010026 + 
    seq0114_2013.b270010029 + seq0114_2013.b270010039 + seq0114_2013.b270010042 + seq0114_2013.b270010045 + seq0114_2013.b270010048 + 
    seq0114_2013.b270010051 + seq0114_2013.b270010054 + seq0114_2013.b270010057 as pop__total_count__noninstitutionalized_uninsured,

    (seq0114_2013.b270010005 + seq0114_2013.b270010008 + seq0114_2013.b270010033 + seq0114_2013.b270010036 + seq0114_2013.b270010011 + 
    seq0114_2013.b270010014 + seq0114_2013.b270010017 + seq0114_2013.b270010020 + seq0114_2013.b270010023 + seq0114_2013.b270010026 + 
    seq0114_2013.b270010029 + seq0114_2013.b270010039 + seq0114_2013.b270010042 + seq0114_2013.b270010045 + seq0114_2013.b270010048 + 
    seq0114_2013.b270010051 + seq0114_2013.b270010054 + seq0114_2013.b270010057) / 
    (seq0114_2013.b270010001) * 100 as pop__total_percent__noninstitutionalized_uninsured,
    --
    -- Marital status population over 15
    -- Married
    seq0038_2013.b120010004 + seq0038_2013.b120010013 as pop__total_count__over_15_married,

    coalesce((seq0038_2013.b120010004 + seq0038_2013.b120010013) / 
    nullif(seq0038_2013.b120010001,0) * 100) as pop__total_percent__over_15_married,

    -- Never married
    seq0038_2013.b120010003 + seq0038_2013.b120010012 as pop__total_count__over_15_never_married,

    coalesce((seq0038_2013.b120010003 + seq0038_2013.b120010012) / 
    nullif(seq0038_2013.b120010001,0) * 100) as pop__total_percent__over_15_ne  ver_married,

    -- Widowed
    seq0038_2013.b120010009 + seq0038_2013.b120010018 as pop__total_count__over_15_widowed,

    coalesce((seq0038_2013.b120010009 + seq0038_2013.b120010018) / 
    nullif(seq0038_2013.b120010001,0) * 100) as pop__total_percent__over_15_widowed,

    -- Divorced
    seq0038_2013.b120010010 + seq0038_2013.b120010019 as pop__total_count__over_15_divorced,

    coalesce((seq0038_2013.b120010010 + seq0038_2013.b120010019) / 
    nullif(seq0038_2013.b120010001,0) * 100) as pop__total_percent__over_15_divorced,
    
    -- 65 and Over Population Medicare Coverage
    seq0115_2013.c270060009 + seq0115_2013.c270060019 AS population__65_and_over__medicare__total,
    seq0115_2013.c270060010 + seq0115_2013.c270060020 AS population__65_and_over__with_medicare__count,
    (seq0115_2013.c270060010 + seq0115_2013.c270060020) / NULLIF(seq0115_2013.c270060009 + seq0115_2013.c270060019, 0::double precision) * 100::double precision AS population__65_and_over__with_medicare__percent,
    seq0115_2013.c270060011 + seq0115_2013.c270060021 AS population__65_and_over__no_medicare__count,
    (seq0115_2013.c270060011 + seq0115_2013.c270060021) / NULLIF(seq0115_2013.c270060009 + seq0115_2013.c270060019, 0::double precision) * 100::double precision AS population__65_and_over__no_medicare__percent,
    
    -- Foreign Born Population Period of Naturalization
    seq0012_2013.b050110003 AS population__foreign_born__naturalized_citizens_total__count,
    seq0012_2013.b050110004 AS population__foreign_born__2010_or_later__count,
    seq0012_2013.b050110005 AS population__foreign_born__2005_to_2009__count,
    seq0012_2013.b050110006 AS population__foreign_born__2000_to_2004__count,
    seq0012_2013.b050110011 AS population__foreign_born__1995_to_1999__count,
    seq0012_2013.b050110011 AS population__foreign_born__1990_to_1994__count,
    seq0012_2013.b050110011 AS population__foreign_born__1985_to_1989__count,
    seq0012_2013.b050110011 AS population__foreign_born__1980_to_1984__count,
    seq0012_2013.b050110011 AS population__foreign_born__before_1980__count
        

FROM acs_2013.geoheader_2013
JOIN acs_2013.seq0001_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0002_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0005_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0010_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0023_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0028_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0029_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0037_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0038_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0041_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0043_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0045_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0054_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0059_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0063_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0065_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0075_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0076_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0078_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0079_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0082_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0103_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0104_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0105_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0106_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0107_2013 USING (stusab, logrecno)
JOIN acs_2013.seq0114_2013 USING (stusab, logrecno)

    --
JOIN geo_blockgroup 
    ON geo_blockgroup.geoid = substring(geoheader_2013.geoid from position('US' in geoheader_2013.geoid)+2 for char_length(geoheader_2013.geoid))
WHERE geoheader_2013.geoid like '15000%'
;
