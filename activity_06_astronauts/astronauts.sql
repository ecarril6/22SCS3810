-- astronauts database
-- created at: <date>
-- author: <your name>

CREATE DATABASE astronauts;

-- MySQL
--- USE astronauts;
\c astronauts

DROP TABLE IF EXISTS Astronauts;

-- TODO: create table Astronauts
-- MySQL
-- CREATE TABLE Astronauts (
--   id          INTEGER PRIMARY KEY AUTO_INCREMENT,
--   lastName    VARCHAR(20),
--   firstName   VARCHAR(20),
--   suffix      VARCHAR(5),
--   gender      CHAR(1),
--   birth       DATE,
--   city        VARCHAR(20),
--   state       VARCHAR(20),
--   country     VARCHAR(15),
--   status      VARCHAR(10),
--   daysInSpace INTEGER,
--   flights     INTEGER );
CREATE TABLE Astronauts (
  id          SERIAL PRIMARY KEY,
  lastName    VARCHAR(20),
  firstName   VARCHAR(20),
  suffix      VARCHAR(5),
  gender      CHAR(1),
  birth       DATE,
  city        VARCHAR(20),
  state       VARCHAR(20),
  country     VARCHAR(15),
  status      VARCHAR(10),
  daysInSpace INTEGER,
  flights     INTEGER );

-- TODO: populate table Astronauts
-- MySQL
-- LOAD DATA INFILE '/Users/tmota/devel/teach/__22SCS3810_PDS/activities/activity_06_astronauts/astronauts.csv' INTO TABLE Astronauts FIELDS TERMINATED BY ',' IGNORE 1 ROWS (lastName, firstName, suffix, gender, birth, city, state, country, status, daysInSpace, flights);
\COPY Astronauts (lastName,firstName,suffix,gender,birth,city,state,country,status,daysInSpace,flights) FROM '/Users/tmota/devel/teach/__22SCS3810_PDS/activities/activity_06_astronauts/astronauts.csv' DELIMITER ',' CSV HEADER;

-- TODO: a) the total number of astronauts.
SELECT COUNT(*) FROM Astronauts;

-- TODO: b) the total number of American astronauts.
SELECT COUNT(*) FROM Astronauts WHERE country = 'USA';

-- TODO: c) the list of nationalities of all astronauts in alphabetical order.
SELECT DISTINCT country FROM Astronauts ORDER BY 1;

-- TODO: d) all astronaut names ordered by last name (use the format Last Name, First Name, Suffix to display the names).
SELECT lastName, firstName, suffix FROM Astronauts ORDER BY 1;

-- TODO: e) the total number of astronauts by gender.
SELECT gender, COUNT(*) FROM Astronauts GROUP BY gender;

-- TODO: f) the total number of female astronauts that are still active.
SELECT COUNT(*) FROM Astronauts WHERE gender = 'F' AND status = 'Active';

-- TODO: g) the total number of American female astronauts that are still active.
SELECT COUNT(*) FROM Astronauts WHERE gender = 'F' AND country = 'USA' AND status = 'Active';

-- TODO: h) the list of all American female astronauts that are still active ordered by last name (use the same name format used in d).
SELECT lastName, firstName, suffix FROM Astronauts WHERE gender = 'F' AND country = 'USA' AND status = 'Active' ORDER BY 1;

-- TODO: i) the list of Chinese astronauts, displaying only their names and ages (use the same name format used in d).
SELECT lastName, firstName, suffix, birth, TIMESTAMPDIFF(YEAR, birth, CURDATE()) AS age FROM Astronauts WHERE country = 'China' ORDER BY lastName;

-- TODO: j) the total number of astronauts by country.
SELECT COUNT(*), country FROM Astronauts GROUP BY country;

-- TODO: k) the total number of American astronauts per state ordered by the totals in descendent order.
SELECT COUNT(*), state FROM Astronauts WHERE country = 'USA' GROUP BY state ORDER BY 1 DESC;

-- TODO: l) the total number of astronauts by statuses (i.e., active or retired).
SELECT COUNT(*), status FROM Astronauts GROUP BY status;

-- TODO: m) name and age of all non-American astronauts in alphabetical order (use the same name format used in d).
SELECT lastName, firstName, suffix FROM Astronauts WHERE country <> 'USA' ORDER BY 1;

-- TODO: n) the average age of all American astronauts that are still active.
SELECT AVG(TIMESTAMPDIFF(YEAR, birth, CURDATE())) AS "avg age" FROM Astronauts WHERE country = 'USA' AND status = 'Active';
