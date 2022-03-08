-- wines database
-- team: <your name(s)>

CREATE DATABASE wines;

\c wines;

DROP TABLE IF EXISTS Purchases;
DROP TABLE IF EXISTS CustomerPreferences;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Wines;
DROP TABLE IF EXISTS Wineries;
DROP TABLE IF EXISTS WineTypes;
DROP TABLE IF EXISTS Regions;

CREATE TABLE Regions (
    id INT PRIMARY KEY, 
    "desc" VARCHAR(20) NOT NULL
);

INSERT INTO Regions VALUES 
    (1, 'Napa Valley'), 
    (2, 'Sonoma Valley'), 
    (3, 'Palisade');

CREATE TABLE Wineries (
    id INT PRIMARY KEY, 
    name VARCHAR(50) NOT NULL, 
    address VARCHAR(50), 
    state CHAR(2), 
    zipcode INT, 
    region INT NOT NULL, 
    FOREIGN KEY (region) REFERENCES Regions (id)
);

INSERT INTO Wineries VALUES 
    (101, 'Louis M. Martini Winery', '254 Saint Helena Highway S, St Helena', 'CA', 94574, 1),
    (202, 'Domaine Carneros', '1240 Duhig Road, Napa', 'CA', 94559, 1), 
    (303, 'Pine Ridge Vineyards', '5901 Silverado Trail, Napa', 'CA', 94558, 1), 
    (404, 'Gloria Ferrer Caves & Vineyards', '23555 Arnold Dr, Sonoma', 'CA', 95476, 2), 
    (505, 'Buena Vista Winery', '18000 Old Winery Rd, Sonoma', 'CA', 95476, 2), 
    (606, 'Graystone Winery', '3352 F Road Clifton', 'CO', 81520, 3);

CREATE TABLE WineTypes (
    id INT PRIMARY KEY, 
    name VARCHAR(20) NOT NULL
);

INSERT INTO WineTypes VALUES 
    (1, 'Sauvignon Blanc'), 
    (2, 'Cabernet Sauvignon'),
    (3, 'Pinot Noir'), 
    (4, 'Merlot'), 
    (5, 'Malbec');

CREATE TABLE Wines (
    winery INT NOT NULL, 
    number INT NOT NULL, 
    PRIMARY KEY (winery, number), 
    FOREIGN KEY (winery) REFERENCES Wineries (id), 
    name VARCHAR(30) NOT NULL, 
    type INT NOT NULL, 
    price DECIMAL(7,2) NOT NULL, 
    FOREIGN KEY (type) REFERENCES WineTypes (id)
);

INSERT INTO Wines VALUES 
    (101, 234, 'Sauvignon Blanc V20', 1, 100), 
    (101, 345, 'Merlot V18', 4, 150), 
    (101, 456, 'Merlot V19', 4, 170), 
    (101, 567, 'Monte Rosso V16', 5, 250), 
    (202, 222, '2020 Avant-Garde Pinot Noir', 3, 800),
    (202, 333, '2019 Domaine Carneros Estate', 3, 50), 
    (303, 987, 'Cabernet Sauvignon', 2, 100), 
    (505, 876, 'Pinot Noir', 3, 175), 
    (505, 765, 'Cabernet Sauvignon 2018', 2, 123), 
    (606, 234, 'Greystone Merlot', 4, 245), 
    (606, 345, 'Greystone Cabernet Sauvignon', 2, 47);

CREATE TABLE Customers (
    email VARCHAR(30) PRIMARY KEY, 
    name VARCHAR(50) NOT NULL
);

INSERT INTO Customers VALUES 
    ('smcduck@gmail.com', 'Scrooge'), 
    ('dduck@gmail.com', 'Donald'), 
    ('mspell@gmail.com', 'Magica De Spell'), 
    ('dduck2@gmail.com', 'Daisy');

CREATE TABLE CustomerPreferences (
    email VARCHAR(30) NOT NULL, 
    type INT NOT NULL,
    rating INT NOT NULL,  
    PRIMARY KEY (email, type), 
    FOREIGN KEY (email) REFERENCES Customers (email), 
    FOREIGN KEY (type) REFERENCES WineTypes (id)
);

INSERT INTO CustomerPreferences VALUES 
    ('smcduck@gmail.com', 1, 5), 
    ('smcduck@gmail.com', 2, 3), 
    ('dduck@gmail.com',   3, 4), 
    ('dduck@gmail.com',   4, 2), 
    ('mspell@gmail.com',  1, 5), 
    ('mspell@gmail.com',  5, 5), 
    ('dduck2@gmail.com',  1, 3);

