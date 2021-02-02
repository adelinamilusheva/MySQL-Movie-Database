Create database movies;
use movies;

CREATE TABLE movies(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
released_date DATE NOT NULL,
budget DOUBLE NOT NULL,
profit DOUBLE NOT NULL
);

CREATE TABLE spectators(
id INT AUTO_INCREMENT PRIMARY KEY ,
name VARCHAR(255) NOT NULL,
age INT NOT NULL,
premieres INT NOT NULL
);

CREATE TABLE spectate(
id INT AUTO_INCREMENT PRIMARY KEY,
movie_id INT NOT NULL,
spectator_id INT NOT NULL, 
FOREIGN KEY(movie_id) REFERENCES movies(id),
FOREIGN KEY(spectator_id) REFERENCES spectators(id)
);

CREATE TABLE nominations_list(
id INT NOT NULL AUTO_INCREMENT,
nomination_type VARCHAR (255),
PRIMARY KEY(id, nomination_type)
);

CREATE TABLE nominations(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
movie_id INT NOT NULL,
nomination_list_id INT NOT NULL,
FOREIGN KEY (movie_id) REFERENCES movies(id),
FOREIGN KEY (nomination_list_id) REFERENCES nominations_list(id)
);

CREATE TABLE rewards(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nomination_id INT NOT NULL,
FOREIGN KEY (nomination_id) REFERENCES nominations(id)
);

INSERT INTO MOVIES(title, released_date, budget, profit)
VALUES("The Notebook", "2004-06-25", 845565.20,4562780.9),
("The Avengers", "2012-05-01",2398645,8765360.20),
("Titanic", "2019-03-06", 398223.25,403000.231),
("Levels", "2008-06-16",233545.2,456223.34),
("Kill Bill", "2004-06-25",3249555,56783452),
("The Wolf of Wall Street", "2013-12-25",1000234,5345234),
("Fight Club", "1999-11-15",897345,2345123),
("Inception", "2010-06-23", 421345.2,1567834),
("Interstellar", "2014-11-07",5098234,8907345),
("The Shawshank Redemption", "1994-10-14", 1234234,78783452),
("Forest Gump", "1994-06-06",2343455,4231456),
("Pulp Fiction", "1994-10-14", 908765,1212113.20),
("The Dark Knight", "2008-06-25",4259655,86663451),
("Adventures of Michael", "2004-06-25", 2343455,4231456),
("Footlose", "1995-12-11", 243455,567345),
("Dancing under the stars", "1995-06-06", 1343345,5631452),
("Undercover", "2008-04-12",1543675,1999222),
("To the moon", "2010-12-16", 1444231,1234256),
("tekken", "2008-10-02",9908762,1345234),
("Forever young", "2012-05-01",123452,500567);

INSERT INTO SPECTATORS(name,age,premieres)
VALUES("Ivan Petrov Petrov", 23,7),
("Maria Georgieva Ivanova", 42, 3),
("Todor Ivanov Petkov", 15, 4),
("Valeria Mitkova Stoqnova", 25, 5),
("Petrana Mironova Aleksieva", 19, 1),
("Milen Ivanov Vasilev", 29, 2),
("Tsvetana Anastaova Ilieva", 32, 1),
("Elena Petrova Petrova", 26, 2),
("Maria Hristova Dimova", 52, 2),
("Ivan Iliev Georgiev", 21, 2),
("Ivo Maksimov Ivanov", 33, 2),
("Maria Dimitrova Dimova", 56, 1),
("Milen Paskov Milenov", 16, 1),
("Roza Vangelova Mitkova", 32, 1),
("Viktor Simov Dimitrov", 32, 2),
("Vasil Kordov Trifonov", 22, 2),
("Manol Toshkov Mitkov", 39, 3),
("Dimitur Jivkov Kostov", 37, 1),
("Boris Stoqnov Petrov", 13, 2);

INSERT INTO spectate(movie_id,spectator_id)
VALUES(1,8),(2,2),(1,1),(11,4),(13,9),(12,6),
(12,4),(17,1),(11,10),(19,15),(8,2),(6,3),(3,6),
(3,4),(2,17),(1,11),(2,1),(13,1),(3,1),(2,7),
(3,3),(3,17),(6,2),(3,8),(13,1),(14,14),(2,12),(12,16),
(17,11),(2,19),(7,3),(2,4),(13,15),(6,18),(6,13),(14,17),
(19,16),(12,9),(6,4),(11,1),(1,3),(10,10),(6,5),(3,19);




