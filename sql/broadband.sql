select

count(provname) as count,
dash_blockgroup_geo.shid,
COUNT(CASE WHEN MAXADDOWN = '2' THEN '1' END) as maxaddown_200_kbps_to_768_kbps,
COUNT(CASE WHEN MAXADDOWN = '3' THEN '1' END) as maxaddown_768_kbps_to_15_mbps,
COUNT(CASE WHEN MAXADDOWN = '4' THEN '1' END) as maxaddown_15_mbps_to_3_mbps,
COUNT(CASE WHEN MAXADDOWN = '5' THEN '1' END) as maxaddown_3_mbps_to_6_mbps,
COUNT(CASE WHEN MAXADDOWN = '6' THEN '1' END) as maxaddown_6_mbps_to_10_mbps,
COUNT(CASE WHEN MAXADDOWN = '7' THEN '1' END) as maxaddown_10_mbps_to_25_mbps,
COUNT(CASE WHEN MAXADDOWN = '8' THEN '1' END) as maxaddown_25_mbps_to_50_mbps,
COUNT(CASE WHEN MAXADDOWN = '9' THEN '1' END) as maxaddown_50_mbps_to_100_mbps,
COUNT(CASE WHEN MAXADDOWN = '10' THEN '1' END)as maxaddown_100_mbps_to_1_gbps,
COUNT(CASE WHEN MAXADDOWN = '11' THEN '1' END)as maxaddown_greater_than_1_gbps,

COUNT(CASE WHEN MAXADUP = '2' THEN '1' END) as maxadup_200_kbps_to_768_kbps,
COUNT(CASE WHEN MAXADUP = '3' THEN '1' END) as maxadup_768_kbps_to_15_mbps,
COUNT(CASE WHEN MAXADUP = '4' THEN '1' END) as maxadup_15_mbps_to_3_mbps,
COUNT(CASE WHEN MAXADUP = '5' THEN '1' END) as maxadup_3_mbps_to_6_mbps,
COUNT(CASE WHEN MAXADUP = '6' THEN '1' END) as maxadup_6_mbps_to_10_mbps,
COUNT(CASE WHEN MAXADUP = '7' THEN '1' END) as maxadup_10_mbps_to_25_mbps,
COUNT(CASE WHEN MAXADUP = '8' THEN '1' END) as maxadup_25_mbps_to_50_mbps,
COUNT(CASE WHEN MAXADUP = '9' THEN '1' END) as maxadup_50_mbps_to_100_mbps,
COUNT(CASE WHEN MAXADUP = '10' THEN '1' END)as maxadup_100_mbps_to_1_gbps,
COUNT(CASE WHEN MAXADUP = '11' THEN '1' END)as maxadup_greater_than_1_gbps,

COUNT(CASE WHEN typicdown = '2' THEN '1' END) as typicdown_200_kbps_to_768_kbps,
COUNT(CASE WHEN typicdown = '3' THEN '1' END) as typicdown_768_kbps_to_15_mbps,
COUNT(CASE WHEN typicdown = '4' THEN '1' END) as typicdown_15_mbps_to_3_mbps,
COUNT(CASE WHEN typicdown = '5' THEN '1' END) as typicdown_3_mbps_to_6_mbps,
COUNT(CASE WHEN typicdown = '6' THEN '1' END) as typicdown_6_mbps_to_10_mbps,
COUNT(CASE WHEN typicdown = '7' THEN '1' END) as typicdown_10_mbps_to_25_mbps,
COUNT(CASE WHEN typicdown = '8' THEN '1' END) as typicdown_25_mbps_to_50_mbps,
COUNT(CASE WHEN typicdown = '9' THEN '1' END) as typicdown_50_mbps_to_100_mbps,
COUNT(CASE WHEN typicdown = '10' THEN '1' END)as typicdown_100_mbps_to_1_gbps,
COUNT(CASE WHEN typicdown = '11' THEN '1' END)as typicdown_greater_than_1_gbps,

COUNT(CASE WHEN typicup = '2' THEN '1' END) as typicup_200_kbps_to_768_kbps,
COUNT(CASE WHEN typicup = '3' THEN '1' END) as typicup_768_kbps_to_15_mbps,
COUNT(CASE WHEN typicup = '4' THEN '1' END) as typicup_15_mbps_to_3_mbps,
COUNT(CASE WHEN typicup = '5' THEN '1' END) as typicup_3_mbps_to_6_mbps,
COUNT(CASE WHEN typicup = '6' THEN '1' END) as typicup_6_mbps_to_10_mbps,
COUNT(CASE WHEN typicup = '7' THEN '1' END) as typicup_10_mbps_to_25_mbps,
COUNT(CASE WHEN typicup = '8' THEN '1' END) as typicup_25_mbps_to_50_mbps,
COUNT(CASE WHEN typicup = '9' THEN '1' END) as typicup_50_mbps_to_100_mbps,
COUNT(CASE WHEN typicup = '10' THEN '1' END)as typicup_100_mbps_to_1_gbps,
COUNT(CASE WHEN typicup = '11' THEN '1' END)as typicup_greater_than_1_gbps,

count(CASE WHEN transtech = 10 THEN 1 END) AS  type_Asymmetric_xDSL,
count(CASE WHEN transtech = 20 THEN 1 END) AS  type_Symmetric_xDSL,
count(CASE WHEN transtech = 30 THEN 1 END) AS  type_Other_Copper_Wire,
count(CASE WHEN transtech = 40 THEN 1 END) AS  type_Cable_Modem_DOCSIS_30_Down,
count(CASE WHEN transtech = 41 THEN 1 END) AS  type_Cable_Model_Other,
count(CASE WHEN transtech = 50 THEN 1 END) AS  type_Optical_CarrierFiber_to_the_End_User,
count(CASE WHEN transtech = 60 THEN 1 END) AS  type_Satellite,
count(CASE WHEN transtech = 70 THEN 1 END) AS  type_Terrestrial_Fixed_Unlicensed,
count(CASE WHEN transtech = 71 THEN 1 END) AS  type_Terrestrial_Fixed_Licensed,
count(CASE WHEN transtech = 80 THEN 1 END) AS  type_Terrestrial_Mobile_Wireless,
count(CASE WHEN transtech = 90 THEN 1 END) AS  type_Electric_Power_Line,
count(CASE WHEN transtech = 0  THEN 1 END) AS  type_All_Other

FROM upload.broadband_ia_test, dash_blockgroup_geo
WHERE ST_Intersects(upload.broadband_ia_test.geom, dash_blockgroup_geo.geom) and dash_blockgroup_geo.shid = 'country:us/state:ia/block_group:191930015003'
GROUP BY dash_blockgroup_geo.name, dash_blockgroup_geo.geom, dash_blockgroup_geo.shid