CREATE TABLE Purchases (
    email VARCHAR(30) NOT NULL, 
    winery INT NOT NULL, 
    number INT NOT NULL, 
    date   DATE NOT NULL, 
    qtt    INT NOT NULL, 
    PRIMARY KEY (email, winery, number, date), 
    FOREIGN KEY (email) REFERENCES Customers (email), 
    FOREIGN KEY (winery, number) REFERENCES Wines (winery, number) 
);

INSERT INTO Purchases VALUES 
    ('smcduck@gmail.com', 101, 234, '2022-01-10', 1),
    ('dduck@gmail.com', 202, 333, '2020-02-14', 1), 
    ('dduck@gmail.com', 202, 333, '2021-02-14', 2), 
    ('dduck@gmail.com', 202, 333, '2022-02-14', 3), 
    ('mspell@gmail.com', 606, 234, '2022-03-17', 50);

-- TODO #1: the most expensive wine in the collection 
SELECT * FROM Wines ORDER BY price DESC LIMIT 1;

 winery | number |            name             | type | price  
--------+--------+-----------------------------+------+--------
    202 |    222 | 2020 Avant-Garde Pinot Noir |    3 | 800.00

-- TODO #2: the number of wines per region in the collection 
SELECT C."desc" AS region, COUNT(*) AS wines FROM Wines A INNER JOIN Wineries B ON A.winery = B.id INNER JOIN Regions C ON B.region = C.id GROUP BY (C."desc");

    region     | wines 
---------------+-------
 Napa Valley   |     7
 Palisade      |     2
 Sonoma Valley |     2

-- TODO #3: the region that has the most wines in the collection 
SELECT C."desc" AS region, COUNT(*) AS wines FROM Wines A INNER JOIN Wineries B ON A.winery = B.id INNER JOIN Regions C ON B.region = C.id GROUP BY (C."desc") ORDER BY wines DESC LIMIT 1;

   region    | wines 
-------------+-------
 Napa Valley |     7

-- TODO #4: an alphabetical list of all wines in the collection 
SELECT * FROM Wines ORDER BY name; 

 winery | number |             name             | type | price  
--------+--------+------------------------------+------+--------
    202 |    333 | 2019 Domaine Carneros Estate |    3 |  50.00
    202 |    222 | 2020 Avant-Garde Pinot Noir  |    3 | 800.00
    303 |    987 | Cabernet Sauvignon           |    2 | 100.00
    505 |    765 | Cabernet Sauvignon 2018      |    2 | 123.00
    606 |    345 | Greystone Cabernet Sauvignon |    2 |  47.00
    606 |    234 | Greystone Merlot             |    4 | 245.00
    101 |    345 | Merlot V18                   |    4 | 150.00
    101 |    456 | Merlot V19                   |    4 | 170.00
    101 |    567 | Monte Rosso V16              |    5 | 250.00
    505 |    876 | Pinot Noir                   |    3 | 175.00
    101 |    234 | Sauvignon Blanc V20          |    1 | 100.00

-- TODO #5: an alphabetical list of the wineries that sell 'Merlot' wines 
SELECT DISTINCT B.name FROM Wines A INNER JOIN Wineries B ON A.winery = B.id INNER JOIN WineTypes C ON A.type = C.id WHERE C.name = 'Merlot' ORDER BY 1;

          name           
-------------------------
 Graystone Winery
 Louis M. Martini Winery

-- TODO #6: the average price of wines in the collection 
SELECT AVG(price) FROM Wines;

         avg          
----------------------
 200.9090909090909091

-- TODO #7: the name of the winery that has the most expensive wine in the collection 
SELECT B.name FROM Wines A INNER JOIN Wineries B ON A.winery = B.id ORDER BY price DESC LIMIT 1;

       name       
------------------
 Domaine Carneros

-- TODO #8: the wine type name that has the highest average rating in the collection 
SELECT A.name, AVG(B.rating) FROM WineTypes A INNER JOIN CustomerPreferences B ON A.id = B.type GROUP BY A.name ORDER BY 2 DESC LIMIT 1;

  name  |        avg         
--------+--------------------
 Malbec | 5.0000000000000000
 
-- TODO #9: the name of the customer that bought most wines so far
SELECT A.name, SUM(qtt) AS purchases FROM Customers A INNER JOIN Purchases B ON A.email = B.email GROUP BY A.name ORDER BY 2 DESC LIMIT 1;

      name       | purchases 
