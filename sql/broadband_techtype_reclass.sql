alter table upload.broadband_all_merged
add column techtype integer

update upload.broadband_all_merged
set techtype = 1 where transtech = 10 or transtech = 20;

update upload.broadband_all_merged
set techtype = 2 where transtech = 40 or transtech = 41;

update upload.broadband_all_merged
set techtype = 3 where transtech = 50;

update upload.broadband_all_merged
set techtype = 4 where transtech = 60;

update upload.broadband_all_merged
set techtype = 5 where transtech = 80;

update upload.broadband_all_merged
set techtype = 6 where transtech = 30 or transtech = 70 or transtech = 71 or transtech = 90 or transtech = 0;