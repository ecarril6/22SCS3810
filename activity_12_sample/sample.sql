CREATE DATABASE sample; 

\c sample 

\timing 

DROP TABLE Sample;

CREATE TABLE Sample ( 
  id INT PRIMARY KEY, 
  rnd INT NOT NULL 
); 

\COPY Sample (id, rnd) FROM '/Users/tmota/devel/teach/__22SCS3810_PDS/activities/activity_12_sample/sample2.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM Sample WHERE rnd = 50000;

CREATE INDEX rnd ON Sample(rnd); 

DROP INDEX rnd; 