-----------------+-----------
 Magica De Spell |        50

-- TODO #10: the number of wines sold per month in the year 2022 ordered by month
SELECT EXTRACT(MONTH FROM date) AS "month (2022)", SUM(qtt) AS "sales" FROM Purchases WHERE EXTRACT(YEAR FROM date) = 2022 GROUP BY "month (2022)" ORDER BY 1;

 month (2022) | sales 
--------------+-------
            1 |     1
            2 |     3
            3 |    50

-- TODO #11: an alphabetical list of customers
SELECT name from Customers ORDER BY 1;

      name       
-----------------
 Daisy
 Donald
 Magica De Spell
 Scrooge

-- TODO #12: the total number of regions in the collection 
SELECT COUNT(*) FROM Regions;

 count 
-------
     3

-- TODO #13: the total number of wineries in California
SELECT COUNT(*) FROM Wineries WHERE state = 'CA';

 count 
-------
     5

-- TODO #14: the name(s) of the customer(s) that never bought a wine in alphabetical order
SELECT A.name FROM Customers A LEFT JOIN Purchases B ON A.email = B.email WHERE B.email IS NULL;

 name  
-------
 Daisy

-- TODO #15: the name(s) of the wine(s) that were never bought in alphabetical order
SELECT A.name FROM Wines A LEFT JOIN Purchases B ON A.winery = B.winery AND A.number = B.number WHERE B.email IS NULL ORDER BY 1;

             name             
------------------------------
 2020 Avant-Garde Pinot Noir
 Cabernet Sauvignon
 Cabernet Sauvignon 2018
 Greystone Cabernet Sauvignon
 Merlot V18
 Merlot V19
 Monte Rosso V16
 Pinot Noir

-- TODO #16: the name(s) of the winery(ies) that do not currently have a wine in the colllection (also in alphabetical order)
SELECT A.name FROM Wineries A LEFT JOIN Wines B ON A.id = B.winery WHERE B.winery IS NULL;

              name               
---------------------------------
 Gloria Ferrer Caves & Vineyards

-- TODO #17: an alphabetical list of all wine types  
SELECT name FROM WineTypes ORDER BY 1;

        name        
--------------------
 Cabernet Sauvignon
 Malbec
 Merlot
 Pinot Noir
 Sauvignon Blanc

-- TODO #18: a list of winery region descriptions followed by the name of wineries in the region, their wine types, and wine names in alphabetical order of regions, wineries, wines types and names
SELECT A."desc" AS "region", B.name AS "winery", D.name AS "type", C.name AS "name" FROM Regions A JOIN Wineries B ON A.id = B.region JOIN Wines C ON B.id = C.winery JOIN WineTypes D ON C.type = D.id ORDER BY 1, 2, 3, 4;

    region     |         winery          |        type        |             name             
---------------+-------------------------+--------------------+------------------------------
 Napa Valley   | Domaine Carneros        | Pinot Noir         | 2019 Domaine Carneros Estate
 Napa Valley   | Domaine Carneros        | Pinot Noir         | 2020 Avant-Garde Pinot Noir
 Napa Valley   | Louis M. Martini Winery | Malbec             | Monte Rosso V16
 Napa Valley   | Louis M. Martini Winery | Merlot             | Merlot V18
 Napa Valley   | Louis M. Martini Winery | Merlot             | Merlot V19
 Napa Valley   | Louis M. Martini Winery | Sauvignon Blanc    | Sauvignon Blanc V20
 Napa Valley   | Pine Ridge Vineyards    | Cabernet Sauvignon | Cabernet Sauvignon
 Palisade      | Graystone Winery        | Cabernet Sauvignon | Greystone Cabernet Sauvignon
 Palisade      | Graystone Winery        | Merlot             | Greystone Merlot
 Sonoma Valley | Buena Vista Winery      | Cabernet Sauvignon | Cabernet Sauvignon 2018
 Sonoma Valley | Buena Vista Winery      | Pinot Noir         | Pinot Noir

-- TODO #19: the name of the wine(s) that have 'Sauvignon' in their names 
SELECT name FROM Wines WHERE name LIKE '%Sauvignon%';

             name             
------------------------------
 Sauvignon Blanc V20
 Cabernet Sauvignon
 Cabernet Sauvignon 2018
 Greystone Cabernet Sauvignon

-- TODO #20: the total number of 'Merlot' type of wines in the collection
SELECT COUNT(*) FROM Wines A INNER JOIN WineTypes B ON A.type = B.id WHERE B.name = 'Merlot';

 count 
-------
     3