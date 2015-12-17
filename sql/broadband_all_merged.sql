﻿CREATE MATERIALIZED VIEW broadband_union_place_mview AS
SELECT

--maxdown selections
broadband_maxdown_place.shid,
broadband_maxdown_place."broadband__max_download__768_kbps_to_1.5_mbps__count",
broadband_maxdown_place."broadband__max_download__1.5_mbps_to_3_mbps__count",
broadband_maxdown_place.broadband__max_download__3_mbps_to_6_mbps__count,
broadband_maxdown_place.broadband__max_download__6_mbps_to_10_mbps__count,
broadband_maxdown_place.broadband__max_download__10_mbps_to_25_mbps__count,
broadband_maxdown_place.broadband__max_download__25_mbps_to_50_mbps__count,
broadband_maxdown_place.broadband__max_download__50_mbps_to_100_mbps__count,
broadband_maxdown_place.broadband__max_download__100_mbps_to_1_gbps__count,
broadband_maxdown_place.broadband__max_download__greater_than_1_gbps__count,

--maxup selections
broadband_maxup_place.broadband__max_upload__200_kbps_to_768_kbps__count,
broadband_maxup_place."broadband__max_upload__768_kbps_to_1.5_mbps__count",
broadband_maxup_place."broadband__max_upload__1.5_mbps_to_3_mbps__count",
broadband_maxup_place.broadband__max_upload__3_mbps_to_6_mbps__count,
broadband_maxup_place.broadband__max_upload__6_mbps_to_10_mbps__count,
broadband_maxup_place.broadband__max_upload__10_mbps_to_25_mbps__count,
broadband_maxup_place.broadband__max_upload__25_mbps_to_50_mbps__count,
broadband_maxup_place.broadband__max_upload__50_mbps_to_100_mbps__count,
broadband_maxup_place.broadband__max_upload__100_mbps_to_1_gbps__count,
broadband_maxup_place.broadband__max_upload__greater_than_1_gbps__count,

--typicdown selections
broadband_typicdown_place.broadband__typical_upload__200_kbps_to_768_kbps__count,
broadband_typicdown_place."broadband__typical_upload__768_kbps_to_1.5_mbps__count",
broadband_typicdown_place."broadband__typical_upload__1.5_mbps_to_3_mbps__count",
broadband_typicdown_place.broadband__typical_upload__3_mbps_to_6_mbps__count,
broadband_typicdown_place.broadband__typical_upload__6_mbps_to_10_mbps__count,
broadband_typicdown_place.broadband__typical_upload__10_mbps_to_25_mbps__count,
broadband_typicdown_place.broadband__typical_upload__25_mbps_to_50_mbps__count,
broadband_typicdown_place.broadband__typical_upload__50_mbps_to_100_mbps__count,
broadband_typicdown_place.broadband__typical_upload__100_mbps_to_1_gbps__count,
broadband_typicdown_place.broadband__typical_upload__greater_than_1_gbps__count,

--typicup selections
broadband_typicup_place.broadband__typical_download__200_kbps_to_768_kbps__count,
broadband_typicup_place."broadband__typical_download__768_kbps_to_1.5_mbps__count",
broadband_typicup_place."broadband__typical_download__1.5_mbps_to_3_mbps__count",
broadband_typicup_place.broadband__typical_download__3_mbps_to_6_mbps__count,
broadband_typicup_place.broadband__typical_download__6_mbps_to_10_mbps__count,
broadband_typicup_place.broadband__typical_download__10_mbps_to_25_mbps__count,
broadband_typicup_place.broadband__typical_download__25_mbps_to_50_mbps__count,
broadband_typicup_place.broadband__typical_download__50_mbps_to_100_mbps__count,
broadband_typicup_place.broadband__typical_download__100_mbps_to_1_gbps__count,
broadband_typicup_place.broadband__typical_download__greater_than_1_gbps__count,

--techtype selections
broadband_techtype_place.broadband__dsl__count,
broadband_techtype_place.broadband__cable__count,
broadband_techtype_place.broadband__fiber__count,
broadband_techtype_place.broadband__satellite__count,
broadband_techtype_place.broadband__wireless__count,
broadband_techtype_place.broadband__other__count,

--number of providers
broadband_providers_place.broadband__total_number_of_providers__count
​
FROM broadband_maxdown_place
  LEFT JOIN broadband_maxup_place ON broadband_maxup_place.shid = broadband_maxdown_place.shid
  LEFT JOIN broadband_typicdown_place ON broadband_typicdown_place.shid = broadband_maxdown_place.shid
  LEFT JOIN broadband_typicup_place ON broadband_typicup_place.shid = broadband_maxdown_place.shid
  LEFT JOIN broadband_techtype_place ON broadband_techtype_place.shid = broadband_maxdown_place.shid
  LEFT JOIN broadband_providers_place ON broadband_providers_place.shid = broadband_maxdown_place.shid