INSERT INTO nominations_list(nomination_type)
VALUES ("Best visual effects"),
("Best Movies Songs"),
("Best male actor performance"),
("Best costumes"),
("Best song"),
("Best sad scene"),
(" Best woman actress performance"),
("Best Director"),
("Best Original Song"),
("Original Screenplay"),
("Best Editing"),
("Cinematography"),
("Best villain"),
("Best Male Performance"),
("Best love story"),
("Best Film"),
("Best makeup and hairstyle"),
("Best main role"),
("Best On-Screen Duo"),
("Best sound mixing"),
("Record of the Year"),
("Best Battle Scenes"),
("Best British Actor"),
("Best Dancing Role"),
("Best funny scene"),
("Movie of the century"),
("Most searched movie"),
("Best superhero");

INSERT INTO nominations(movie_id,nomination_list_id)
VALUES (4,1),(4,24),(20,2),(20,3),(20,1),(5,4),(5,5),(5,3),(3,6),
(3,5),(3,1),(1,8),(1,9),(1,10),(1,11),(1,3),(2,1),(2,11),(2,12),
(2,28),(6,7),(6,5),(6,12),(7,8),(7,19),(7,5),(7,3),(7,13),(8,12),
(8,1),(8,15),(9,5),(9,10),(9,17),(11,16),(11,7),(11,18),(10,16),
(10,19),(10,20),(10,21),(12,8),(12,11),(12,12),(19,22),(19,13),(13,11),
(13,22),(13,23),(14,16),(14,7),(16,27),(16,26),(17,26),(17,27),
(17,3),(17,5),(17,2),(18,22),(18,25),(18,27),(18,6),(18,24);


INSERT INTO rewards(nomination_id)
VALUES (1),(4),(6),(7),(9),(12),(13),(18),(20),(21),(28),
(31),(33),(34),(37),(40),(41),(44),(45),(49),(50),(52),
(54),(58),(60),(63);

select movie_id, nomination_type from
rewards join nominations on rewards.nomination_id = nominations.id
join nominations_list on nominations_list.id = nominations.nomination_list_id
order by nomination_type;

SELECT * FROM movies
JOIN nominations ON movies.id = nominations.movie_id;
SELECT id, name, premieres
FROM spectators
WHERE id>3 AND name LIKE 'M%';
 
SELECT released_date,
COUNT(released_date) AS 'Movies with a same release date'
FROM movies
GROUP BY released_date
ORDER BY released_date;

SELECT title, nomination_type as reward
FROM movies
JOIN nominations ON movies.id = nominations.movie_id
JOIN nominations_list ON nominations.nomination_list_id  = nominations_list.id
JOIN rewards ON nominations.id = rewards.nomination_id
ORDER BY movie_id;

select movie_id, nomination_type from
rewards join nominations on rewards.nomination_id = nominations.id
join nominations_list on nominations_list.id = nominations.nomination_list_id
order by nomination_type;


SELECT movies.id,title, released_date, IFNULL(spectator_id, 'No spectator') AS spectator_id
FROM movies
LEFT JOIN spectate ON movies.id = spectate.movie_id
WHERE title like 'A%' OR movies.id = 18
ORDER BY movies.id;

SELECT title, COUNT(spectator_id) as 'Viewers'
FROM movies
LEFT JOIN spectate ON movies.id = spectate.movie_id
GROUP BY movies.id
ORDER BY movies.title;


DROP PROCEDURE IF EXISTS MovieList;
delimiter $
CREATE PROCEDURE MovieList()
BEGIN
DECLARE finished INT;
DECLARE film_id INT;
DECLARE movieCursor cursor for 
SELECT id FROM movies;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;
SET finished = 0;
OPEN movieCursor;
movie_loop: while( finished = 0)
DO
FETCH movieCursor INTO film_id;
 IF(finished = 1)
       THEN 
       LEAVE movie_loop;
       END IF;
IF((SELECT count(spectator_id) from movies LEFT JOIN spectate ON movies.id = spectate.movie_id WHERE movies.id = film_id
GROUP BY movies.id) > 2 AND (SELECT count(nomination_type) AS reward
FROM movies
JOIN nominations ON movies.id = nominations.movie_id
JOIN nominations_list ON nominations.nomination_list_id  = nominations_list.id
JOIN rewards ON nominations.id = rewards.nomination_id
WHERE movies.id = film_id
GROUP BY title
ORDER BY movie_id ) > 1)
THEN 
SELECT CONCAT("'",title, "' released in ",released_date) as Movie FROM movies WHERE id = film_id;
END IF;
END WHILE;
CLOSE movieCursor;
SET finished = 0;
SELECT 'Finished!';
END
$
delimiter ;

call MovieList();











SELECT title,profit FROM movies 
ORDER BY profit DESC
LIMIT 3;

call  topMoviesReward(100000);









SELECT * FROM nominations;
SELECT * FROM rewards;
SELECT * FROM movies;
SELECT * FROM spectators;
SELECT * FROM spectate;
SELECT title, profit FROM movies 
ORDER BY profit DESC
LIMIT 3;