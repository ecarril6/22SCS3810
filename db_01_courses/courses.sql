-- courses database - database to allow students to query information about course scheduling
-- TODO: add a comment section with the names of the team members of the project (limited to 2). You are allowed to work solo as well. 
-- created at: <March 8, 2022>
-- author: <Emily Carrillo-Ramirez>

-- TODO: create the courses database
CREATE DATABASE courses;

-- TODO: "open" the database for use
\c courses;

-- TODO: (optional) drop all tables
DROP TABLE IF EXISTS Instructors, Courses, Sections;

-- TODO: create table instructors
CREATE TABLE Instructors(
  email VARCHAR(80) PRIMARY KEY,
  name VARCHAR(80) NOT NULL,
  title VARCHAR(80),
  office VARCHAR(20),
  hours VARCHAR(90)
 );

-- TODO: create table courses
CREATE TABLE Courses (
  prefix VARCHAR(3),
  "number" CHAR(4),
  title VARCHAR(60) NOT NULL,
  description VARCHAR(2000) NOT NULL,
  credits SMALLINT NOT NULL,
  prereqs VARCHAR(300),
  PRIMARY KEY (prefix,"number")
  
  );
-- TODO: create table sections
CREATE TABLE Sections(
  crn CHAR(5) PRIMARY KEY,
  prefix VARCHAR(3),
  "number" CHAR(4),
  section CHAR(3) NOT NULL,
  semester VARCHAR(10) NOT NULL,
  "year" SMALLINT NOT NULL,

  instructor VARCHAR(270),
  "times" VARCHAR(80),
  start DATE,
  "end" DATE,
  location VARCHAR(60),
  campus VARCHAR(10),

  FOREIGN KEY (prefix, "number") REFERENCES Courses (prefix, "number"),
  FOREIGN KEY (instructor) REFERENCES Instructors (email)
  );

-- TODO: manually insert a few instructors
    INSERT INTO Instructors (email, name, title, office, hours) VALUES
  ( 'cohenb@msudenver.edu','Cohen,Blanche','Adjunct Instructor','',''),
  ( 'fzengmsudenver.edu','Zeng, Fanyu','Adjunct Instructor','',''),
  ( 'aibrahi8@msudenver.edu','Ibrahim,Adil','Adjunct Instructor','',''),
  ( 'rranjidh@msudenver.edu','Rajan,Ranjidha','Lecturer','',''),
  ( 'fjiang@msudenver.edu','Jiang,Feng','Affiliate/Cybersecurity Coordinator and Assistant Professor','AES-200U','M 06:00pm-07:00pm,T 06:00pm-07:00pm,W 06:00pm-07:00pm,R 06:00pm-07:00pm,F 06:00pm-07:00pm'),
  ( 'tle61@msudenver.edu','Le,ThienNgo','Lecturer','',''),
  ( 'geinitz@msudenver.edu','Geinitz,Steven','Assistant Professor','',''),
  ( 'pauljod@msudenver.edu','Paul,Jody','Professor','AES-200Q','M 01:00pm-03:00pm, W 08:00am-11:00am'),
  ( 'wzhu1@msudenver.edu','Zhu,Weiying','Associate Chair and Professor','',''),
  ( 'tmota@msudenver.edu','Mota,Thyago Lisboa','Assistant Professor','AES-200R','M 01:00pm-03:00pm, W 08:00am-11:00am'),
  ( 'codd@msudenver.edu','Codd,Edgar','','',''),
  ( 'beatys@msudenver.edu','Beaty,Steven','CS Chair and Professor','',''
  );
  
-- TODO: manually insert a few courses (19 courses)
INSERT INTO Courses (prefix, "number", title, description, credits, prereqs) VALUES
  ( 'CS','1030','Computer Science Principles','Computer Science Principles introduces students to the central ideas of computer science vital for success in today''s world. Students are invited to develop the computational thinking skills that apply across disciplines, as we explore computing from multiple perspectives, including: cognitive, economic, ethical, legal, mathematical, philosophical, social, and technical. The course integrates computational thinking practices with big ideas in computing to address: collaborative teamwork, communication, creativity, critical thinking, innovation, problem solving, and programming. Students are afforded the opportunity to participate in active-learning experiences and to create computational artifacts that bring ideas to life.',4,''),
  ( 'CS','1050','Computer Science 1','This is the first course in the computer science core sequence. Students learn a modern programming language and the basic skills needed to analyze problems and construct programs for their solutions. The emphasis of the course is on the techniques of algorithm development, correctness, and programming style. Students are also introduced to the fundamentals of software engineering and the software-development life cycle.',4,'CS 1030 or readiness for MTH 1110 with a grade of "C-" or better.'),
  ( 'CS','1400','Computer Organization 1',' In this course, students will study the internal organization, characteristics, performance and interactions of a computer system''s functional components. Binary codes and binary arithmetic, digital logic, central processor organization, instruction set architecture, input/output fundamentals, and memory architecture are covered.',4,'An intermediate algebra course or one and one-half years of secondary school algebra or equivalent and appropriate score on the mathematics pre-assessment placement test or higher-level math course with a grade of "C-" or better.'),
  ( 'CS','2050','Computer Science 2','This course, a continuation of CS 1050, further emphasizes the concepts of the software development cycle and introduces the concept of an abstract data type (ADT). The topics covered include linked-lists, trees, stacks, queues, classes, recursion, and a variety of data representation methods. Further topics in software engineering and programming style as well as algorithms for sorting and searching are included.',4,'CS 1050 and MTH 1110 (or equivalent) with a grade of "C-" or better, or permission of instructor.'),
  ( 'CS','2240','Discrete Structures for CS','This course provides a solid theoretical foundation for the understanding of computer science, with emphasis on the application of formal structures and reasoning to problems in computer science. The course introduces and demonstrates application of discrete mathematics concepts commonly used in computer science and needed to solve many computational problems. Topics include formal logic systems, Boolean algebra, techniques for formal reasoning (including proof methods), set theory, graph theory, functions, relations, sequences, and recursive structures.',4,'CS 2050 and either (MTH 1400 or equivalent) or (MTH 1120 and (MTH 1110 or equivalent)) all with grades of "C-" or better; or permission of instructor'),
  ( 'CS','2400','Computer Organization 2','The course presents the functional organization of computers, multicore and multithreaded processors, high-performance storage, multiprocessor and multicomputer parallel architectures, and error detecting/correcting codes. Students learn assembly language programming and create software using a contemporary development environment.',4,'CS 1050, CS 1400, and MTH 1110 (or equivalent), each with a grade of "C-" or better, or permission of instructor)'),
  ( 'CS','3120','Machine Learning','Machine learning is the ability of computers to learn without explicitly programming an algorithm. Machine learning techniques learn about hyper-dimensional spaces with either explicit direction or implicit reinforcement. This course covers a variety of machine learning techniques and their application to actual data. Topics include the clustering of data and the retrieval of related data, the use of machine learning for recommender systems, and the creation of deep learning systems. This course includes both the underlying theory of machine learning and the creation of machine learning software for real-world problems.',4,'CS 2050 or MTH 2520, MTH 2140 or MTH 3130 or MTH 3140, and MTH 3210, each with C- or better, or permission of instructor.'),
  ( 'CS','3210','Principles of Prog. Languages','This course traces the evolution of programming languages and identifies and analyzes the contributions made by several significant languages and their successors. Specific issues of programming language implementation such as creation of activation records for block structured languages and static and dynamic scoping as methods for defining program object visibility are studied in depth. All four of the modern programming language paradigms (procedural, functional, object-oriented, and logical) are studied.',4,'CS 2050, CS 2400, CS 3240, CS 3250, and MTH 3170, all with a grade of "C-" or better, or permission of instructor '),
  ( 'CS','3240','Intro to Theory of Computation','This course explores language theory and computability. Language theory includes: regular expressions, regular languages, and finite automata (deterministic and nondeterministic); context-free languages and pushdown automata; and language grammars. Computability includes: Tuning machines and their computing power; unsolvable problems; and intractable problems (NP-Completeness). Note: Credit will be granted for only one prefix: CS or HON.',2,'CS 2050 and MTH 3170 with grades of "C-" or better, or permission of instructor) (HON 3240)'),
  ( 'CS','3250','SW Dev Methods and Tools','This course introduces the basics of large-scale software development. As software size increases. so does the need to use appropriate tools and development techniques. The phases of traditional software development and several current software development lifecycles are introduced. the use of object-oriented techniques for large projects is covered. Creating appropriate and sufficient tests for test-driven and behavior-driven development is discussed. Students learn how to analyze their programs to detect errors and increase performance. The various types of automation used in creating a product are introduced. Students learn about group dynamics and work on a significant project in groups.',4,'CS 2050, ENG 1020, and CAS 1010 with a grade of "C-" or better.'),
  ( 'CS','3350','Free and Open Source Software','This course delves into the FOSS movements addressing: advantages and disadvantages of open source; open source licensing models; collaborative public development; common and best practices; and, how to contribute to FOSS projects. During the course, students actively investigate, engage with, and have guided opportunities to contribute to established FOSS projects.',4,' CS 3250'),
  ( 'CS','3600','Operating Systems','This course provides an introduction to modern computer operating systems, their use, design, development, and implementation. Topics covered include: operating system modes, structuring methods, process and thread scheduling and dispatch, concurrency, inter-process communication, memory management, file system organization (in both stand-alone and networked environments), and system security. Students are required to write programs that implement some operating system functions.',4,'CS 2050, CS 2400, and CS 3250, all with grades of "C-" or better; or permission of instructor'),
  ( 'CS','3700','Computer Networks','This course provides a comprehensive study of computer networks, from the physical aspects to the high-level application protocols with which most people interact. The software that provides the communication is emphasized. The methods for creating connections, making sure they are error free and in order, performing routing, and creating client/server interactions are discussed.',4,'CS 1400 and CS 2050 each with a grade of C- or better or Permission of Instructor'),
  ( 'CS','3810','Principles of Database Systems','This course covers the principles and methodologies of database design, and techniques for database application development. The topics covered include relational algebra, SQL queries, normalization, entity-relationship model, SQL/Host-language interface, stored procedure, object-oriented databases, and semi-structured databases.',4,'CS 2050 and MTH 1410 with grades of "C-" or better, or permission of instructor'),
  ( 'CS','39AC','Concurrent Programming','Concurrent programming is central to much of computing these days. With multi-core, GPU-based, container-based, and cloud computing, programmers must deal effectively with the complexity inherent in managing cooperating threads of execution. Traditional languages and paradigms make this very difficult. The use of functional instead of imperative languages helps mitigate the complexities of concurrent programming, allowing the scaling and concomitant performance increases necessary for today''s demanding applications. In this class, you will learn how to effectively program for concurrent environments.',4,'CS 3250 with a grade "C-" or above'),
  ( 'CS','4050','Algorithms & Algorithm Analysis','The emphasis of this course is on the design, analysis, and evaluation of efficient algorithms for a wide variety of computing problems.',4,'CS 3240, CS 3250, and 4 additional credits of upper division CS courses all with grades of "C-" or better, or permission of instructor.'),
  ( 'CS','4360','Technical Software Project','This course provides an experience in working on a software development project that requires technical knowledge. Students work in teams of 3 or 4 to identify a problem, design a solution to that problem, and implement that solution. The solution must involve creating software and may involve also creating hardware.',4,'Senior standing and CS 3210, CS 3600, 8 additional credits of upper-division CS courses, JMP 2610, PHI 3370, and COMM 1010, all with grades of "C-"or better, or permission of instructor'),
  ( 'CS','49BV','API Development and Testing','This course will cover the fundamentals of API (Application Programming Interface) development and testing, including RESTful architecture principles, data exchange formats, best practices for REST API design and implementation, authentication, rate limit strategies/techniques, documentation, test, and deploy.',4,'CS 2050 and CS 3250 with a grade "C-" or above; or permission of instructor '),
  ( 'CS','49BW','SMEs for CS Projects','This course delves into the roles and responsibilities of a subject-matter expert (SME) as they advise computer-science-based decisions. The SME project success at every step from identifying and analyzing potential projects to making sure that the final project product meets the requirements. The SME is responsible for gathering input, analyzing the needs of the project, documenting the criteria to be met and sharing information among project team members, and presenting findings to the company executives. We will investigate some test cases and explore more about the role of SME in an organization.',2,'Permission of Instructor '
  );

-- TODO: manually insert a few sections
    INSERT INTO Sections (crn, prefix, "number",section, semester, "year", instructor, "times", start, "end", location, campus) VALUES
  ('31998','CS','1030','001','Spring',2022,'cohenb@msudenver.edu','TR 12:00pm-01:50pm','2022-01-18','2022-05-14','AES-285','Main'),
  ('31999','CS','1030','002','Spring',2022,'cohenb@msudenver.edu','MW 12:00pm-01:50pm','2022-01-18','2022-05-14','AES-285','Main'),
  ('32000','CS','1030','003','Spring',2022,'cohenb@msudenver.edu','MW 04:00pm-05:50pm','2022-01-18','2022-05-14','AES-285','Main'),
  ('32380','CS','1030','004','Spring',2022,'fzeng@msudenver.edu','TR 06:00pm-07:50pm','2022-01-18','2022-05-14','','Online'),
  ('30640','CS','1050','001','Spring',2022,'aibrahi8@msudenver.edu','MW 10:00am-11:50am', '2022-01-18', '2022-05-14','AES-285','Main'),
  ('30641','CS','1050','002','Spring',2022,'rranjidh@msudenver.edu','MW 12:00pm-01:50pm', '2022-01-18', '2022-05-14','AES-220','Main'),
  ('30783','CS','1050','003','Spring',2022,'fzeng@msudenver.edu','MW 06:00pm-07:50pm', '2022-01-18', '2022-05-14','','Online'),
  ('34662','CS','1050','004','Spring',2022,'cohenb@msudenver.edu','TR 10:00am-11:50am', '2022-01-18', '2022-05-14','AES-285','Main'),
  ('31296','CS','1400','001','Spring',2022,'fjiang@msudenver.edu','TR 12:00pm-01:50pm', '2022-01-18', '2022-05-14','AES-210','Main'),
  ('34663','CS','1400','002','Spring',2022,'rranjidh@msudenver.edu','MW 04:00pm-05:50pm', '2022-01-18', '2022-05-14','AES-210','Main'),
  ('30643','CS','2050','001','Spring',2022,'aibrahi8@msudenver.edu','TR 02:00pm-03:50pm', '2022-01-18', '2022-05-14','AES-210','Main'),
  ('30644','CS','2050','002','Spring',2022,'tle61@msudenver.edu','MW 06:00pm-07:50pm', '2022-01-18', '2022-05-14','AES-210','Main'),
  ('34664','CS','2050','003','Spring',2022,'aibrahi8@msudenver.edu','MW 02:00pm-03:50pm', '2022-01-18', '2022-05-14','AES-285','Main'),
  ('34665','CS','2240','001','Spring',2022,'tle61@msudenver.edu','TR 02:00pm-03:50pm', '2022-01-18', '2022-05-14','AES-207','Main'),
  ('30645','CS','2400','001','Spring',2022,'rranjidh@msudenver.edu','TR 04:00pm-05:50pm', '2022-01-18', '2022-05-14','AES-210','Main'),
  ('31107','CS','2400','002','Spring',2022,'wzhu1@msudenver.edu','MW 10:00am-11:50am', '2022-01-18', '2022-05-14','AES-210','Main'),
  ('32378','CS','3120','001','Spring',2022,'fjiang@msudenver.edu','TR 10:00am-11:50am', '2022-01-18', '2022-05-14','AES-210','Main'),
  ('31173','CS','3210','001','Spring',2022,'tle61@msudenver.edu','TR 04:00pm-05:50pm', '2022-01-18', '2022-05-14','AES-220','Main'),
  ('35470','CS','3210','002','Spring',2022,'tle61@msudenver.edu','TR 08:00am-09:50am', '2022-01-18', '2022-05-14','AES-220','Main'),
  ('33773','CS','3250','001','Spring',2022,'aibrahi8@msudenver.edu','TR 04:00pm-05:50pm', '2022-01-18', '2022-03-12','AES-285','Main');
  
-- TODO: the total number of courses (name the count as "total")
SELECT COUNT(*) FROM Courses;
-- TODO: a list of all courses prefix, number, and title, sorted by prefix and then number
SELECT prefix, "number", title FROM Courses ORDER BY prefix, number ASC;
-- TODO: an alphabetical list of all instructors in the database
SELECT name AS "Instructor Names" FROM Instructors ORDER BY 1;
-- TODO: the prefix, number, section, and (course) title of all courses sections in the database, sorted by prefix, number and section
SELECT A.prefix, A."number", B.section, A.title AS "Course Title" FROM Courses A, Sections B WHERE A."number" = B."number" ORDER BY prefix, "number", section;
-- TODO: the prefix, number, the number of sections (named as "sections"), and (course) title of all courses sections in the database, sorted by prefix and number
SELECT prefix, "number", title AS "Course Title", COUNT(section) AS "sections" FROM Courses NATURAL JOIN Sections GROUP BY prefix, "number", title ORDER BY prefix, "number";
-- TODO: an alphabetical list of the instructors that are teaching CS 1050 or CS 2050 (must avoid showing names repeated)
SELECT name AS "Instructor Names" FROM Instructors INNER JOIN Sections ON email = instructor WHERE "number" = '1050' OR "number" = '2050' AND prefix ='CS' GROUP BY name ORDER BY 1; 
-- TODO: show an alphabetical list of instructors followed by the number of sections (named as "sections") that they are teaching, sorted in descending order of "sections"
SELECT A.name AS "Instructor Names", COUNT(B.section) AS "sections" FROM Instructors A, Sections B WHERE email = instructor GROUP BY name ORDER BY "sections" DESC;
-- TODO: same as before, but limit the output to the top 3 instructors based on the number of sections that they are teaching
SELECT A.name AS "Instructor Names", COUNT(B.section) AS "sections" FROM Instructors A, Sections B WHERE email = instructor GROUP BY name ORDER BY "sections" DESC, A.name LIMIT 3;
-- TODO: show an alphabetical list of the instructor(s) that are NOT currently teaching a section this semester 
SELECT A.name AS "Instructor Names" FROM Instructors A, Sections B WHERE A.email NOT IN (SELECT instructor FROM Sections) GROUP BY A.name ORDER BY 1;
-- TODO: show the sections (with the instructor assigned to them) of CS 1050 that are being offered in the spring (2022) on TR 10:00am-11:50am
SELECT A.name AS "Instructor Names", B.section AS "sections" FROM Instructors A, Sections B WHERE email = instructor AND B."number" = '1050' AND B.prefix = 'CS' AND B."year" = '2022' AND B."times" = 'TR 10:00am-11:50am' GROUP BY A.name, B.section;)
