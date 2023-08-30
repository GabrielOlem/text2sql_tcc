SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer;
SELECT name, country, age FROM singer ORDER BY age DESC
SELECT name, country, age FROM singer ORDER BY age DESC
SELECT AVG(age), MIN(age), MAX(age)  FROM singer  WHERE country = 'france'
SELECT AVG(singer.age), MIN(singer.age), MAX(singer.age) FROM singer WHERE singer.country = 'France'
SELECT singer.name, singer.song_release_year FROM singer WHERE singer.age = (SELECT MIN(age) FROM singer)
SELECT song_name, song_release_year FROM singer WHERE age = (SELECT MIN(age) FROM singer)
SELECT DISTINCT country  FROM singer  WHERE age > 20
SELECT DISTINCT country FROM singer WHERE age > 20
SELECT singer.country, COUNT(*) AS number_of_singers FROM singer GROUP BY singer.country;
SELECT country, COUNT(*) AS count FROM singer GROUP BY country;
SELECT singer.song_name  FROM singer  WHERE singer.age > (SELECT AVG(age) FROM singer)
SELECT singer.song_name FROM singer WHERE singer.age > (SELECT AVG(age) FROM singer)
SELECT location, name FROM stadium WHERE capacity BETWEEN 5000 AND 10000;
SELECT location, name  FROM stadium  WHERE capacity BETWEEN 5000 AND 10000
SELECT MAX(capacity), AVG(capacity) FROM stadium
SELECT MAX(capacity), AVG(capacity) FROM stadium
SELECT name, capacity  FROM stadium  WHERE average = (SELECT MAX(average) FROM stadium)
SELECT stadium.name, stadium.capacity FROM stadium WHERE stadium.highest = (SELECT MAX(stadium.average) FROM stadium)
SELECT COUNT(concert_id) FROM concert WHERE year = 2014 OR year = 2015
SELECT COUNT(*)  FROM concert  WHERE year = 2014 OR year = 2015
SELECT stadium.name, COUNT(concert.concert_id) AS num_concerts FROM stadium JOIN concert ON stadium.stadium_id = concert.stadium_id GROUP BY stadium.name
SELECT stadium.name, COUNT(concert.concert_id) AS num_concerts FROM stadium JOIN concert ON stadium.stadium_id = concert.stadium_id GROUP BY stadium.name;
SELECT stadium.name, stadium.capacity FROM stadium JOIN concert ON concert.stadium_id = stadium.stadium_id WHERE concert.year >= 2014 GROUP BY stadium.name, stadium.capacity ORDER BY COUNT(concert.concert_id) DESC LIMIT 1
SELECT stadium.name, stadium.capacity  FROM stadium  INNER JOIN concert ON stadium.stadium_id = concert.stadium_id  WHERE concert.year > 2013  GROUP BY stadium.name, stadium.capacity  HAVING COUNT(*) = (   SELECT MAX(concert_count)    FROM (     SELECT COUNT(*) as concert_count      FROM stadium      INNER JOIN concert ON stadium.stadium_id = concert.stadium_id      WHERE concert.year > 2013      GROUP BY stadium.stadium_id   ) as temp )
SELECT year FROM concert GROUP BY year HAVING COUNT(*) =  (SELECT MAX(count)  FROM  (SELECT year, COUNT(*) as count  FROM concert  GROUP BY year) as counts)
SELECT year FROM concert GROUP BY year HAVING COUNT(*) = (     SELECT MAX(concert_count)     FROM (         SELECT year, COUNT(*) as concert_count         FROM concert         GROUP BY year     ) as subquery )
SELECT stadium.name  FROM stadium  LEFT JOIN concert ON stadium.stadium_id = concert.stadium_id  WHERE concert.concert_id IS NULL
SELECT name  FROM stadium  WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)
SELECT DISTINCT singer.country FROM singer WHERE singer.age > 40 INTERSECT SELECT DISTINCT singer.country FROM singer WHERE singer.age < 30
SELECT name  FROM stadium  WHERE stadium_id NOT IN      (SELECT stadium_id      FROM concert      WHERE year = 2014)
SELECT stadium.name FROM stadium LEFT JOIN concert ON concert.stadium_id = stadium.stadium_id AND concert.year = 2014 WHERE concert.concert_id IS NULL
SELECT concert.concert_name, concert.theme, COUNT(singer_in_concert.singer_id) FROM concert JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id GROUP BY concert.concert_id;
SELECT concert_name, theme, COUNT(singer_id) AS number_of_singers FROM concert JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id GROUP BY concert_name, theme
SELECT singer.name, COUNT(singer_in_concert.concert_id) AS number_of_concerts FROM singer JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id GROUP BY singer.name
SELECT singer.name, COUNT(singer_in_concert.concert_id) AS num_concerts FROM singer JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id GROUP BY singer.name;
SELECT singer.name FROM singer INNER JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id INNER JOIN concert ON concert.concert_id = singer_in_concert.concert_id WHERE concert.year = 2014
SELECT singer.name FROM singer JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id JOIN concert ON concert.concert_id = singer_in_concert.concert_id WHERE concert.year = 2014
SELECT singer.name, singer.country FROM singer WHERE singer.song_name LIKE '%hey%'
SELECT singer.name, singer.country  FROM singer  WHERE EXISTS      (SELECT *       FROM singer_in_concert       INNER JOIN concert ON singer_in_concert.concert_id = concert.concert_id       INNER JOIN singer ON singer_in_concert.singer_id = singer.singer_id       WHERE singer_in_concert.song_name LIKE '%hey%')
SELECT stadium.name, stadium.location FROM stadium JOIN concert ON stadium.stadium_id = concert.stadium_id WHERE concert.year = 2014 AND concert.year = 2015
SELECT name, location FROM stadium WHERE stadium_id IN (     SELECT stadium_id     FROM concert     WHERE year = 2014 ) AND stadium_id IN (     SELECT stadium_id     FROM concert     WHERE year = 2015 )
SELECT COUNT(*) FROM concert  JOIN stadium ON concert.stadium_id = stadium.stadium_id  WHERE stadium.capacity = (SELECT MAX(capacity) FROM stadium)
SELECT COUNT(concert_id)  FROM concert  WHERE stadium_id = (SELECT stadium_id                      FROM stadium                      WHERE capacity = (SELECT MAX(capacity) FROM stadium))
SELECT COUNT(*) FROM pets WHERE weight > 10;
SELECT COUNT(*) FROM has_pet JOIN pets ON has_pet.petid = pets.petid WHERE pets.weight > 10
SELECT weight  FROM pets  WHERE pettype = 'dog'  ORDER BY pet_age ASC  LIMIT 1;
SELECT MIN(p.pet_age) AS youngest_dog_age, p.weight AS youngest_dog_weight FROM pets p WHERE p.pettype = 'dog'
SELECT p.pettype, MAX(p.weight) AS maximum_weight FROM pets p GROUP BY p.pettype
SELECT pets.pettype, MAX(pets.weight) AS max_weight  FROM pets  GROUP BY pets.pettype
SELECT COUNT(has_pet.petid)  FROM has_pet  JOIN student ON has_pet.stuid = student.stuid  JOIN pets ON has_pet.petid = pets.petid  WHERE student.age > 20
SELECT COUNT(*) FROM has_pet INNER JOIN student ON has_pet.stuid = student.stuid INNER JOIN pets ON has_pet.petid = pets.petid WHERE student.age > 20
SELECT COUNT(*) FROM has_pet JOIN pets ON has_pet.petid = pets.petid JOIN student ON has_pet.stuid = student.stuid WHERE pets.pettype = 'dog' AND student.sex = 'f'
SELECT COUNT(*)  FROM has_pet  JOIN pets ON has_pet.petid = pets.petid  JOIN student ON has_pet.stuid = student.stuid  WHERE student.sex = 'female'  AND pets.pettype = 'dog'
SELECT COUNT(DISTINCT pettype) AS distinct_pets FROM  pets
SELECT COUNT(DISTINCT pettype) FROM pets
SELECT student.fname  FROM student  JOIN has_pet ON student.stuid = has_pet.stuid  JOIN pets ON has_pet.petid = pets.petid  WHERE pets.pettype = 'cat' OR pets.pettype = 'dog'
SELECT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype IN ('cat', 'dog')
SELECT student.fname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = 'cat' AND student.stuid IN (     SELECT student.stuid     FROM student     JOIN has_pet ON student.stuid = has_pet.stuid     JOIN pets ON has_pet.petid = pets.petid     WHERE pets.pettype = 'dog' )
SELECT student.fname FROM student WHERE EXISTS(SELECT *              FROM pets              JOIN has_pet ON pets.petid = has_pet.petid              WHERE pets.pettype = 'cat'                AND has_pet.stuid = student.stuid)   AND EXISTS(SELECT *              FROM pets              JOIN has_pet ON pets.petid = has_pet.petid              WHERE pets.pettype = 'dog'                AND has_pet.stuid = student.stuid);
SELECT student.major, student.age FROM student LEFT JOIN has_pet ON student.stuid = has_pet.stuid LEFT JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype <> 'cat' OR pets.pettype IS NULL
SELECT student.major, student.age  FROM student  WHERE student.stuid NOT IN      (SELECT has_pet.stuid      FROM has_pet      INNER JOIN pets ON has_pet.petid = pets.petid      WHERE pets.pettype = 'cat')
SELECT student.stuid FROM student LEFT JOIN has_pet ON student.stuid = has_pet.stuid LEFT JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype <> 'cat' OR pets.pettype IS NULL
SELECT student.stuid FROM student LEFT JOIN has_pet ON student.stuid = has_pet.stuid LEFT JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype <> 'cat' OR pets.pettype IS NULL
SELECT student.fname, student.age  FROM student  INNER JOIN has_pet ON student.stuid = has_pet.stuid  INNER JOIN pets ON has_pet.petid = pets.petid  WHERE pets.pettype = 'dog'  AND has_pet.petid NOT IN (SELECT petid FROM pets WHERE pettype = 'cat')
SELECT student.fname  FROM student  JOIN has_pet ON student.stuid = has_pet.stuid  JOIN pets ON has_pet.petid = pets.petid  WHERE pets.pettype = 'dog'  AND stuid NOT IN (SELECT has_pet.stuid                    FROM has_pet                    JOIN pets ON has_pet.petid = pets.petid                    WHERE pets.pettype = 'cat')
SELECT pettype, weight FROM pets WHERE pet_age = (   SELECT MIN(pet_age)   FROM pets )
SELECT pettype, weight FROM pets WHERE pet_age = (SELECT MIN(pet_age) FROM pets)
SELECT pets.petid, pets.weight  FROM pets  WHERE pets.pet_age > 1
SELECT pets.petid, pets.weight  FROM pets  WHERE pets.pet_age > 1;
SELECT pets.pettype, AVG(pets.pet_age) AS average_age, MAX(pets.pet_age) AS maximum_age FROM pets GROUP BY pets.pettype
SELECT pets.pettype, AVG(pets.pet_age), MAX(pets.pet_age)  FROM pets  GROUP BY pets.pettype
SELECT pettype, AVG(weight) AS average_weight FROM pets GROUP BY pettype
SELECT pettype, AVG(weight)  FROM pets  GROUP BY pettype
SELECT student.fname, student.age FROM student INNER JOIN has_pet ON student.stuid = has_pet.stuid INNER JOIN pets ON has_pet.petid = pets.petid
SELECT student.fname, student.age FROM student INNER JOIN has_pet ON student.stuid = has_pet.stuid INNER JOIN pets ON has_pet.petid = pets.petid
SELECT pets.petid FROM pets JOIN has_pet ON pets.petid = has_pet.petid JOIN student ON has_pet.stuid = student.stuid WHERE student.lname = 'smith'
SELECT pets.petid FROM pets JOIN has_pet ON pets.petid = has_pet.petid JOIN student ON has_pet.stuid = student.stuid WHERE student.lname = 'smith'
SELECT student.stuid, COUNT(*) AS num_pets FROM student JOIN has_pet ON student.stuid = has_pet.stuid GROUP BY student.stuid
SELECT student.stuid, COUNT(pets.petid) AS num_pets  FROM student  INNER JOIN has_pet ON student.stuid = has_pet.stuid  INNER JOIN pets ON has_pet.petid = pets.petid  GROUP BY student.stuid
SELECT student.fname, student.sex FROM student WHERE student.stuid IN (     SELECT has_pet.stuid     FROM has_pet     GROUP BY has_pet.stuid     HAVING COUNT(has_pet.petid) > 1 );
SELECT student.fname, student.sex  FROM student  INNER JOIN has_pet ON student.stuid = has_pet.stuid  GROUP BY student.stuid  HAVING COUNT(has_pet.petid) > 1
SELECT student.lname FROM student INNER JOIN has_pet ON student.stuid = has_pet.stuid INNER JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = 'cat' AND pets.pet_age = 3
SELECT student.lname FROM student JOIN has_pet ON student.stuid = has_pet.stuid JOIN pets ON has_pet.petid = pets.petid WHERE pets.pettype = 'cat' AND pets.pet_age = 3 LIMIT 1;
SELECT AVG(student.age) FROM student WHERE student.stuid NOT IN (     SELECT has_pet.stuid     FROM has_pet )
SELECT AVG(student.age)  FROM student  WHERE student.stuid NOT IN (SELECT has_pet.stuid FROM has_pet)
SELECT COUNT(*) FROM continents;
SELECT COUNT(*) FROM continents
SELECT continents.contid, continents.continent, COUNT(countries.countryid) AS num_countries FROM continents INNER JOIN countries ON continents.contid = countries.continent GROUP BY continents.contid, continents.continent ORDER BY continents.contid ASC
SELECT continents.contid, continents.continent, COUNT(countries.countryid) AS num_countries FROM continents JOIN countries ON continents.contid = countries.continent GROUP BY continents.contid, continents.continent;
SELECT COUNT(countryname) FROM countries
SELECT COUNT(*) FROM countries
SELECT car_makers.fullname, car_makers.id, COUNT(model_list.modelid) AS num_models FROM car_makers INNER JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.fullname, car_makers.id
SELECT car_makers.id, car_makers.fullname, COUNT(model_list.modelid) AS num_models  FROM car_makers  JOIN model_list ON car_makers.id = model_list.maker  GROUP BY car_makers.id, car_makers.fullname
SELECT car_names.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cars_data.horsepower = (SELECT MIN(horsepower) FROM cars_data)
SELECT car_names.model FROM cars_data INNER JOIN car_names ON cars_data.id = car_names.makeid WHERE cars_data.horsepower = (SELECT MIN(horsepower) FROM cars_data)
SELECT car_names.model FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.weight < (SELECT AVG(weight) FROM cars_data)
SELECT model FROM cars_data WHERE weight < (SELECT AVG(weight) FROM cars_data)
SELECT car_makers.fullname FROM car_makers INNER JOIN cars_data ON cars_data.id = car_makers.id WHERE cars_data.year = 1970
SELECT car_makers.maker FROM car_makers JOIN cars_data ON car_makers.id = cars_data.id WHERE cars_data.year = 1970
SELECT car_makers.maker, cars_data.year FROM car_makers JOIN model_list ON car_makers.id = model_list.maker JOIN car_names ON model_list.model = car_names.model JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.year = (SELECT MIN(year) FROM cars_data)
SELECT car_makers.maker, MIN(cars_data.year) FROM car_makers JOIN car_names ON car_makers.id = car_names.makeid JOIN cars_data ON car_names.model = cars_data.id GROUP BY car_makers.maker ORDER BY MIN(cars_data.year) LIMIT 1;
SELECT DISTINCT car_names.model FROM car_names JOIN model_list ON car_names.model = model_list.model JOIN car_makers ON model_list.maker = car_makers.id JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.year > 1980
SELECT DISTINCT car_names.model FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.year > 1980
SELECT continents.continent, COUNT(car_makers.id) AS count_car_makers FROM car_makers  JOIN countries ON car_makers.country = countries.countryid  JOIN continents ON countries.continent = continents.contid  GROUP BY continents.continent
SELECT continents.continent, COUNT(car_makers.id) as car_maker_count  FROM continents  LEFT JOIN countries ON continents.contid = countries.continent  LEFT JOIN car_makers ON countries.countryid = car_makers.country  GROUP BY continents.continent
SELECT countryname FROM countries WHERE countryid IN (   SELECT country   FROM car_makers   GROUP BY country   HAVING COUNT(id) = (     SELECT MAX(num_makers)     FROM (       SELECT country, COUNT(id) AS num_makers       FROM car_makers       GROUP BY country     ) AS subquery   ) )
SELECT countryname FROM countries WHERE countryid = (     SELECT country     FROM car_makers     GROUP BY country     HAVING COUNT(id) = (         SELECT COUNT(id)         FROM car_makers         GROUP BY country         ORDER BY COUNT(id) DESC         LIMIT 1     ) )
SELECT COUNT(car_names.model) AS car_model_count, car_makers.fullname AS car_maker_fullname FROM car_makers JOIN model_list ON car_makers.id = model_list.maker JOIN car_names ON model_list.model = car_names.model GROUP BY car_makers.fullname
SELECT car_makers.id, car_makers.fullname, COUNT(model_list.modelid) AS number_of_car_models FROM car_makers JOIN model_list ON model_list.maker = car_makers.id GROUP BY car_makers.id, car_makers.fullname
SELECT cars_data.accelerate  FROM cars_data  JOIN car_names ON cars_data.id = car_names.makeid  JOIN model_list ON car_names.model = model_list.model  JOIN car_makers ON model_list.maker = car_makers.id  WHERE car_makers.maker = 'amc'  AND model_list.model = 'hornet sportabout (sw)'
SELECT accelerate  FROM cars_data  JOIN car_names ON cars_data.id = car_names.makeid  JOIN model_list ON car_names.model = model_list.model  JOIN car_makers ON model_list.maker = car_makers.id  WHERE car_names.model = 'amc hornet sportabout (sw)'
SELECT COUNT(*) FROM car_makers  JOIN countries ON car_makers.country = countries.countryid  WHERE countries.countryname = 'france'
SELECT COUNT(DISTINCT car_makers.id) FROM car_makers JOIN countries ON car_makers.country = countries.countryid WHERE countries.countryname = 'France'
SELECT COUNT(*)  FROM car_names  JOIN model_list ON car_names.model = model_list.modelid  JOIN car_makers ON model_list.maker = car_makers.id  JOIN countries ON car_makers.country = countries.countryid  WHERE countries.countryname = 'usa'
SELECT COUNT(*) FROM car_names  JOIN model_list ON car_names.model = model_list.model  JOIN car_makers ON model_list.maker = car_makers.id  JOIN countries ON car_makers.country = countries.countryid  WHERE countries.countryname = 'united states'
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4;
SELECT AVG(mpg) FROM cars_data WHERE cylinders = 4
SELECT MIN(weight)  FROM cars_data WHERE year = 1974 AND cylinders = 8
SELECT MIN(weight) FROM cars_data WHERE cylinders = 8 AND year = 1974
SELECT car_makers.maker, model_list.model FROM car_makers JOIN model_list ON car_makers.id = model_list.maker JOIN car_names ON model_list.model = car_names.model
SELECT car_makers.maker, model_list.model FROM car_makers JOIN model_list ON model_list.maker = car_makers.id
SELECT DISTINCT cm.id, cm.maker, c.countryname FROM car_makers cm JOIN countries c ON cm.country = c.countryid WHERE EXISTS (   SELECT 1   FROM car_makers cm2   WHERE cm2.country = c.countryid ) ORDER BY c.countryname;
SELECT countries.countryname, countries.countryid FROM countries WHERE countries.countryid IN (SELECT car_makers.country                               FROM car_makers)
SELECT COUNT(*)  FROM cars_data  WHERE horsepower > 150
SELECT COUNT(*) FROM cars_data WHERE horsepower > 150;
SELECT year, AVG(weight) AS average_weight FROM cars_data GROUP BY year
SELECT year, AVG(weight) AS average_weight, AVG(year) AS average_year FROM cars_data GROUP BY year
SELECT countryname  FROM countries  JOIN continents ON countries.continent = continents.contid  JOIN car_makers ON car_makers.country = countries.countryid  GROUP BY countries.countryname, continents.continent  HAVING COUNT(car_makers.id) >= 3  AND continents.continent = 'Europe'
SELECT countryname FROM countries WHERE continent = (SELECT contid FROM continents WHERE continent = "Europe") GROUP BY countryname HAVING COUNT(DISTINCT maker) >= 3;
SELECT MAX(cars_data.horsepower), car_makers.maker FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid JOIN model_list ON car_names.model = model_list.model JOIN car_makers ON model_list.maker = car_makers.id WHERE cars_data.cylinders = 3;
SELECT MAX(horsepower) AS largest_horsepower, maker FROM cars_data AS cd JOIN car_names AS cn ON cd.id = cn.makeid JOIN model_list AS ml ON cn.model = ml.model JOIN car_makers AS cm ON ml.maker = cm.id WHERE cd.cylinders = 3 GROUP BY maker ORDER BY largest_horsepower DESC LIMIT 1;
SELECT car_names.model  FROM car_names  JOIN cars_data ON car_names.makeid = cars_data.id  ORDER BY cars_data.mpg DESC  LIMIT 1
SELECT MAX(cars_data.mpg) FROM cars_data
SELECT AVG(horsepower)  FROM cars_data  WHERE year < 1980
SELECT AVG(horsepower) FROM cars_data WHERE year < 1980
SELECT AVG(edispl)  FROM cars_data cd JOIN car_names cn ON cd.id = cn.makeid JOIN model_list ml ON cn.model = ml.modelid JOIN car_makers cm ON ml.maker = cm.id WHERE cm.maker = 'volvo'
SELECT AVG(edispl) FROM cars_data  JOIN car_names ON cars_data.id = car_names.makeid  JOIN model_list ON car_names.model = model_list.model  JOIN car_makers ON model_list.maker = car_makers.id  WHERE car_makers.maker = 'volvo'
SELECT cylinders, MAX(accelerate) FROM cars_data GROUP BY cylinders
SELECT MAX(cars_data.accelerate) FROM cars_data GROUP BY cars_data.cylinders
SELECT car_names.model, COUNT(car_names.makeid) AS version  FROM car_names  GROUP BY car_names.model  ORDER BY version DESC  LIMIT 1;
SELECT car_names.model, COUNT(DISTINCT car_names.makeid) AS num_versions FROM car_names GROUP BY car_names.model ORDER BY num_versions DESC LIMIT 1;
SELECT COUNT(*) FROM cars_data WHERE cylinders > 4
SELECT COUNT(*)  FROM cars_data WHERE cylinders > 4;
SELECT COUNT(*) FROM cars_data WHERE year = 1980
SELECT COUNT(*) FROM cars_data WHERE year = 1980
SELECT COUNT(*) FROM car_makers AS cm JOIN model_list AS ml ON ml.maker = cm.id WHERE cm.fullname = 'American Motor Company'
SELECT COUNT(*)  FROM model_list  WHERE maker = (SELECT id                 FROM car_makers                 WHERE maker = 'american motor company')
SELECT car_makers.fullname, car_makers.id FROM car_makers JOIN model_list ON car_makers.id = model_list.maker GROUP BY car_makers.id, car_makers.fullname HAVING COUNT(model_list.model) > 3;
SELECT car_makers.id, car_makers.maker  FROM car_makers  JOIN model_list ON car_makers.id = model_list.maker  GROUP BY car_makers.id, car_makers.maker  HAVING COUNT(model_list.modelid) > 3
SELECT DISTINCT model_list.model  FROM car_makers  JOIN model_list ON car_makers.id = model_list.maker  JOIN car_names ON model_list.model = car_names.model  JOIN cars_data ON car_names.makeid = cars_data.id  WHERE (car_makers.fullname = 'general motors' OR cars_data.weight > 3500)
SELECT car_names.model  FROM car_names  JOIN model_list ON car_names.model = model_list.model  JOIN car_makers ON model_list.maker = car_makers.id  JOIN cars_data ON car_names.makeid = cars_data.id  WHERE (car_makers.maker = 'general motors' OR cars_data.weight > 3500)
SELECT DISTINCT year  FROM cars_data  WHERE weight >= 3000 AND weight <= 4000
SELECT DISTINCT year  FROM cars_data  WHERE weight < 4000 OR weight > 3000
SELECT horsepower  FROM cars_data  WHERE accelerate = (SELECT MAX(accelerate) FROM cars_data)
SELECT horsepower  FROM cars_data  WHERE accelerate = (SELECT MAX(accelerate) FROM cars_data)
SELECT MIN(cylinders) FROM cars_data  WHERE id IN (SELECT makeid FROM car_names               WHERE model = 'volvo')  AND accelerate = (SELECT MIN(accelerate) FROM cars_data                    WHERE id IN (SELECT makeid FROM car_names                                 WHERE model = 'volvo'))
SELECT MIN(c.accelerate) FROM cars_data c JOIN car_names cn ON c.id = cn.makeid JOIN model_list ml ON cn.model = ml.model JOIN car_makers cm ON ml.maker = cm.id WHERE cm.maker = 'volvo'
SELECT COUNT(*) FROM cars_data WHERE accelerate > (   SELECT MAX(horsepower) FROM cars_data )
SELECT COUNT(*) FROM cars_data WHERE accelerate > (SELECT MAX(horsepower) FROM cars_data)
SELECT COUNT(DISTINCT countries.countryid) FROM countries JOIN car_makers ON car_makers.country = countries.countryid GROUP BY countries.countryid HAVING COUNT(car_makers.id) > 2
SELECT count(DISTINCT countries.countryname) FROM countries INNER JOIN car_makers ON car_makers.country = countries.countryid GROUP BY countries.continent HAVING count(DISTINCT car_makers.id) > 2;
SELECT COUNT(*) FROM cars_data WHERE cylinders > 6;
SELECT COUNT(*) FROM cars_data WHERE cylinders > 6
SELECT car_names.model FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.cylinders = 4 ORDER BY cars_data.horsepower DESC LIMIT 1;
SELECT model FROM cars_data, car_names WHERE cars_data.cylinders = 4     AND cars_data.id = car_names.makeid ORDER BY cars_data.horsepower DESC LIMIT 1
SELECT car_names.makeid, car_names.make FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cars_data.horsepower > (SELECT MIN(horsepower) FROM cars_data) AND cars_data.cylinders <= 3
SELECT car_names.makeid, car_names.make  FROM cars_data  JOIN car_names ON cars_data.id = car_names.makeid  WHERE cars_data.horsepower > (SELECT MIN(horsepower) FROM cars_data)  AND cars_data.cylinders < 4
SELECT MAX(mpg) FROM cars_data WHERE cylinders = 8 AND year < 1980
SELECT MAX(cars_data.mpg)  FROM cars_data  WHERE cars_data.cylinders = 8 OR cars_data.year < 1980
SELECT car_names.model  FROM car_names  JOIN cars_data ON car_names.makeid = cars_data.id  JOIN model_list ON car_names.model = model_list.model  JOIN car_makers ON model_list.maker = car_makers.id  WHERE cars_data.weight < 3500  AND car_makers.maker != 'ford motor company'
SELECT car_names.model FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id JOIN model_list ON car_names.model = model_list.model JOIN car_makers ON model_list.maker = car_makers.id WHERE cars_data.weight < 3500 AND car_makers.maker != 'Ford'
SELECT countryname FROM countries WHERE countryid NOT IN (    SELECT country    FROM car_makers )
SELECT countryname  FROM countries  WHERE countryid NOT IN (SELECT country                          FROM car_makers)
SELECT id, maker FROM car_makers WHERE id IN (     SELECT maker     FROM model_list     GROUP BY maker     HAVING COUNT(DISTINCT model) >= 2 ) GROUP BY id, maker HAVING COUNT(DISTINCT model) > 3;
SELECT id, maker FROM car_makers WHERE id IN (     SELECT maker     FROM model_list     GROUP BY maker     HAVING COUNT(DISTINCT model) >= 2 ) AND id IN (     SELECT makeid     FROM car_names     GROUP BY makeid     HAVING COUNT(*) > 3 )
SELECT countryid, countryname FROM countries  WHERE countryid IN  (SELECT country FROM car_makers  GROUP BY country  HAVING COUNT(*) > 3) OR countryid IN  (SELECT countryid FROM car_makers  INNER JOIN model_list ON car_makers.id = model_list.maker  INNER JOIN car_names ON model_list.model = car_names.model  WHERE car_names.make = 'fiat')
SELECT countryid, countryname  FROM countries  WHERE countryid IN (SELECT country                      FROM car_makers                      GROUP BY country                      HAVING COUNT(id) > 3)  OR countryid IN (SELECT country                  FROM car_makers                    INNER JOIN model_list ON car_makers.id = model_list.maker                   INNER JOIN car_names ON model_list.model = car_names.model                   WHERE car_names.make = 'fiat')
SELECT airlines.country FROM airlines WHERE airlines.airline = 'jetblue airways'
SELECT airlines.country FROM airlines WHERE airlines.airline = "jetblue airways";
SELECT abbreviation FROM airlines WHERE airline = 'jetblue airways';
SELECT abbreviation FROM airlines WHERE airline = 'jetblue airways'
SELECT airline, abbreviation FROM airlines WHERE country = 'usa'
SELECT airline, abbreviation FROM airlines WHERE country = 'usa'
SELECT airportcode, airportname FROM airports WHERE city = 'anthony';
SELECT airportcode, airportname  FROM airports  WHERE city = 'anthony';
SELECT COUNT(*) FROM airlines;
SELECT COUNT(*) FROM airlines;
SELECT COUNT(*) FROM airports;
SELECT COUNT(*)  FROM airports
SELECT COUNT(*) FROM flights;
SELECT COUNT(*) FROM flights;
SELECT airline FROM airlines WHERE abbreviation = 'ual'
SELECT airline  FROM airlines  WHERE abbreviation = 'ual';
SELECT COUNT(*) FROM airlines WHERE country = 'usa';
SELECT COUNT(*) FROM airlines WHERE country = 'usa';
SELECT city, country FROM airports WHERE airportname = 'alton airport';
SELECT city, country FROM airports WHERE airportname = 'alton'
SELECT airportname FROM airports WHERE airportcode = 'ako'
SELECT airportname FROM airports WHERE airportcode = 'ako';
SELECT airportname  FROM airports  WHERE city = 'aberdeen'
SELECT airportname FROM airports WHERE city = 'Aberdeen'
SELECT COUNT(*) FROM flights WHERE sourceairport = 'apg'
SELECT COUNT(*)  FROM flights  WHERE sourceairport = 'apg'
SELECT COUNT(*) FROM flights WHERE destairport = 'ato';
SELECT COUNT(*) FROM flights  WHERE destairport = 'ato'
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.sourceairport = airports.airportcode  WHERE airports.city = 'aberdeen'
SELECT COUNT(*) FROM flights JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.city = 'aberdeen'
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.destairport = airports.airportcode  WHERE airports.city = 'aberdeen city'
SELECT COUNT(*) FROM flights JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = 'aberdeen'
SELECT COUNT(*) FROM flights  WHERE sourceairport IN  (SELECT airportcode FROM airports WHERE city = 'aberdeen') AND destairport IN  (SELECT airportcode FROM airports WHERE city = 'ashley')
SELECT COUNT(*)  FROM flights  WHERE sourceairport = (SELECT airportcode FROM airports WHERE airportname = 'aberdeen')  AND destairport = (SELECT airportcode FROM airports WHERE airportname = 'ashley')
SELECT COUNT(*) FROM flights WHERE airline = 'jetblue airways'
SELECT COUNT(*)  FROM flights  WHERE airline = 'jetblue airways'
SELECT COUNT(*) FROM flights JOIN airlines ON flights.airline = airlines.uid JOIN airports ON flights.destairport = airports.airportcode WHERE airlines.airline = 'united airlines' AND airports.airportcode = 'asy';
SELECT COUNT(*) FROM flights  JOIN airlines ON flights.airline = airlines.uid  JOIN airports ON flights.destairport = airports.airportcode  WHERE airlines.airline = 'united airlines'  AND airports.airportcode = 'asy';
SELECT COUNT(*)  FROM flights  INNER JOIN airlines ON flights.airline = airlines.uid  INNER JOIN airports ON flights.sourceairport = airports.airportcode  WHERE airlines.airline = 'united airlines'  AND airports.airportcode = 'ahd'
SELECT COUNT(*) FROM flights  JOIN airlines ON flights.airline = airlines.uid  JOIN airports ON flights.sourceairport = airports.airportcode  WHERE airlines.airline = 'united'  AND airports.airportcode = 'ahd'
SELECT COUNT(*)  FROM airlines AS a  JOIN flights AS f ON a.uid = f.airline  JOIN airports AS ap ON f.destairport = ap.airportcode  WHERE a.airline = 'united airlines' AND ap.city = 'aberdeen'
SELECT COUNT(*)  FROM flights  JOIN airlines ON flights.airline = airlines.uid  JOIN airports ON flights.destairport = airports.airportcode  WHERE airlines.airline = 'united airlines'  AND airports.city = 'aberdeen'
SELECT airports.city, COUNT(flights.destairport) AS num_arriving_flights  FROM airports  JOIN flights ON flights.destairport = airports.airportcode GROUP BY airports.city ORDER BY num_arriving_flights DESC LIMIT 1;
SELECT airports.city FROM airports JOIN flights ON flights.destairport = airports.airportcode GROUP BY airports.city ORDER BY COUNT(*) DESC LIMIT 1
SELECT airports.city, COUNT(flights.flightno) AS num_departing_flights FROM airports JOIN flights ON airports.airportcode = flights.sourceairport GROUP BY airports.city ORDER BY num_departing_flights DESC LIMIT 1;
SELECT airports.city  FROM airports  JOIN flights ON flights.sourceairport = airports.airportcode  GROUP BY airports.city  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT airports.airportcode FROM airports JOIN flights ON flights.sourceairport = airports.airportcode OR flights.destairport = airports.airportcode GROUP BY airports.airportcode ORDER BY COUNT(*) DESC LIMIT 1
SELECT airports.airportcode  FROM airports  JOIN flights ON airports.airportcode = flights.destairport  GROUP BY airports.airportcode  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT airports.airportcode  FROM airports  JOIN flights ON flights.sourceairport = airports.airportcode OR flights.destairport = airports.airportcode GROUP BY airports.airportcode  ORDER BY COUNT(flights.flightid) ASC  LIMIT 1
SELECT airports.airportcode, COUNT(flights.flightno) AS num_flights FROM airports JOIN flights ON airports.airportcode = flights.sourceairport OR airports.airportcode = flights.destairport GROUP BY airports.airportcode ORDER BY num_flights LIMIT 1;
SELECT airline, COUNT(*) AS num_flights FROM flights GROUP BY airline ORDER BY num_flights DESC LIMIT 1;
SELECT airline, COUNT(flightno) AS num_flights FROM flights GROUP BY airline ORDER BY num_flights DESC LIMIT 1;
SELECT abbreviation, country  FROM airlines  WHERE uid = (     SELECT airline      FROM flights      GROUP BY airline      HAVING COUNT(*) = (         SELECT MIN(count)          FROM (             SELECT COUNT(*) as count              FROM flights              GROUP BY airline         ) as c     ) )
SELECT abbreviation, country  FROM airlines  WHERE uid = (     SELECT airline      FROM flights      GROUP BY airline      HAVING COUNT(*) = (         SELECT MIN(cnt)          FROM (             SELECT COUNT(*) as cnt              FROM flights              GROUP BY airline         ) AS counts     ) )
SELECT airlines.airline FROM airlines  JOIN flights ON airlines.uid = flights.airline  JOIN airports ON flights.sourceairport = airports.airportcode  WHERE airports.airportcode = 'ahd'
SELECT airline  FROM airlines  WHERE EXISTS (SELECT *                FROM flights                INNER JOIN airports ON flights.sourceairport = airports.airportcode                WHERE airlines.uid = flights.airline                AND airports.city = 'ahd')
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline JOIN airports ON flights.destairport = airports.airportcode WHERE airports.airportcode = 'ahd';
SELECT airlines.airline FROM airlines INNER JOIN flights ON airlines.uid = flights.airline INNER JOIN airports ON flights.destairport = airports.airportcode WHERE airports.airportname = 'ahd'
SELECT a.airline  FROM airlines a JOIN flights f ON a.uid = f.airline JOIN airports a1 ON f.sourceairport = a1.airportcode  JOIN airports a2 ON f.destairport = a2.airportcode WHERE f.sourceairport = 'apg' AND f.destairport = 'cvo'
SELECT airlines.airline FROM airlines INNER JOIN flights ON airlines.uid = flights.airline INNER JOIN airports AS apg ON flights.sourceairport = apg.airportcode INNER JOIN airports AS cvo ON flights.sourceairport = cvo.airportcode WHERE apg.airportname = 'apg' AND cvo.airportname = 'cvo'
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.airportcode = 'cvo' AND airlines.airline NOT IN (     SELECT airlines.airline     FROM airlines     JOIN flights ON airlines.uid = flights.airline     JOIN airports ON flights.sourceairport = airports.airportcode     WHERE airports.airportcode = 'apg' )
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline JOIN airports ON flights.sourceairport = airports.airportcode LEFT JOIN airports AS apg ON flights.destairport = apg.airportcode WHERE airports.airportname = 'cvo' AND apg.airportname IS NULL
SELECT DISTINCT airlines.airline  FROM airlines  JOIN flights ON airlines.uid = flights.airline  GROUP BY airlines.airline  HAVING COUNT(*) >= 10
SELECT airlines.airline FROM airlines JOIN flights ON airlines.uid = flights.airline GROUP BY airlines.airline HAVING COUNT(flights.flightno) >= 10
SELECT airline FROM airlines WHERE airline IN (     SELECT airline     FROM flights     GROUP BY airline     HAVING COUNT(*) < 200 )
SELECT airline FROM airlines JOIN flights ON airlines.uid = flights.airline GROUP BY airline HAVING COUNT(flights.flightno) < 200;
SELECT flightno FROM flights WHERE airline = 'united airlines'
SELECT flightno FROM flights  WHERE airline IN (SELECT uid FROM airlines WHERE airline = 'united airlines')
SELECT flightno FROM flights WHERE sourceairport = (SELECT airportcode FROM airports WHERE airportname = "apg")
SELECT flightno  FROM flights  WHERE sourceairport = 'apg'
SELECT flightno FROM flights WHERE destairport = 'apg'
SELECT flightno  FROM flights  JOIN airports ON flights.destairport = airports.airportcode  WHERE airports.airportname = 'apg';
SELECT flightno  FROM flights  WHERE sourceairport = (SELECT airportcode FROM airports WHERE city = "aberdeen")
SELECT flightno FROM flights JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.city = 'aberdeen'
SELECT flightno  FROM flights  WHERE destairport = (SELECT airportcode FROM airports WHERE city = "aberdeen")
SELECT flightno FROM flights WHERE destairport = (SELECT airportcode FROM airports WHERE airportname = 'aberdeen')
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.destairport = airports.airportcode  WHERE airports.city = 'aberdeen' OR airports.city = 'abilene'
SELECT COUNT(*) FROM flights INNER JOIN airports ON flights.destairport = airports.airportcode WHERE airports.city = 'aberdeen' OR airports.city = 'abilene'
SELECT airportname FROM airports WHERE airportcode NOT IN (SELECT DISTINCT sourceairport                           FROM flights                           UNION                           SELECT DISTINCT destairport                           FROM flights)
SELECT airportname  FROM airports  WHERE airportcode NOT IN (SELECT sourceairport                            FROM flights                            UNION                            SELECT destairport                            FROM flights)
SELECT COUNT(*) FROM employee
SELECT COUNT(*) FROM employee
SELECT name FROM employee ORDER BY age ASC;
SELECT name FROM employee ORDER BY age ASC;
SELECT city, COUNT(*)  FROM employee  GROUP BY city
SELECT city, COUNT(*) AS number_of_employees FROM employee GROUP BY city
SELECT employee.city FROM employee WHERE employee.age < 30 GROUP BY employee.city HAVING COUNT(employee.employee_id) > 1
SELECT city  FROM employee  WHERE age < 30  GROUP BY city  HAVING COUNT(employee_id) > 1
SELECT shop.location, COUNT(shop.shop_id) AS num_shops FROM shop GROUP BY shop.location
SELECT location, COUNT(*)  FROM shop  GROUP BY location;
SELECT shop.manager_name, shop.district FROM shop WHERE shop.number_products = (SELECT MAX(number_products) FROM shop)
SELECT shop.manager_name, shop.district FROM shop WHERE shop.number_products = (SELECT MAX(number_products) FROM shop)
SELECT MIN(number_products) AS min_products, MAX(number_products) AS max_products FROM shop;
SELECT MIN(number_products), MAX(number_products) FROM shop
SELECT name, location, district  FROM shop  ORDER BY number_products DESC;
SELECT name, location, district  FROM shop  ORDER BY number_products DESC
SELECT name  FROM shop  WHERE number_products > (SELECT AVG(number_products) FROM shop)
SELECT name FROM shop WHERE number_products > (SELECT AVG(number_products) FROM shop)
SELECT employee.name FROM employee JOIN evaluation ON employee.employee_id = evaluation.employee_id GROUP BY employee.employee_id, employee.name HAVING COUNT(evaluation.year_awarded) = (     SELECT MAX(eval_count)     FROM (         SELECT COUNT(year_awarded) as eval_count         FROM evaluation         GROUP BY employee_id     ) AS eval_counts )
SELECT employee.name FROM employee JOIN evaluation ON employee.employee_id = evaluation.employee_id GROUP BY employee.employee_id ORDER BY COUNT(evaluation.year_awarded) DESC LIMIT 1;
SELECT e.name  FROM employee e  JOIN evaluation ev ON e.employee_id = ev.employee_id  WHERE ev.bonus = (SELECT MAX(bonus) FROM evaluation)
SELECT employee.name  FROM employee  JOIN evaluation ON employee.employee_id = evaluation.employee_id  ORDER BY evaluation.bonus DESC  LIMIT 1
SELECT employee.name FROM employee WHERE employee.employee_id NOT IN      (SELECT evaluation.employee_id     FROM evaluation)
SELECT name FROM employee WHERE employee_id NOT IN (SELECT employee_id FROM evaluation)
SELECT shop.name  FROM shop  WHERE shop.shop_id IN (     SELECT hiring.shop_id      FROM hiring     GROUP BY hiring.shop_id     HAVING COUNT(hiring.employee_id) = (         SELECT MAX(emp_count)          FROM (             SELECT COUNT(hiring.employee_id) AS emp_count             FROM hiring             GROUP BY hiring.shop_id         ) AS emp_count_table     ) )
SELECT shop.name FROM shop JOIN hiring ON shop.shop_id = hiring.shop_id GROUP BY shop.name HAVING COUNT(hiring.employee_id) = (     SELECT MAX(employee_count)     FROM (         SELECT COUNT(hiring.employee_id) as employee_count         FROM shop         JOIN hiring ON shop.shop_id = hiring.shop_id         GROUP BY shop.name     ) AS temp )
SELECT name FROM shop WHERE shop_id NOT IN (SELECT shop_id FROM hiring);
SELECT shop.name FROM shop LEFT JOIN hiring ON shop.shop_id = hiring.shop_id GROUP BY shop.name HAVING COUNT(hiring.employee_id) = 0
SELECT shop.name, COUNT(hiring.employee_id) AS num_employees FROM shop INNER JOIN hiring ON hiring.shop_id = shop.shop_id GROUP BY shop.name
SELECT shop.name, COUNT(hiring.employee_id) FROM shop JOIN hiring ON shop.shop_id = hiring.shop_id GROUP BY shop.name
SELECT SUM(bonus) FROM evaluation
SELECT SUM(bonus) AS total_bonus_given FROM evaluation
SELECT * FROM hiring
SELECT * FROM hiring
SELECT DISTINCT shop.district FROM shop JOIN hiring ON shop.shop_id = hiring.shop_id JOIN employee ON hiring.employee_id = employee.employee_id WHERE shop.number_products < 3000 AND shop.shop_id IN (     SELECT shop_id     FROM shop     WHERE number_products > 10000 )
SELECT DISTINCT shop.district FROM shop WHERE shop.number_products < 3000 AND shop.district IN (     SELECT shop.district     FROM shop     WHERE shop.number_products > 10000 )
SELECT COUNT(DISTINCT location) FROM shop;
SELECT COUNT(DISTINCT location)  FROM shop
SELECT COUNT(*) FROM documents;
SELECT COUNT(*) FROM documents;
SELECT document_id, document_name, document_description  FROM documents
SELECT document_id, document_name, document_description  FROM documents
SELECT document_name, template_id  FROM documents  WHERE document_description LIKE '%w%'
SELECT document_name, template_id FROM documents WHERE document_description LIKE '%w%'
SELECT documents.document_id, documents.template_id, documents.document_description FROM documents WHERE documents.document_name = 'robbin cv'
SELECT documents.document_id, documents.template_id, documents.document_description FROM documents WHERE documents.document_name = 'robbin cv'
SELECT COUNT(DISTINCT template_id)  FROM documents
SELECT COUNT(DISTINCT documents.template_id) AS number_of_templates_used FROM documents
SELECT COUNT(*) FROM documents WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code = 'ppt')
SELECT COUNT(DISTINCT document_id)  FROM documents  WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code = 'ppt')
SELECT templates.template_id, COUNT(documents.document_id) AS num_documents FROM templates LEFT JOIN documents ON documents.template_id = templates.template_id GROUP BY templates.template_id
SELECT templates.template_id, COUNT(documents.template_id) AS usage_count FROM templates JOIN documents ON documents.template_id = templates.template_id GROUP BY templates.template_id
SELECT templates.template_id, templates.template_type_code FROM templates WHERE templates.template_id = (     SELECT documents.template_id     FROM documents     GROUP BY documents.template_id     ORDER BY COUNT(*) DESC     LIMIT 1 )
SELECT templates.template_id, templates.template_type_code FROM templates JOIN documents ON documents.template_id = templates.template_id GROUP BY templates.template_id, templates.template_type_code ORDER BY COUNT(documents.document_id) DESC LIMIT 1;
SELECT templates.template_id FROM templates INNER JOIN documents ON documents.template_id = templates.template_id GROUP BY templates.template_id HAVING COUNT(documents.document_id) > 1;
SELECT templates.template_id FROM templates INNER JOIN documents ON documents.template_id = templates.template_id GROUP BY templates.template_id HAVING COUNT(documents.document_id) > 1
SELECT templates.template_id FROM templates LEFT JOIN documents ON documents.template_id = templates.template_id WHERE documents.template_id IS NULL
SELECT templates.template_id FROM templates LEFT JOIN documents ON templates.template_id = documents.template_id WHERE documents.template_id IS NULL
SELECT COUNT(*) FROM templates;
SELECT COUNT(*) FROM templates
SELECT templates.template_id, templates.version_number, templates.template_type_code FROM templates
SELECT templates.template_id, templates.version_number, templates.template_type_code FROM templates INNER JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code
SELECT DISTINCT template_type_code FROM templates;
SELECT template_type_code FROM ref_template_types;
SELECT templates.template_id FROM templates WHERE templates.template_type_code = 'pp' OR templates.template_type_code = 'ppt'
SELECT templates.template_id  FROM templates WHERE templates.template_type_code = 'pp' OR templates.template_type_code = 'ppt'
SELECT COUNT(*)  FROM templates  WHERE template_type_code = 'cv'
SELECT COUNT(*)  FROM templates  WHERE template_type_code = 'cv'
SELECT version_number, template_type_code FROM templates WHERE version_number > 5;
SELECT version_number, template_type_code  FROM templates  WHERE version_number > 5
SELECT ref_template_types.template_type_code, COUNT(templates.template_id) AS num_of_templates FROM ref_template_types LEFT JOIN templates ON ref_template_types.template_type_code = templates.template_type_code GROUP BY ref_template_types.template_type_code;
SELECT template_type_code, COUNT(*) AS num_templates FROM templates GROUP BY template_type_code;
SELECT template_type_code, COUNT(template_id) AS template_count FROM templates GROUP BY template_type_code ORDER BY template_count DESC LIMIT 1
SELECT templates.template_type_code  FROM templates  GROUP BY templates.template_type_code  ORDER BY COUNT(*) DESC  LIMIT 1;
SELECT template_type_code  FROM ref_template_types  WHERE template_type_code IN (   SELECT template_type_code    FROM templates    GROUP BY template_type_code    HAVING COUNT(template_id) < 3 )
SELECT template_type_code FROM ref_template_types WHERE template_type_code IN (     SELECT template_type_code     FROM templates     GROUP BY template_type_code     HAVING COUNT(*) < 3 )
SELECT MIN(version_number), template_type_code FROM templates
SELECT templates.version_number, templates.template_type_code FROM templates INNER JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code ORDER BY templates.version_number ASC LIMIT 1
SELECT templates.template_type_code FROM templates JOIN documents ON documents.template_id = templates.template_id WHERE documents.document_name = "data base"
SELECT templates.template_type_code FROM templates JOIN documents ON documents.template_id = templates.template_id WHERE documents.document_name = 'data base'
SELECT document_name FROM documents JOIN templates ON documents.template_id = templates.template_id JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code WHERE ref_template_types.template_type_code = 'bk'
SELECT document_name FROM documents JOIN templates ON documents.template_id = templates.template_id JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code WHERE ref_template_types.template_type_code = 'bk'
SELECT ref_template_types.template_type_code, COUNT(documents.template_id) FROM ref_template_types JOIN templates ON ref_template_types.template_type_code = templates.template_type_code JOIN documents ON templates.template_id = documents.template_id GROUP BY ref_template_types.template_type_code
SELECT ref_template_types.template_type_code, COUNT(documents.template_id) AS num_documents  FROM ref_template_types  LEFT JOIN templates  ON ref_template_types.template_type_code = templates.template_type_code  LEFT JOIN documents  ON templates.template_id = documents.template_id  GROUP BY ref_template_types.template_type_code
SELECT template_type_code, COUNT(*) AS document_count FROM documents GROUP BY template_type_code ORDER BY document_count DESC LIMIT 1;
SELECT template_type_code FROM templates GROUP BY template_type_code ORDER BY COUNT(*) DESC LIMIT 1;
SELECT template_type_code  FROM ref_template_types  WHERE template_type_code NOT IN      (SELECT DISTINCT template_type_code      FROM templates      WHERE template_type_code NOT IN          (SELECT template_id          FROM documents))
SELECT template_type_code  FROM ref_template_types  WHERE template_type_code NOT IN (SELECT template_type_code FROM templates)
SELECT template_type_code, template_type_description  FROM ref_template_types
SELECT template_type_code, template_type_description FROM ref_template_types;
SELECT template_type_description FROM ref_template_types WHERE template_type_code = "ad";
SELECT template_type_description  FROM ref_template_types  WHERE template_type_code = 'ad';
SELECT template_type_code  FROM ref_template_types  WHERE template_type_description = 'book'
SELECT template_type_code  FROM ref_template_types  WHERE template_type_description = 'book'
SELECT DISTINCT ref_template_types.template_type_description  FROM ref_template_types  JOIN templates ON ref_template_types.template_type_code = templates.template_type_code  JOIN documents ON templates.template_id = documents.template_id
SELECT distinct templates.template_type_description FROM templates JOIN documents ON documents.template_id = templates.template_id JOIN ref_template_types ON ref_template_types.template_type_code = templates.template_type_code;
SELECT templates.template_id  FROM templates  JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code  WHERE ref_template_types.template_type_description = 'presentation'
SELECT template_id  FROM templates  WHERE template_id IN (   SELECT template_id    FROM ref_template_types    WHERE template_type_description = 'presentation' )
SELECT COUNT(*) as total_paragraphs FROM paragraphs;
SELECT COUNT(*) FROM paragraphs;
SELECT COUNT(*)  FROM paragraphs  JOIN documents ON paragraphs.document_id = documents.document_id  WHERE documents.document_name = 'summer show'
SELECT COUNT(*) FROM paragraphs JOIN documents ON paragraphs.document_id = documents.document_id WHERE documents.document_name = 'summer show'
SELECT *  FROM paragraphs  WHERE paragraph_text = 'korea'
SELECT * FROM paragraphs WHERE paragraph_text LIKE '%korea %'
SELECT paragraph_id, paragraph_text  FROM paragraphs  WHERE document_id = (     SELECT document_id      FROM documents      WHERE document_name = 'welcome to ny' )
SELECT paragraph_id, paragraph_text  FROM paragraphs  WHERE document_id = (SELECT document_id                       FROM documents                       WHERE document_name = 'welcome to ny')
SELECT paragraph_text FROM paragraphs  JOIN documents ON paragraphs.document_id = documents.document_id  WHERE documents.document_name = "customer reviews";
SELECT paragraphs.paragraph_text FROM paragraphs INNER JOIN documents ON paragraphs.document_id = documents.document_id WHERE documents.document_name = 'customer reviews'
SELECT documents.document_id, COUNT(paragraphs.paragraph_id) AS num_of_paragraphs FROM documents JOIN paragraphs ON paragraphs.document_id = documents.document_id GROUP BY documents.document_id ORDER BY documents.document_id;
SELECT documents.document_id, COUNT(paragraphs.paragraph_id) AS num_paragraphs FROM documents JOIN paragraphs ON paragraphs.document_id = documents.document_id GROUP BY documents.document_id ORDER BY documents.document_id ASC
SELECT documents.document_id, documents.document_name, COUNT(paragraphs.paragraph_id) FROM documents JOIN paragraphs ON paragraphs.document_id = documents.document_id GROUP BY documents.document_id, documents.document_name
SELECT documents.document_id, documents.document_name, COUNT(paragraphs.paragraph_id) as paragraph_count FROM documents LEFT JOIN paragraphs ON paragraphs.document_id = documents.document_id GROUP BY documents.document_id, documents.document_name
SELECT documents.document_id FROM documents JOIN paragraphs ON paragraphs.document_id = documents.document_id GROUP BY documents.document_id HAVING COUNT(paragraphs.paragraph_id) >= 2;
SELECT documents.document_id  FROM documents  INNER JOIN paragraphs ON documents.document_id = paragraphs.document_id  GROUP BY documents.document_id  HAVING COUNT(paragraphs.paragraph_id) >= 2
SELECT documents.document_id, documents.document_name FROM documents JOIN paragraphs ON paragraphs.document_id = documents.document_id GROUP BY documents.document_id, documents.document_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT documents.document_id, documents.document_name  FROM documents  WHERE documents.document_id = (     SELECT document_id      FROM paragraphs      GROUP BY document_id      ORDER BY COUNT(paragraph_id) DESC      LIMIT 1 )
SELECT document_id FROM documents ORDER BY (   SELECT COUNT(*)   FROM paragraphs   WHERE paragraphs.document_id = documents.document_id ) ASC LIMIT 1;
SELECT documents.document_id FROM documents JOIN paragraphs ON documents.document_id = paragraphs.document_id GROUP BY documents.document_id ORDER BY COUNT(paragraphs.paragraph_id) LIMIT 1
SELECT document_id FROM documents WHERE document_id IN (     SELECT document_id     FROM paragraphs     GROUP BY document_id     HAVING COUNT(paragraph_id) BETWEEN 1 AND 2 )
SELECT documents.document_id FROM documents WHERE (   SELECT COUNT(*)   FROM paragraphs   WHERE paragraphs.document_id = documents.document_id ) BETWEEN 1 AND 2
SELECT documents.document_id  FROM documents  JOIN paragraphs ON documents.document_id = paragraphs.document_id  WHERE paragraphs.paragraph_text IN ('brazil', 'ireland')
SELECT documents.document_id  FROM documents  JOIN paragraphs ON documents.document_id = paragraphs.document_id  WHERE paragraphs.paragraph_text LIKE '%brazil%' AND paragraphs.paragraph_text LIKE '%ireland%'
SELECT COUNT(*) FROM teacher
SELECT COUNT(*) FROM teacher;
SELECT name FROM teacher ORDER BY age ASC
SELECT name FROM teacher ORDER BY age ASC;
SELECT age, hometown FROM teacher
SELECT age, hometown FROM teacher
SELECT teacher.name FROM teacher WHERE teacher.hometown != 'little lever urban district'
SELECT teacher.name FROM teacher WHERE teacher.hometown <> 'little lever urban district'
SELECT name  FROM teacher  WHERE age IN (32, 33)
SELECT name FROM teacher WHERE age = 32 OR age = 33;
SELECT hometown FROM teacher WHERE age = (SELECT MIN(age) FROM teacher)
SELECT hometown FROM teacher WHERE age =  (SELECT MIN(age) FROM teacher)
SELECT teacher.hometown, COUNT(*) as num_teachers  FROM teacher  GROUP BY teacher.hometown
SELECT hometown, COUNT(*) AS teacher_count  FROM teacher  GROUP BY hometown
SELECT hometown, COUNT(*) AS count FROM teacher GROUP BY hometown ORDER BY count DESC LIMIT 1;
SELECT hometown, COUNT(hometown) AS count  FROM teacher  GROUP BY hometown  ORDER BY count DESC  LIMIT 1;
SELECT DISTINCT t1.hometown  FROM teacher t1  JOIN teacher t2 ON t1.hometown = t2.hometown  WHERE t1.teacher_id <> t2.teacher_id;
SELECT hometown  FROM teacher  GROUP BY hometown  HAVING COUNT(*) >= 2
SELECT teacher.name, course.course  FROM teacher  INNER JOIN course_arrange ON course_arrange.teacher_id = teacher.teacher_id  INNER JOIN course ON course.course_id = course_arrange.course_id
SELECT teacher.name, course.course FROM teacher INNER JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id INNER JOIN course ON course.course_id = course_arrange.course_id
SELECT teacher.name, course.course FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id JOIN course ON course.course_id = course_arrange.course_id ORDER BY teacher.name ASC
SELECT teacher.name, course.course FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id JOIN course ON course_arrange.course_id = course.course_id ORDER BY teacher.name ASC
SELECT teacher.name FROM course JOIN course_arrange ON course.course_id = course_arrange.course_id JOIN teacher ON course_arrange.teacher_id = teacher.teacher_id WHERE course.course = 'math'
SELECT teacher.name FROM teacher INNER JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id INNER JOIN course ON course_arrange.course_id = course.course_id WHERE course.course = 'math'
SELECT teacher.name, COUNT(course_arrange.course_id) AS num_courses FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id GROUP BY teacher.name
SELECT teacher.name, COUNT(course_arrange.course_id) AS number_of_courses FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id GROUP BY teacher.name;
SELECT teacher.name FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id GROUP BY teacher.name HAVING COUNT(course_arrange.course_id) >= 2
SELECT teacher.name FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id GROUP BY teacher.teacher_id HAVING COUNT(course_arrange.course_id) >= 2
SELECT teacher.name FROM teacher LEFT JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id WHERE course_arrange.teacher_id IS NULL
SELECT teacher.name FROM teacher LEFT JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id WHERE course_arrange.teacher_id IS NULL;
SELECT COUNT(visitor_id)  FROM visitor  WHERE age < 30
SELECT name  FROM visitor  WHERE level_of_membership > 4  ORDER BY level_of_membership DESC;
SELECT AVG(age) FROM visitor WHERE level_of_membership <= 4
SELECT visitor.name, visitor.level_of_membership  FROM visitor  WHERE visitor.level_of_membership > 4  ORDER BY visitor.age ASC
SELECT museum_id, name  FROM museum WHERE num_of_staff = (     SELECT MAX(num_of_staff)      FROM museum )
SELECT AVG(num_of_staff) FROM museum WHERE open_year < 2009
SELECT open_year, num_of_staff  FROM museum  WHERE name = 'plaza museum'
SELECT m.name FROM museum m WHERE m.num_of_staff > (     SELECT MIN(m2.num_of_staff)     FROM museum m2     WHERE m2.open_year > 2010 )
SELECT visitor.id, visitor.name, visitor.age FROM visitor JOIN visit ON visitor.id = visit.visitor_id GROUP BY visitor.id, visitor.name, visitor.age HAVING COUNT(visit.museum_id) > 1
SELECT visitor.id, visitor.name, visitor.level_of_membership  FROM visitor  JOIN visit ON visitor.id = visit.visitor_id  GROUP BY visitor.id, visitor.name, visitor.level_of_membership  ORDER BY SUM(visit.total_spent) DESC  LIMIT 1
SELECT m.museum_id, m.name FROM museum m INNER JOIN visit v ON m.museum_id = v.museum_id GROUP BY m.museum_id, m.name ORDER BY COUNT(v.visit_id) DESC LIMIT 1;
SELECT museum.name  FROM museum  LEFT JOIN visit ON museum.museum_id = visit.museum_id  WHERE visit.museum_id IS NULL
SELECT visitor.name, visitor.age  FROM visitor  JOIN visit ON visit.visitor_id = visitor.id  WHERE visit.num_of_ticket = (SELECT MAX(num_of_ticket) FROM visit)
SELECT AVG(num_of_ticket) AS average_tickets, MAX(num_of_ticket) AS max_tickets  FROM visit;
SELECT SUM(total_spent)  FROM visit  JOIN visitor ON visit.visitor_id = visitor.id  WHERE visitor.level_of_membership = 1
SELECT v.name  FROM visitor v WHERE v.id IN (     SELECT DISTINCT visitor_id     FROM visit vi     WHERE vi.museum_id IN (         SELECT museum_id         FROM museum         WHERE open_year < 2009     )     AND vi.museum_id IN (         SELECT museum_id         FROM museum         WHERE open_year > 2011     ) )
SELECT COUNT(visitor_id) FROM visitor WHERE visitor_id NOT IN (     SELECT visitor_id     FROM visit     INNER JOIN museum ON visit.museum_id = museum.museum_id     WHERE museum.open_year > 2010 )
SELECT COUNT(*)  FROM museum  WHERE open_year > 2013 OR open_year < 2008;
SELECT COUNT(*) FROM players;
SELECT COUNT(*) FROM players
SELECT COUNT(*) as total_matches FROM matches;
SELECT COUNT(*) AS num_matches  FROM matches;
SELECT first_name, birth_date FROM players WHERE country_code = 'usa'
SELECT first_name, birth_date  FROM players  WHERE country_code = 'usa'
SELECT AVG(loser_age) AS average_loser_age, AVG(winner_age) AS average_winner_age FROM matches
SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age FROM matches GROUP BY NULL
SELECT AVG(winner_rank) FROM matches
SELECT AVG(winner_rank)  FROM matches
SELECT MAX(loser_rank) FROM matches
SELECT MAX(loser_rank) AS best_rank FROM matches
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT country_code) FROM players
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT COUNT(DISTINCT loser_name) FROM matches
SELECT tourney_name FROM matches GROUP BY tourney_name HAVING COUNT(*) > 10;
SELECT tourney_name  FROM matches  GROUP BY tourney_name  HAVING COUNT(*) > 10
SELECT DISTINCT winner_name FROM matches WHERE year IN (2013, 2016)
SELECT DISTINCT p1.first_name, p1.last_name FROM players p1 INNER JOIN matches m1 ON m1.winner_id = p1.player_id INNER JOIN matches m2 ON m2.winner_id = p1.player_id WHERE YEAR(m1.tourney_date) = 2013 AND YEAR(m2.tourney_date) = 2016
SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)
SELECT COUNT(*)  FROM matches  WHERE year = 2013 OR year = 2016;
SELECT players.country_code, players.first_name  FROM matches  JOIN players ON matches.winner_id = players.player_id  JOIN tournaments ON matches.tourney_id = tournaments.tourney_id  WHERE tournaments.tourney_name = 'tourney wta championships'      AND tournaments.tourney_name = 'australian open'
SELECT players.first_name, players.country_code  FROM players  INNER JOIN matches ON players.player_id = matches.winner_id  INNER JOIN tournaments ON matches.tourney_id = tournaments.tourney_id  WHERE tournaments.tourney_name = 'WTA Championships' AND tournaments.tourney_name = 'Australian Open'
SELECT players.first_name, players.country_code FROM players ORDER BY players.birth_date ASC LIMIT 1
SELECT first_name, country_code  FROM players  WHERE birth_date = (SELECT MIN(birth_date) FROM players)
SELECT first_name, last_name FROM players ORDER BY birth_date;
SELECT CONCAT(players.first_name, ' ', players.last_name) AS full_name  FROM players  ORDER BY players.birth_date ASC
SELECT first_name, last_name FROM players WHERE hand = 'l' ORDER BY birth_date ASC;
SELECT CONCAT(players.first_name, ' ', players.last_name) AS full_name FROM players WHERE players.hand = 'L' ORDER BY players.birth_date
SELECT players.first_name, players.country_code  FROM players  JOIN rankings ON players.player_id = rankings.player_id  GROUP BY players.player_id  ORDER BY COUNT(rankings.tours) DESC  LIMIT 1
SELECT players.first_name, players.country_code  FROM players  WHERE players.player_id = rankings.player_id  GROUP BY players.player_id  ORDER BY COUNT(rankings.tours) DESC  LIMIT 1;
SELECT year, COUNT(*) AS num_matches  FROM matches  GROUP BY year  ORDER BY num_matches DESC  LIMIT 1;
SELECT year, COUNT(*) AS matches_count FROM matches GROUP BY year ORDER BY matches_count DESC LIMIT 1
SELECT winner_name, winner_rank_points FROM matches INNER JOIN players ON matches.winner_id = players.player_id GROUP BY winner_name, winner_rank_points HAVING COUNT(*) = (   SELECT MAX(winner_count)   FROM (SELECT winner_id, COUNT(*) AS winner_count         FROM matches         GROUP BY winner_id) AS winner_counts )
SELECT p.winner_name, p.winner_rank_points FROM matches m JOIN players p ON m.winner_id = p.player_id GROUP BY p.winner_name, p.winner_rank_points ORDER BY COUNT(*) DESC LIMIT 1;
SELECT winner_name FROM matches JOIN players ON matches.winner_id = players.player_id WHERE tourney_name = 'australian open' ORDER BY winner_rank_points DESC LIMIT 1;
SELECT MAX(rankings.ranking_points), players.first_name, players.last_name FROM matches JOIN players ON matches.winner_id = players.player_id JOIN rankings ON rankings.player_id = players.player_id WHERE matches.tourney_name = 'australian open' GROUP BY players.first_name, players.last_name ORDER BY rankings.ranking_points DESC LIMIT 1;
SELECT    m.winner_name,   m.loser_name FROM    matches m WHERE    m.minutes = (     SELECT        MAX(minutes)     FROM        matches   )
SELECT matches.winner_name, matches.loser_name FROM matches WHERE matches.minutes = (SELECT MAX(minutes) FROM matches)
SELECT players.first_name, AVG(rankings.ranking) AS average_ranking FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.first_name
SELECT first_name, AVG(ranking) FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY first_name
SELECT players.first_name, SUM(rankings.ranking_points) AS total_ranking_points FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY players.player_id, players.first_name
SELECT first_name, SUM(ranking_points) AS total_ranking_points FROM players JOIN rankings ON players.player_id = rankings.player_id GROUP BY first_name
SELECT players.country_code, COUNT(*) AS player_count  FROM players  GROUP BY players.country_code
SELECT country_code, COUNT(*) AS player_count FROM players GROUP BY country_code;
SELECT players.country_code FROM players GROUP BY players.country_code ORDER BY COUNT(players.player_id) DESC LIMIT 1;
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) = (     SELECT MAX(player_count)     FROM (         SELECT country_code, COUNT(*) as player_count         FROM players         GROUP BY country_code     ) as counts )
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50;
SELECT country_code FROM players GROUP BY country_code HAVING COUNT(*) > 50
SELECT ranking_date, COUNT(tours) AS total_tours  FROM rankings  GROUP BY ranking_date
SELECT ranking_date, COUNT(tours) AS total_tours FROM rankings GROUP BY ranking_date
SELECT year, COUNT(*) AS num_matches FROM matches GROUP BY year;
SELECT year, COUNT(*) AS matches_count FROM matches GROUP BY year;
SELECT m.winner_name, r.ranking  FROM matches m  JOIN players p ON m.winner_id = p.player_id  JOIN rankings r ON p.player_id = r.player_id  ORDER BY p.birth_date  LIMIT 3
SELECT winner_name, winner_rank FROM matches JOIN players ON matches.winner_id = players.player_id WHERE year = (SELECT MIN(year) FROM matches) ORDER BY winner_age LIMIT 3;
SELECT COUNT(DISTINCT matches.winner_id) AS winners FROM matches JOIN players ON matches.winner_id = players.player_id WHERE matches.tourney_name = 'wta championships' AND players.hand = 'left'
SELECT COUNT(*)  FROM matches  JOIN players ON players.player_id = matches.winner_id  WHERE players.hand = 'L'  AND matches.tourney_name = 'WTA Championships'
SELECT players.first_name, players.country_code, players.birth_date  FROM matches  INNER JOIN players ON matches.winner_id = players.player_id  WHERE matches.winner_rank_points = (SELECT MAX(winner_rank_points) FROM matches)
SELECT players.first_name, players.country_code, players.birth_date FROM players JOIN matches ON matches.winner_id = players.player_id GROUP BY players.player_id HAVING MAX(matches.winner_rank_points) = (     SELECT MAX(winner_rank_points)     FROM matches )
SELECT hand, COUNT(*) AS num_players FROM players GROUP BY hand;
SELECT hand, COUNT(*) as player_count FROM players GROUP BY hand;
SELECT COUNT(*) FROM ship WHERE disposition_of_ship = 'captured'
SELECT name, tonnage  FROM ship  ORDER BY name DESC
SELECT name, date, result FROM battle;
SELECT battle.name, MAX(death.killed) AS maximum_death_toll, MIN(death.killed) AS minimum_death_toll FROM battle JOIN death ON battle.id = death.caused_by_ship_id GROUP BY battle.name;
SELECT AVG(injured)  FROM death
SELECT * FROM death WHERE caused_by_ship_id IN (     SELECT id     FROM ship     WHERE tonnage = 't' )
SELECT name, result FROM battle WHERE bulgarian_commander <> 'boril'
SELECT battle.id, battle.name FROM battle INNER JOIN ship ON battle.id = ship.lost_in_battle WHERE ship.ship_type = 'brig'
SELECT battle.id, battle.name  FROM battle  WHERE battle.id IN (   SELECT death.caused_by_ship_id    FROM death    GROUP BY death.caused_by_ship_id    HAVING SUM(death.killed) > 10 )
SELECT ship.id, ship.name FROM ship JOIN death ON ship.id = death.caused_by_ship_id GROUP BY ship.id, ship.name ORDER BY SUM(death.injured) DESC LIMIT 1
SELECT DISTINCT battle.name  FROM battle  WHERE battle.bulgarian_commander = 'kaloyan'  AND battle.latin_commander = 'baldwin i'
SELECT COUNT(DISTINCT result) AS result_count FROM battle;
SELECT COUNT(*)  FROM battle  WHERE NOT EXISTS (SELECT * FROM ship WHERE ship.lost_in_battle = battle.id AND ship.tonnage = '225')
SELECT b.name, b.date  FROM battle b  JOIN ship s1 ON s1.lost_in_battle = b.id  JOIN ship s2 ON s2.lost_in_battle = b.id  WHERE s1.name = 'lettice' AND s2.name = 'hms atalanta'
SELECT battle.name, battle.result, battle.bulgarian_commander FROM battle LEFT JOIN ship ON ship.lost_in_battle = battle.id WHERE ship.lost_in_battle IS NULL AND ship.location = 'english channel'
SELECT note FROM death WHERE note LIKE '%east%'
SELECT line_1, line_2  FROM addresses
SELECT line_1, line_2 FROM addresses
SELECT COUNT(*) FROM courses;
SELECT COUNT(*) FROM courses
SELECT course_description FROM courses WHERE course_name = 'math';
SELECT course_description FROM courses WHERE course_name LIKE '%math%';
SELECT zip_postcode FROM addresses WHERE city = 'port chelsea';
SELECT zip_postcode FROM addresses WHERE city = 'port chelsea'
SELECT departments.department_id, departments.department_name  FROM departments JOIN degree_programs ON departments.department_id = degree_programs.department_id GROUP BY departments.department_id, departments.department_name HAVING COUNT(degree_programs.degree_program_id) =  (SELECT MAX(degree_count)  FROM (SELECT departments.department_id, COUNT(degree_programs.degree_program_id) as degree_count FROM departments JOIN degree_programs ON departments.department_id = degree_programs.department_id GROUP BY departments.department_id) as counts)
SELECT departments.department_id, departments.department_name  FROM departments  JOIN degree_programs ON departments.department_id = degree_programs.department_id  GROUP BY departments.department_id, departments.department_name  ORDER BY COUNT(degree_programs.degree_program_id) DESC  LIMIT 1
SELECT COUNT(*) FROM degree_programs
SELECT COUNT(DISTINCT department_id) FROM degree_programs
SELECT COUNT(DISTINCT degree_summary_name)  FROM degree_programs;
SELECT COUNT(DISTINCT degree_program_id) FROM degree_programs
SELECT COUNT(degree_program_id) FROM degree_programs WHERE department_id = 'engineering';
SELECT COUNT(degree_program_id) FROM degree_programs WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'engineering')
SELECT section_name, section_description FROM sections
SELECT section_name, section_description FROM sections
SELECT course_id, course_name  FROM courses  WHERE course_id IN      (SELECT course_id      FROM sections      GROUP BY course_id      HAVING COUNT(section_id) <= 2)
SELECT course_id, course_name FROM courses WHERE course_id IN (   SELECT course_id   FROM sections   GROUP BY course_id   HAVING COUNT(section_id) < 2 )
SELECT section_name FROM sections ORDER BY section_name DESC
SELECT section_name FROM sections ORDER BY section_name DESC;
SELECT semesters.semester_name, semesters.semester_id FROM semesters JOIN student_enrolment ON semesters.semester_id = student_enrolment.semester_id GROUP BY semesters.semester_name, semesters.semester_id ORDER BY COUNT(student_enrolment.student_enrolment_id) DESC LIMIT 1;
SELECT s.semester_id, s.semester_name FROM semesters s JOIN student_enrolment se ON s.semester_id = se.semester_id GROUP BY s.semester_id, s.semester_name ORDER BY COUNT(se.student_id) DESC LIMIT 1;
SELECT department_description  FROM departments  WHERE department_name LIKE '%the computer%'
SELECT department_description FROM departments WHERE department_name LIKE '%computer%'
SELECT s.first_name, s.middle_name, s.last_name, s.student_id FROM students s JOIN student_enrolment se ON s.student_id = se.student_id WHERE se.degree_program_id IN (     SELECT se.degree_program_id     FROM student_enrolment se     WHERE se.semester_id = 2     GROUP BY se.degree_program_id     HAVING COUNT(DISTINCT se.semester_id) = 1     )
SELECT students.student_id, students.first_name, students.middle_name, students.last_name  FROM students  JOIN student_enrolment ON student_enrolment.student_id = students.student_id  WHERE EXISTS (     SELECT degree_program_id      FROM student_enrolment      WHERE student_enrolment.student_id = students.student_id      AND student_enrolment.semester_id = semesters.semester_id      GROUP BY student_enrolment.student_id      HAVING COUNT(DISTINCT degree_program_id) = 2 )
SELECT students.first_name, students.middle_name, students.last_name FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_programs.degree_summary_name = "bachelor";
SELECT first_name, middle_name, last_name FROM students JOIN student_enrolment ON students.student_id = student_enrolment.student_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_programs.degree_summary_name = 'Bachelors'
SELECT degree_programs.degree_summary_name FROM degree_programs INNER JOIN student_enrolment ON degree_programs.degree_program_id = student_enrolment.degree_program_id GROUP BY degree_programs.degree_summary_name ORDER BY COUNT(*) DESC LIMIT 1;
SELECT degree_programs.degree_summary_name FROM degree_programs JOIN student_enrolment ON degree_programs.degree_program_id = student_enrolment.degree_program_id GROUP BY degree_programs.degree_summary_name ORDER BY COUNT(student_enrolment.student_id) DESC LIMIT 1;
SELECT degree_programs.degree_program_id, degree_programs.degree_summary_name FROM degree_programs JOIN student_enrolment ON degree_programs.degree_program_id = student_enrolment.degree_program_id GROUP BY degree_programs.degree_program_id, degree_programs.degree_summary_name ORDER BY COUNT(student_enrolment.student_id) DESC LIMIT 1;
SELECT degree_program_id, degree_summary_name, degree_summary_description  FROM degree_programs  WHERE degree_program_id IN (     SELECT degree_program_id      FROM student_enrolment      GROUP BY degree_program_id      HAVING COUNT(*) = (         SELECT MAX(enrollment_count)          FROM (             SELECT degree_program_id, COUNT(*) as enrollment_count              FROM student_enrolment              GROUP BY degree_program_id         ) AS counts     ) )
SELECT students.student_id, students.first_name, students.middle_name, students.last_name, COUNT(student_enrolment.student_id) AS num_enrollments FROM students JOIN student_enrolment ON student_enrolment.student_id = students.student_id GROUP BY students.student_id, students.first_name, students.middle_name, students.last_name ORDER BY num_enrollments DESC LIMIT 1;
SELECT students.student_id, students.first_name, students.middle_name, students.last_name, COUNT(student_enrolment.student_enrolment_id) AS enrollment_count  FROM students  JOIN student_enrolment ON students.student_id = student_enrolment.student_id  GROUP BY students.student_id, students.first_name, students.middle_name, students.last_name  ORDER BY enrollment_count DESC  LIMIT 1;
SELECT semester_name FROM semesters WHERE semester_id NOT IN (SELECT semester_id FROM student_enrolment)
SELECT semester_name  FROM semesters  WHERE semester_id NOT IN (SELECT semester_id                            FROM student_enrolment)
SELECT course_name FROM courses JOIN student_enrolment_courses ON courses.course_id = student_enrolment_courses.course_id
SELECT course_name FROM courses WHERE course_id IN (SELECT course_id FROM student_enrolment_courses)
SELECT course_name FROM courses WHERE course_id = (     SELECT course_id     FROM student_enrolment_courses     GROUP BY course_id     ORDER BY COUNT(*) DESC     LIMIT 1 )
SELECT course_name  FROM courses  WHERE course_id = (     SELECT course_id      FROM (         SELECT course_id, COUNT(*) AS num_students          FROM student_enrolment_courses          GROUP BY course_id          ORDER BY num_students DESC          LIMIT 1     ) AS subquery )
SELECT last_name FROM students JOIN addresses ON students.current_address_id = addresses.address_id WHERE state_province_county = 'north carolina' AND student_id NOT IN (     SELECT student_id     FROM student_enrolment     )
SELECT last_name FROM students WHERE permanent_address_id IN (     SELECT address_id     FROM addresses     WHERE state_province_county = 'North Carolina' ) AND student_id NOT IN (     SELECT student_id     FROM student_enrolment     WHERE degree_program_id IS NULL )
SELECT transcripts.transcript_date, transcripts.transcript_id FROM transcripts INNER JOIN transcript_contents ON transcripts.transcript_id = transcript_contents.transcript_id INNER JOIN student_enrolment_courses ON transcript_contents.student_course_id = student_enrolment_courses.student_course_id GROUP BY transcripts.transcript_date, transcripts.transcript_id HAVING COUNT(student_enrolment_courses.course_id) >= 2
SELECT transcript_id, transcript_date FROM transcripts WHERE transcript_id IN (     SELECT transcript_id     FROM transcript_contents     GROUP BY transcript_id     HAVING COUNT(DISTINCT student_course_id) >= 2 )
SELECT cell_mobile_number  FROM students  WHERE first_name = 'timmothy' AND last_name = 'ward'
SELECT cell_mobile_number FROM students WHERE first_name = 'Timmothy' AND last_name = 'Ward'
SELECT first_name, middle_name, last_name FROM students ORDER BY date_first_registered ASC LIMIT 1
SELECT first_name, middle_name, last_name FROM students WHERE student_id = (SELECT student_id FROM student_enrolment ORDER BY date_first_registered ASC LIMIT 1)
SELECT first_name, middle_name, last_name FROM students WHERE student_id in (   SELECT student_id   FROM student_enrolment   WHERE degree_program_id in (     SELECT degree_program_id     FROM degree_programs   )   ORDER BY date_left   LIMIT 1 )
SELECT first_name, middle_name, last_name FROM students WHERE date_left IS NULL ORDER BY date_first_registered LIMIT 1
SELECT students.first_name FROM students JOIN addresses ON students.permanent_address_id = addresses.address_id WHERE students.permanent_address_id <> students.current_address_id
SELECT students.first_name  FROM students  JOIN addresses ON students.permanent_address_id <> addresses.address_id  WHERE students.current_address_id <> addresses.address_id
SELECT addresses.address_id, addresses.line_1, addresses.line_2, addresses.line_3 FROM addresses JOIN students ON students.current_address_id = addresses.address_id GROUP BY addresses.address_id ORDER BY COUNT(students.student_id) DESC LIMIT 1;
SELECT address_id, line_1, line_2  FROM addresses  WHERE address_id IN (     SELECT permanent_address_id      FROM students      GROUP BY permanent_address_id      ORDER BY COUNT(student_id) DESC      LIMIT 1 )
SELECT AVG(transcripts.transcript_date) as average_transcript_date  FROM transcripts
SELECT AVG(transcript_date) FROM transcripts
SELECT transcript_date, other_details FROM transcripts ORDER BY transcript_date ASC LIMIT 1;
SELECT MIN(transcript_date) AS earliest_date, other_details FROM transcripts;
SELECT COUNT(*) FROM transcripts
SELECT COUNT(*) FROM transcripts
SELECT MAX(transcripts.transcript_date) FROM transcripts
SELECT MAX(transcript_date) FROM transcripts
SELECT COUNT(DISTINCT transcript_contents.transcript_id) AS num_transcripts,         student_enrolment_courses.student_enrolment_id AS enrollment_id FROM student_enrolment_courses INNER JOIN transcript_contents ON student_enrolment_courses.student_course_id = transcript_contents.student_course_id GROUP BY student_enrolment_courses.student_enrolment_id ORDER BY num_transcripts DESC LIMIT 1
SELECT course_id, COUNT(*) AS course_count, MAX(course_count) AS max_course_count, student_enrolment_id FROM student_enrolment_courses GROUP BY course_id HAVING course_count = max_course_count
SELECT transcript_id, transcript_date FROM transcripts ORDER BY transcript_date ASC LIMIT 1
SELECT transcript_id, transcript_date  FROM transcripts  ORDER BY (SELECT COUNT(*) FROM transcript_contents WHERE transcript_contents.transcript_id = transcripts.transcript_id) ASC  LIMIT 1;
SELECT semesters.semester_name FROM semesters JOIN student_enrolment ON semesters.semester_id = student_enrolment.semester_id JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id WHERE degree_programs.degree_summary_name = 'Master'  AND EXISTS (   SELECT 1   FROM student_enrolment se   JOIN degree_programs dp ON se.degree_program_id = dp.degree_program_id   WHERE dp.degree_summary_name = 'Bachelor'   AND se.semester_id = student_enrolment.semester_id )
SELECT semester_id FROM semesters WHERE semester_id IN (     SELECT semester_id     FROM student_enrolment     INNER JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id     INNER JOIN departments ON degree_programs.department_id = departments.department_id     WHERE degree_summary_name IN ('masters', 'bachelors')     GROUP BY semester_id     HAVING COUNT(DISTINCT degree_summary_name) = 2 )
SELECT COUNT(DISTINCT addresses.address_id) FROM students JOIN addresses ON students.current_address_id = addresses.address_id
SELECT address_id, line_1, line_2, line_3, city, zip_postcode, state_province_county, country, other_address_details  FROM addresses  WHERE address_id IN (SELECT current_address_id FROM students UNION SELECT permanent_address_id FROM students)
SELECT * FROM students ORDER BY last_name DESC, first_name DESC, middle_name DESC;
SELECT * FROM students ORDER BY last_name DESC
DESCRIBE sections;
SELECT section_description FROM sections WHERE section_name = 'h';
SELECT first_name FROM students JOIN addresses ON students.permanent_address_id = addresses.address_id WHERE addresses.country = 'haiti' OR students.cell_mobile_number = '09700166582'
SELECT first_name FROM students JOIN addresses ON students.permanent_address_id = addresses.address_id WHERE country = 'Haiti' OR cell_mobile_number = '09700166582'
SELECT title FROM cartoon ORDER BY title ASC;
SELECT title  FROM cartoon  ORDER BY title ASC;
SELECT * FROM cartoon WHERE directed_by = "ben jones";
SELECT title FROM cartoon WHERE directed_by = 'ben jones'
SELECT COUNT(*) FROM cartoon WHERE written_by = 'joseph kuhr'
SELECT COUNT(*)  FROM cartoon  WHERE written_by = 'joseph kuhr'
SELECT cartoon.title, cartoon.directed_by  FROM cartoon  ORDER BY cartoon.original_air_date;
SELECT cartoon.title, cartoon.directed_by FROM cartoon ORDER BY cartoon.original_air_date
SELECT title  FROM cartoon  WHERE directed_by = 'ben jones' OR directed_by = 'brandon vietti';
SELECT title FROM cartoon WHERE directed_by = 'ben jones' OR directed_by = 'brandon vietti';
SELECT tv_channel.country, COUNT(tv_channel.id) AS num_channels FROM tv_channel GROUP BY tv_channel.country ORDER BY num_channels DESC LIMIT 1;
SELECT country, COUNT(*) AS num_channels FROM tv_channel GROUP BY country ORDER BY num_channels DESC LIMIT 1;
SELECT COUNT(DISTINCT series_name) AS number_of_series_names, COUNT(DISTINCT content) AS number_of_contents FROM tv_channel
SELECT COUNT(DISTINCT tv_series.series_name) AS num_series, COUNT(DISTINCT tv_channel.content) AS num_contents  FROM tv_series  JOIN tv_channel ON tv_series.channel = tv_channel.id
SELECT content  FROM tv_channel  WHERE series_name = 'sky radio'
SELECT content FROM tv_channel WHERE series_name = 'sky radio';
SELECT package_option  FROM tv_channel  WHERE series_name = "sky radio"
SELECT package_option  FROM tv_channel  WHERE series_name = 'sky radio'
SELECT COUNT(tv_channel.id) FROM tv_channel WHERE tv_channel.language = 'english'
SELECT COUNT(*)  FROM tv_channel  WHERE language = 'English'
SELECT tv_channel.language, COUNT(*) AS num_channels  FROM tv_channel  GROUP BY tv_channel.language  ORDER BY num_channels ASC  LIMIT 1;
SELECT language, COUNT(*) AS num_channels FROM tv_channel GROUP BY language ORDER BY num_channels ASC LIMIT 1;
SELECT tv_channel.language, COUNT(tv_channel.id) AS num_channels FROM tv_channel GROUP BY tv_channel.language
SELECT language, COUNT(tv_channel.id) AS num_channels FROM tv_channel GROUP BY language
SELECT tv_channel.series_name FROM cartoon JOIN tv_channel ON cartoon.channel = tv_channel.id WHERE cartoon.title = "the rise of the blue beetle!"
SELECT tv_channel.series_name FROM cartoon JOIN tv_channel ON cartoon.channel = tv_channel.id WHERE cartoon.title = "the rise of the blue beetle"
SELECT cartoon.title  FROM cartoon  INNER JOIN tv_channel ON cartoon.channel = tv_channel.id  INNER JOIN tv_series ON tv_series.channel = tv_channel.id  WHERE tv_channel.series_name = "sky radio"
SELECT title FROM cartoon WHERE channel IN     (SELECT id      FROM tv_channel      WHERE series_name = 'sky radio')
SELECT tv_series.episode  FROM tv_series  ORDER BY tv_series.rating ASC
SELECT cartoon.title, tv_series.episode, tv_series.rating  FROM cartoon JOIN tv_series ON cartoon.id = tv_series.id ORDER BY tv_series.rating DESC;
SELECT episode, rating FROM tv_series ORDER BY rating DESC LIMIT 3
SELECT episode, rating FROM tv_series ORDER BY rating DESC LIMIT 3;
SELECT MIN(share), MAX(share) FROM tv_series;
SELECT MAX(share), MIN(share) FROM tv_series;
SELECT tv_series.air_date  FROM tv_series  WHERE tv_series.episode = "a love of a lifetime"
SELECT air_date FROM tv_series WHERE episode = "a love of a lifetime";
SELECT weekly_rank FROM tv_series WHERE episode = 'a love of a lifetime'
SELECT weekly_rank FROM tv_series WHERE episode = "a love of a lifetime"
SELECT tv_channel.series_name  FROM tv_channel JOIN tv_series ON tv_series.channel = tv_channel.id WHERE tv_series.episode = "a love of a lifetime"
SELECT cartoon.title FROM cartoon JOIN tv_series ON cartoon.id = tv_series.id WHERE tv_series.episode = "a love of a lifetime"
SELECT tv_series.episode FROM tv_series INNER JOIN tv_channel ON tv_series.channel = tv_channel.id WHERE tv_channel.series_name = "sky radio"
SELECT episode FROM tv_series WHERE series_name = "sky radio";
SELECT directed_by, COUNT(*) AS cartoon_count FROM cartoon GROUP BY directed_by;
SELECT directed_by, COUNT(*) AS number_of_cartoons_created FROM cartoon GROUP BY directed_by
SELECT production_code, cartoon.channel FROM cartoon JOIN tv_series ON cartoon.id = tv_series.id WHERE tv_series.air_date = (SELECT MAX(air_date) FROM tv_series) ORDER BY tv_series.air_date DESC LIMIT 1;
SELECT production_code, channel  FROM cartoon  WHERE original_air_date = (SELECT MAX(original_air_date) FROM cartoon)
SELECT tv_channel.package_option, tv_channel.series_name FROM tv_channel WHERE tv_channel.hight_definition_tv = 1;
SELECT package_option, series_name  FROM tv_channel  JOIN tv_series ON tv_channel.id = tv_series.channel  WHERE tv_channel.hight_definition_tv = true
SELECT DISTINCT tv_channel.country FROM tv_channel JOIN cartoon ON cartoon.channel = tv_channel.id WHERE cartoon.written_by = 'todd casey';
SELECT tv_channel.country  FROM tv_channel  JOIN cartoon ON cartoon.channel = tv_channel.id  WHERE cartoon.written_by = 'todd casey'
SELECT DISTINCT tv_channel.country FROM tv_channel LEFT JOIN cartoon ON cartoon.channel = tv_channel.id AND cartoon.written_by = 'todd casey' WHERE cartoon.id IS NULL
SELECT DISTINCT country FROM tv_channel WHERE id NOT IN (     SELECT channel     FROM cartoon     WHERE written_by = 'todd casey' )
SELECT tv_channel.series_name, tv_channel.country FROM tv_channel INNER JOIN cartoon ON cartoon.channel = tv_channel.id WHERE cartoon.directed_by IN ('ben jones', 'michael chang')
SELECT tv_channel.series_name, tv_channel.country FROM tv_channel WHERE tv_channel.id IN (SELECT cartoon.channel                         FROM cartoon                         WHERE (cartoon.directed_by = 'ben jones' OR cartoon.directed_by = 'michael chang'));
SELECT tv_channel.pixel_aspect_ratio_par, tv_channel.country  FROM tv_channel  WHERE tv_channel.language <> 'English'
SELECT tv_channel.pixel_aspect_ratio_par, tv_channel.country  FROM tv_channel  WHERE tv_channel.language <> 'English'
SELECT tv_channel.id FROM tv_channel WHERE tv_channel.country IN (     SELECT tv_channel.country     FROM tv_channel     GROUP BY tv_channel.country     HAVING COUNT(*) > 2 )
SELECT id FROM tv_channel GROUP BY id HAVING COUNT(id) > 2;
SELECT tv_channel.id FROM tv_channel WHERE tv_channel.id NOT IN (   SELECT cartoon.channel   FROM cartoon   WHERE cartoon.directed_by = 'ben jones' )
SELECT tv_channel.id FROM tv_channel LEFT JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.directed_by != 'Ben Jones' OR cartoon.directed_by IS NULL
SELECT tv_channel.package_option FROM tv_channel LEFT JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.directed_by != 'Ben Jones'    OR cartoon.directed_by IS NULL
SELECT package_option FROM tv_channel WHERE id NOT IN (   SELECT channel   FROM cartoon   WHERE directed_by = 'ben jones' )
SELECT COUNT(*) FROM poker_player
SELECT COUNT(*) AS num_poker_players FROM poker_player
SELECT earnings  FROM poker_player  ORDER BY earnings DESC
SELECT earnings  FROM poker_player  ORDER BY earnings DESC
SELECT final_table_made, best_finish FROM poker_player
SELECT final_table_made, best_finish FROM poker_player WHERE poker_player_id = people.people_id
SELECT AVG(earnings) FROM poker_player
SELECT AVG(earnings) AS average_earnings FROM poker_player
SELECT money_rank FROM poker_player WHERE earnings = (SELECT MAX(earnings) FROM poker_player)
SELECT money_rank FROM poker_player WHERE earnings = (SELECT MAX(earnings) FROM poker_player)
SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000;
SELECT MAX(final_table_made) FROM poker_player WHERE earnings < 200000;
SELECT name FROM people INNER JOIN poker_player ON people.people_id = poker_player.people_id
SELECT people.name  FROM people  JOIN poker_player ON people.people_id = poker_player.people_id
SELECT people.name  FROM people  INNER JOIN poker_player ON people.people_id = poker_player.people_id  WHERE poker_player.earnings > 300000
SELECT people.name  FROM people INNER JOIN poker_player ON people.people_id = poker_player.people_id WHERE poker_player.earnings > 300000
SELECT p.name FROM people p JOIN poker_player pp ON p.people_id = pp.people_id ORDER BY pp.final_table_made ASC
SELECT p.name  FROM people p JOIN poker_player pp ON p.people_id = pp.people_id ORDER BY pp.final_table_made ASC
SELECT birth_date  FROM people  WHERE people_id = (     SELECT people_id      FROM poker_player      WHERE earnings = (         SELECT MIN(earnings)          FROM poker_player     ) )
SELECT birth_date FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY earnings LIMIT 1;
SELECT money_rank  FROM people  JOIN poker_player ON people.people_id = poker_player.people_id  WHERE height = (SELECT MAX(height) FROM people)
SELECT poker_player.money_rank FROM poker_player JOIN people ON poker_player.people_id = people.people_id ORDER BY people.height DESC LIMIT 1
SELECT AVG(earnings)  FROM poker_player  JOIN people ON poker_player.people_id = people.people_id  WHERE height > 200
SELECT AVG(earnings)  FROM poker_player  JOIN people ON poker_player.people_id = people.people_id  WHERE height > 200
SELECT p.name  FROM people p  JOIN poker_player pp ON p.people_id = pp.people_id  ORDER BY pp.earnings DESC;
SELECT p.name FROM people p JOIN poker_player pp ON p.people_id = pp.people_id ORDER BY pp.earnings DESC
SELECT nationality, COUNT(*) AS count FROM people GROUP BY nationality
SELECT nationality, COUNT(*) AS count FROM people GROUP BY nationality;
SELECT nationality, COUNT(nationality) AS count FROM people GROUP BY nationality ORDER BY count DESC LIMIT 1
SELECT nationality FROM people GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT nationality FROM people GROUP BY nationality HAVING COUNT(*) >= 2
SELECT nationality  FROM people  GROUP BY nationality  HAVING COUNT(*) >= 2
SELECT name, birth_date FROM people ORDER BY name ASC
SELECT name, birth_date  FROM people  ORDER BY name ASC
SELECT name FROM people WHERE nationality <> "russia";
SELECT name FROM people WHERE nationality <> 'russia'
SELECT name FROM people WHERE people_id NOT IN (SELECT people_id FROM poker_player)
SELECT name  FROM people  WHERE people_id NOT IN (SELECT DISTINCT people_id FROM poker_player)
SELECT COUNT(DISTINCT nationality) FROM people
SELECT COUNT(DISTINCT nationality) AS number_of_nationalities FROM people
SELECT COUNT(DISTINCT state) AS num_states FROM area_code_state
SELECT contestant_number, contestant_name  FROM contestants  ORDER BY contestant_name DESC;
SELECT vote_id, phone_number, state FROM votes
SELECT MAX(area_code) AS max_area_code, MIN(area_code) AS min_area_code FROM area_code_state;
SELECT MAX(created) FROM votes WHERE state = 'ca'
SELECT contestant_name  FROM contestants  WHERE contestant_name != 'jessie alloway'
SELECT DISTINCT state, created FROM votes
SELECT contestant_number, contestant_name FROM contestants WHERE contestant_number IN (   SELECT contestant_number   FROM votes   GROUP BY contestant_number   HAVING COUNT(*) >= 2 )
SELECT contestant_number, contestant_name FROM contestants WHERE contestant_number = (     SELECT contestant_number     FROM votes     GROUP BY contestant_number     ORDER BY COUNT(*) ASC     LIMIT 1 )
SELECT COUNT(*) FROM votes WHERE state = 'ny' OR state = 'ca';
SELECT COUNT(*)  FROM contestants  WHERE contestant_number NOT IN      (SELECT DISTINCT contestant_number      FROM votes)
SELECT area_code_state.area_code FROM area_code_state JOIN votes ON area_code_state.state = votes.state GROUP BY area_code_state.area_code ORDER BY COUNT(votes.vote_id) DESC LIMIT 1
SELECT votes.created, votes.state, votes.phone_number FROM votes JOIN contestants ON votes.contestant_number = contestants.contestant_number WHERE contestants.contestant_name = 'tabatha gehling'
SELECT area_code_state.area_code FROM area_code_state INNER JOIN votes ON area_code_state.state = votes.state INNER JOIN contestants ON contestants.contestant_number = votes.contestant_number WHERE contestants.contestant_name = 'tabatha gehling' OR contestants.contestant_name = 'kelly clauss' GROUP BY area_code_state.area_code HAVING COUNT(DISTINCT contestants.contestant_name) = 2
SELECT contestant_name  FROM contestants  WHERE contestant_name LIKE '%al%'
SELECT name  FROM country  WHERE indepyear > 1950
SELECT name  FROM country  WHERE indepyear > 1950
SELECT COUNT(*) FROM country WHERE governmentform = 'Republic'
SELECT COUNT(*) FROM country WHERE governmentform = 'Republic'
SELECT SUM(surfacearea) FROM country WHERE region = 'Caribbean'
SELECT SUM(surfacearea)  FROM country  WHERE continent = 'Caribbean';
SELECT country.continent FROM country WHERE country.name = 'Anguilla'
SELECT continent FROM country WHERE code = (SELECT countrycode FROM city WHERE name = 'Anguilla')
SELECT region FROM city JOIN country ON city.countrycode = country.code WHERE city.name = 'kabul'
SELECT region FROM country WHERE name = 'kabul';
SELECT language FROM countrylanguage  WHERE countrycode = 'ABW'  ORDER BY percentage DESC  LIMIT 1;
SELECT language FROM countrylanguage WHERE countrycode = (     SELECT code     FROM country     WHERE name = 'Aruba' ) AND isofficial = 'T' ORDER BY percentage DESC LIMIT 1;
SELECT population, lifeexpectancy FROM country WHERE name = 'Brazil';
SELECT population, lifeexpectancy FROM country WHERE name = 'Brazil'
SELECT region, population FROM country WHERE name = 'Angola'
SELECT country.region, country.population FROM country WHERE country.name = 'Angola'
SELECT AVG(lifeexpectancy) FROM country WHERE region = 'Central Africa'
SELECT AVG(lifeexpectancy)  FROM country  WHERE continent = 'Africa' AND region = 'Central Africa'
SELECT name  FROM country WHERE continent = 'Asia' ORDER BY lifeexpectancy ASC LIMIT 1;
SELECT country.name  FROM country  WHERE country.continent = 'Asia'  ORDER BY country.lifeexpectancy ASC  LIMIT 1
SELECT SUM(country.population) AS total_population, MAX(country.gnp) AS maximum_gnp FROM country WHERE country.continent = 'Asia'
SELECT SUM(city.population) AS total_population, MAX(country.gnp) AS largest_gnp FROM city JOIN country ON city.countrycode = country.code WHERE country.continent = 'Asia'
SELECT AVG(country.lifeexpectancy) FROM country WHERE country.continent = 'Africa' AND country.governmentform = 'Republic'
SELECT AVG(lifeexpectancy)  FROM country  WHERE continent = 'Africa' AND governmentform = 'Republic'
SELECT SUM(surfacearea) FROM country WHERE continent IN ('Asia', 'Europe')
SELECT SUM(surfacearea) AS total_surface_area FROM country WHERE continent IN ('Asia', 'Europe')
SELECT SUM(population)  FROM city  WHERE district = 'gelderland'
SELECT SUM(population)  FROM city  WHERE district = 'gelderland'
SELECT AVG(country.gnp), SUM(country.population) FROM country WHERE country.governmentform = 'US territory'
SELECT AVG(country.gnp) AS mean_gnp, SUM(country.population) AS total_population  FROM country  WHERE country.continent = 'North America'  AND country.region = 'US Territory'
SELECT COUNT(DISTINCT language)  FROM countrylanguage
SELECT COUNT(DISTINCT language) FROM countrylanguage
SELECT COUNT(DISTINCT governmentform)  FROM country  WHERE continent = 'Africa'
SELECT COUNT(DISTINCT governmentform) FROM country WHERE continent = 'Africa';
SELECT COUNT(language) FROM countrylanguage WHERE countrycode = 'ABW'
SELECT COUNT(*) FROM countrylanguage WHERE countrycode = 'ABW';
SELECT COUNT(*)  FROM countrylanguage WHERE countrycode = 'AFG' AND isofficial = 'T';
SELECT country.name FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode GROUP BY country.code ORDER BY COUNT(countrylanguage.language) DESC LIMIT 1;
SELECT country.name FROM country JOIN (     SELECT countrycode, COUNT(DISTINCT language) AS num_languages     FROM countrylanguage     GROUP BY countrycode     ORDER BY num_languages DESC     LIMIT 1 ) AS lang_count ON country.code = lang_count.countrycode
SELECT continent, COUNT(DISTINCT language) AS num_languages FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code GROUP BY continent ORDER BY num_languages DESC LIMIT 1;
SELECT country.continent, COUNT(DISTINCT countrylanguage.language) AS num_languages FROM country INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode GROUP BY country.continent ORDER BY num_languages DESC LIMIT 1;
SELECT COUNT(DISTINCT c1.name) AS num_countries FROM countrylanguage cl1 JOIN countrylanguage cl2 ON cl1.countrycode = cl2.countrycode JOIN country c1 ON cl1.countrycode = c1.code JOIN country c2 ON cl2.countrycode = c2.code WHERE cl1.language = 'English' AND cl2.language = 'Dutch'
SELECT COUNT(DISTINCT country.code) AS number_of_nations FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language IN ('English', 'Dutch') AND countrylanguage.isofficial = 1
SELECT c.name FROM country c JOIN countrylanguage cl1 ON c.code = cl1.countrycode JOIN countrylanguage cl2 ON c.code = cl2.countrycode WHERE cl1.language = 'English' AND cl2.language = 'French' AND cl1.isofficial = 1 AND cl2.isofficial = 1
SELECT DISTINCT country.name  FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = 'English' AND countrylanguage.isofficial = 1 AND EXISTS (   SELECT *    FROM countrylanguage    WHERE country.code = countrylanguage.countrycode    AND countrylanguage.language = 'French'    AND countrylanguage.isofficial = 1 )
SELECT DISTINCT c.name FROM country c INNER JOIN countrylanguage cl1 ON c.code = cl1.countrycode INNER JOIN countrylanguage cl2 ON c.code = cl2.countrycode WHERE cl1.language = 'English' AND cl1.isofficial = 'T'  AND cl2.language = 'French' AND cl2.isofficial = 'T'
SELECT DISTINCT country.name FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE (countrylanguage.language = 'English' AND countrylanguage.isofficial = 'T') AND (countrylanguage.language = 'French' AND countrylanguage.isofficial = 'T')
SELECT COUNT(DISTINCT country.continent) FROM country LEFT JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = 'Chinese'
SELECT COUNT(DISTINCT country.continent) as num_continents  FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = 'Chinese'
SELECT DISTINCT region  FROM country  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE (language = 'English' OR language = 'Dutch')
SELECT DISTINCT country.region  FROM country  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE countrylanguage.language IN ('Dutch', 'English')
SELECT country.name  FROM country  INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE (countrylanguage.language = 'English' OR countrylanguage.language = 'Dutch')  AND countrylanguage.isofficial = 'T'
SELECT country.name  FROM country  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE (countrylanguage.language = 'English' OR countrylanguage.language = 'Dutch')  AND countrylanguage.isofficial = 'T'
SELECT language FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE continent = 'Asia' ORDER BY percentage DESC LIMIT 1;
SELECT countrylanguage.language FROM countrylanguage JOIN country ON countrylanguage.countrycode = country.code WHERE country.continent = 'Asia' GROUP BY countrylanguage.language ORDER BY COUNT(*) DESC LIMIT 1;
SELECT c.language FROM countrylanguage c INNER JOIN country ctry ON c.countrycode = ctry.code WHERE ctry.governmentform = 'Republic' GROUP BY c.language HAVING COUNT(DISTINCT c.countrycode) = 1
SELECT language  FROM countrylanguage  WHERE isofficial = 'T'  AND countrycode IN (     SELECT code      FROM country      WHERE governmentform = 'Republic'     AND code IN (         SELECT countrycode          FROM countrylanguage          GROUP BY countrycode          HAVING COUNT(*) = 1     ) )
SELECT city.name  FROM city  JOIN countrylanguage ON city.countrycode = countrylanguage.countrycode  WHERE countrylanguage.language = 'English'  ORDER BY city.population DESC  LIMIT 1
SELECT city.name FROM city INNER JOIN countrylanguage ON city.countrycode = countrylanguage.countrycode WHERE countrylanguage.language = 'English' ORDER BY city.population DESC LIMIT 1
SELECT country.name, country.population, country.lifeexpectancy FROM country WHERE country.continent = 'Asia' ORDER BY country.surfacearea DESC LIMIT 1;
SELECT country.name, country.population, country.lifeexpectancy FROM country WHERE country.continent = 'Asia' ORDER BY country.surfacearea DESC LIMIT 1
SELECT AVG(lifeexpectancy)  FROM country  WHERE code IN (     SELECT countrycode      FROM countrylanguage      WHERE language = 'English' AND isofficial = 'F' )
SELECT AVG(lifeexpectancy)  FROM country  WHERE code NOT IN (     SELECT countrycode      FROM countrylanguage      WHERE language = 'English'      AND isofficial = 'T' )
SELECT SUM(population)  FROM country  WHERE code NOT IN (     SELECT DISTINCT countrycode      FROM countrylanguage      WHERE language = 'English'      AND isofficial = 'T' )
SELECT SUM(c.population) FROM country c LEFT JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language <> 'English' OR cl.language IS NULL
SELECT SUM(population)  FROM country  WHERE code NOT IN (     SELECT countrycode      FROM countrylanguage      WHERE language = 'English'      AND isofficial = 'T' )
SELECT countrylanguage.language  FROM countrylanguage  JOIN country ON countrylanguage.countrycode = country.code  WHERE country.headofstate = 'beatrix'
SELECT language FROM countrylanguage WHERE countrycode IN (     SELECT code     FROM country     WHERE headofstate = 'Beatrix' ) AND isofficial = 'T';
SELECT COUNT(DISTINCT cl.language) AS total_languages FROM countrylanguage cl JOIN country c ON c.code = cl.countrycode WHERE c.indepyear < 1930 AND cl.isofficial = TRUE
SELECT COUNT(DISTINCT language)  FROM country  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE country.indepyear < 1930  AND countrylanguage.isofficial = 'T'
SELECT name  FROM country  WHERE surfacearea > (SELECT MAX(surfacearea) FROM country WHERE continent = 'Europe')
SELECT name  FROM country  WHERE surfacearea > (SELECT MAX(surfacearea) FROM country WHERE continent = 'Europe')
SELECT code, name FROM country WHERE continent = 'Africa'  AND population < (SELECT MIN(population) FROM country WHERE continent = 'Asia')
SELECT name  FROM country  WHERE continent = 'Africa'  AND population < (SELECT MIN(population) FROM country WHERE continent = 'Asia')
SELECT country.name FROM country WHERE country.continent = 'Asia'  AND country.population >  (SELECT MAX(population)  FROM country  WHERE country.continent = 'Africa')
SELECT country1.name FROM country AS country1 WHERE country1.continent = 'Asia' AND country1.population > ALL (     SELECT country2.population     FROM country AS country2     WHERE country2.continent = 'Africa' )
SELECT country.code FROM country WHERE country.code NOT IN     (SELECT countrylanguage.countrycode     FROM countrylanguage     WHERE countrylanguage.language = 'English'     AND countrylanguage.isofficial = 'T')
SELECT country.code FROM country WHERE country.code NOT IN (     SELECT countrycode     FROM countrylanguage     WHERE language = 'English' )
SELECT DISTINCT country.code FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language <> 'English'
SELECT DISTINCT country.code  FROM country  INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE countrylanguage.language <> 'English'
SELECT code FROM country WHERE code NOT IN (     SELECT countrycode FROM countrylanguage     WHERE language = 'English' ) AND governmentform <> 'Republic'
SELECT country.code FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language <> 'English' AND country.governmentform <> 'Republic'
SELECT city.name  FROM city  JOIN country ON city.countrycode = country.code  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE country.continent = 'Europe'  AND countrylanguage.language != 'English' AND countrylanguage.isofficial = 'F' ```
SELECT city.name  FROM city  JOIN country ON city.countrycode = country.code  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE country.continent = 'Europe'  AND countrylanguage.language <> 'English'  AND countrylanguage.isofficial <> 'T'
SELECT DISTINCT city.name  FROM city  INNER JOIN country ON city.countrycode = country.code  INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE country.continent = 'Asia'  AND countrylanguage.language = 'Chinese'  AND countrylanguage.isofficial = 'T'
SELECT city.name  FROM city  JOIN country ON city.countrycode = country.code  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE country.continent = 'Asia'  AND countrylanguage.language = 'Chinese'  AND countrylanguage.isofficial = 'T'
SELECT name, indepyear, surfacearea FROM country ORDER BY population ASC LIMIT 1;
SELECT country.name, country.indepyear, country.surfacearea FROM country WHERE country.population = (SELECT MIN(population) FROM country)
SELECT population, name, headofstate FROM country WHERE surfacearea = (     SELECT MAX(surfacearea)     FROM country )
SELECT country.name, country.population, country.headofstate  FROM country  WHERE country.surfacearea = (SELECT MAX(surfacearea) FROM country)
SELECT country.name, COUNT(countrylanguage.language) AS number_of_languages FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode GROUP BY country.name HAVING COUNT(countrylanguage.language) >= 3
SELECT country.name, COUNT(countrylanguage.language) AS language_count FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode GROUP BY country.name HAVING COUNT(countrylanguage.language) > 2
SELECT district, COUNT(*) AS num_cities FROM city WHERE population > (SELECT AVG(population) FROM city) GROUP BY district
SELECT district, COUNT(*) FROM city  WHERE population > (SELECT AVG(population) FROM city)  GROUP BY district
SELECT governmentform, SUM(population) as total_population FROM country WHERE lifeexpectancy > 72 GROUP BY governmentform
SELECT governmentform, SUM(population) AS total_population FROM country WHERE lifeexpectancy > 72 GROUP BY governmentform
SELECT continent, AVG(lifeexpectancy) AS average_life_expectancy, SUM(population) AS total_population FROM country WHERE AVG(lifeexpectancy) < 72 GROUP BY continent
SELECT country.continent, SUM(country.population) AS total_population, AVG(country.lifeexpectancy) AS average_life_expectancy  FROM country  GROUP BY country.continent  HAVING average_life_expectancy < 72
SELECT name, surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5
SELECT name, surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5
SELECT name FROM country ORDER BY population DESC LIMIT 3;
SELECT name FROM country ORDER BY population DESC LIMIT 3;
SELECT name FROM country ORDER BY population LIMIT 3;
SELECT name FROM country ORDER BY population ASC LIMIT 3
SELECT COUNT(*) FROM country WHERE continent = 'Asia'
SELECT COUNT(*) FROM country WHERE continent = 'Asia';
SELECT name  FROM country  WHERE continent = 'Europe' AND population = 80000;
SELECT name FROM country WHERE continent = 'Europe' AND population = 80000
SELECT SUM(country.population) AS total_population, AVG(country.surfacearea) AS average_area FROM country WHERE country.continent = 'North America' AND country.surfacearea > 3000
SELECT SUM(c.population) AS total_population, AVG(c.surfacearea) AS average_surface_area FROM country c WHERE c.continent = 'North America' AND c.surfacearea > 3000;
SELECT name FROM city WHERE population BETWEEN 160000 AND 900000
SELECT name  FROM city  WHERE population BETWEEN 160000 AND 900000;
SELECT language FROM countrylanguage GROUP BY language HAVING COUNT(DISTINCT countrycode) = (     SELECT MAX(country_count)     FROM (         SELECT COUNT(DISTINCT countrycode) AS country_count         FROM countrylanguage         GROUP BY language     ) )
SELECT language  FROM countrylanguage  GROUP BY language  HAVING COUNT(DISTINCT countrycode) = (SELECT COUNT(DISTINCT countrycode)                                        FROM countrylanguage                                        GROUP BY countrycode                                        ORDER BY COUNT(*) DESC                                        LIMIT 1)
SELECT country.name, countrylanguage.language FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.percentage = (SELECT MAX(percentage) FROM countrylanguage GROUP BY countrycode) ORDER BY country.name ASC;
SELECT country.code, countrylanguage.language  FROM country  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE country.language_percentage = (SELECT MAX(percentage) FROM countrylanguage)  GROUP BY country.code
SELECT COUNT(*) FROM countrylanguage WHERE language = 'Spanish' AND percentage = (   SELECT MAX(percentage) FROM countrylanguage WHERE language = 'Spanish' )
SELECT COUNT(*) FROM countrylanguage WHERE language = 'Spanish' AND percentage > 50
SELECT country.code  FROM country  INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE countrylanguage.language = 'Spanish'  ORDER BY countrylanguage.percentage DESC  LIMIT 1
SELECT country.code FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = 'Spanish' AND countrylanguage.percentage > 50
SELECT COUNT(*) AS count FROM conductor
SELECT COUNT(*) FROM conductor
SELECT name FROM conductor ORDER BY age ASC;
SELECT name FROM conductor ORDER BY age
SELECT name  FROM conductor  WHERE nationality <> 'usa'
SELECT name FROM conductor WHERE nationality <> "usa"
SELECT orchestra.record_company FROM orchestra ORDER BY orchestra.year_of_founded DESC
SELECT record_company FROM orchestra ORDER BY year_of_founded DESC
SELECT AVG(attendance) FROM show
SELECT AVG(attendance) FROM show
SELECT MAX(share), MIN(share) FROM performance WHERE type <> 'live final'
SELECT MAX(share), MIN(share)  FROM performance WHERE type <> 'live final'
SELECT COUNT(DISTINCT nationality)  FROM conductor
SELECT COUNT(DISTINCT nationality) FROM conductor
SELECT name  FROM conductor  ORDER BY year_of_work DESC;
SELECT name  FROM conductor  ORDER BY year_of_work DESC
SELECT c.name  FROM conductor c  ORDER BY c.year_of_work DESC  LIMIT 1;
SELECT conductor.name  FROM conductor  WHERE conductor.year_of_work = (     SELECT MAX(year_of_work)      FROM conductor )
SELECT conductor.name, orchestra.orchestra FROM conductor JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id
SELECT conductor.name, orchestra.orchestra FROM conductor JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id
SELECT c.name  FROM conductor c  JOIN orchestra o ON c.conductor_id = o.conductor_id GROUP BY c.conductor_id  HAVING COUNT(DISTINCT o.orchestra_id) > 1
SELECT conductor.name FROM conductor JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id GROUP BY conductor.name HAVING COUNT(DISTINCT orchestra.orchestra_id) > 1
SELECT c.name FROM conductor c JOIN orchestra o ON c.conductor_id = o.conductor_id GROUP BY c.name HAVING COUNT(DISTINCT o.orchestra_id) = (     SELECT COUNT(DISTINCT o2.orchestra_id)     FROM conductor c2     JOIN orchestra o2 ON c2.conductor_id = o2.conductor_id     GROUP BY c2.conductor_id     ORDER BY COUNT(DISTINCT o2.orchestra_id) DESC     LIMIT 1 )
SELECT conductor.name  FROM conductor  JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id  GROUP BY conductor.name  ORDER BY COUNT(orchestra.orchestra_id) DESC  LIMIT 1
SELECT conductor.name  FROM conductor  JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id  WHERE orchestra.year_of_founded > 2008
SELECT conductor.name  FROM conductor  JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id  WHERE orchestra.year_of_founded > 2008
SELECT record_company, COUNT(orchestra_id) AS number_of_orchestras FROM orchestra GROUP BY record_company
SELECT record_company, COUNT(DISTINCT orchestra_id) AS num_orchestras FROM orchestra GROUP BY record_company;
SELECT major_record_format, COUNT(*) AS count FROM orchestra GROUP BY major_record_format ORDER BY count ASC;
SELECT major_record_format, COUNT(*) AS frequency FROM orchestra GROUP BY major_record_format ORDER BY frequency DESC
SELECT record_company FROM orchestra GROUP BY record_company HAVING COUNT(*) = (     SELECT MAX(record_count)     FROM (         SELECT COUNT(*) as record_count         FROM orchestra         GROUP BY record_company     ) AS counts )
SELECT record_company FROM orchestra GROUP BY record_company HAVING COUNT(orchestra_id) = (     SELECT MAX(num_orchestras)     FROM (         SELECT record_company, COUNT(orchestra_id) as num_orchestras         FROM orchestra         GROUP BY record_company     ) as tmp )
SELECT orchestra.name FROM orchestra LEFT JOIN performance ON orchestra.orchestra_id = performance.orchestra_id WHERE performance.performance_id IS NULL
SELECT orchestra.orchestra_id, orchestra.orchestra FROM orchestra LEFT JOIN performance ON orchestra.orchestra_id = performance.orchestra_id WHERE performance.performance_id IS NULL;
SELECT orchestra.record_company  FROM orchestra  WHERE orchestra.year_of_founded < 2003 OR orchestra.year_of_founded > 2003;
SELECT record_company FROM orchestra WHERE year_of_founded < 2003 INTERSECT SELECT record_company FROM orchestra WHERE year_of_founded > 2003
SELECT COUNT(*)  FROM orchestra  WHERE major_record_format = "cd" OR major_record_format = "dvd";
SELECT COUNT(DISTINCT orchestra_id)  FROM orchestra  WHERE major_record_format IN ('cd', 'dvd')
SELECT orchestra.year_of_founded FROM orchestra JOIN (     SELECT orchestra_id     FROM performance     GROUP BY orchestra_id     HAVING COUNT(*) > 1 ) AS p ON orchestra.orchestra_id = p.orchestra_id
SELECT orchestra.year_of_founded FROM orchestra JOIN performance ON orchestra.orchestra_id = performance.orchestra_id GROUP BY orchestra.orchestra_id HAVING COUNT(*) > 1
SELECT COUNT(*) FROM highschooler
SELECT COUNT(*)  FROM highschooler;
SELECT name, grade FROM highschooler
SELECT name, grade  FROM highschooler
SELECT grade  FROM highschooler;
SELECT grade FROM highschooler
SELECT highschooler.grade  FROM highschooler  WHERE highschooler.name = 'kyle';
SELECT grade FROM highschooler WHERE name = 'kyle'
SELECT name FROM highschooler WHERE grade = 10
SELECT name  FROM highschooler  WHERE grade = 10
SELECT id FROM highschooler WHERE name = 'kyle';
SELECT id  FROM highschooler  WHERE name = 'kyle'
SELECT COUNT(*) FROM highschooler WHERE grade = 9 OR grade = 10;
SELECT COUNT(*)  FROM highschooler  WHERE grade IN (9, 10)
SELECT grade, COUNT(*) as num_highschoolers FROM highschooler GROUP BY grade
SELECT grade, COUNT(*) FROM highschooler GROUP BY grade;
SELECT grade FROM highschooler GROUP BY grade HAVING COUNT(*) = (     SELECT MAX(count)     FROM (         SELECT COUNT(*) AS count         FROM highschooler         GROUP BY grade     ) AS counts )
SELECT grade  FROM highschooler  GROUP BY grade  ORDER BY COUNT(id) DESC  LIMIT 1
SELECT grade FROM highschooler GROUP BY grade HAVING COUNT(student_id) >= 4
SELECT grade FROM highschooler GROUP BY grade HAVING COUNT(*) >= 4
SELECT highschooler.id AS student_id, COUNT(friend.friend_id) AS friend_count FROM highschooler LEFT JOIN friend ON friend.student_id = highschooler.id GROUP BY highschooler.id;
SELECT highschooler.name, COUNT(friend.friend_id) AS friend_count FROM highschooler LEFT JOIN friend ON friend.student_id = highschooler.id GROUP BY highschooler.name
SELECT highschooler.name, COUNT(friend.friend_id) AS number_of_friends FROM highschooler JOIN friend ON highschooler.id = friend.student_id GROUP BY highschooler.name
SELECT highschooler.name, COUNT(friend.friend_id) AS friend_count FROM highschooler LEFT JOIN friend ON friend.student_id = highschooler.id GROUP BY highschooler.name ORDER BY friend_count DESC;
SELECT highschooler.name FROM highschooler WHERE highschooler.id IN (   SELECT friend.student_id   FROM friend   GROUP BY friend.student_id   HAVING COUNT(friend.friend_id) = (     SELECT MAX(friendCount.count)     FROM (       SELECT friend.student_id, COUNT(friend.friend_id) AS count       FROM friend       GROUP BY friend.student_id     ) friendCount   ) )
SELECT h.name FROM highschooler h JOIN friend f ON f.student_id = h.id GROUP BY h.name ORDER BY COUNT(f.friend_id) DESC LIMIT 1;
SELECT highschooler.name FROM highschooler JOIN friend ON friend.friend_id = highschooler.id GROUP BY highschooler.name HAVING COUNT(friend.friend_id) >= 3
SELECT highschooler.name FROM highschooler JOIN friend ON friend.student_id = highschooler.id GROUP BY highschooler.id HAVING COUNT(friend.friend_id) >= 3
SELECT highschooler.name  FROM highschooler  JOIN friend ON friend.friend_id = highschooler.id  WHERE friend.student_id = (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT highschooler.name FROM highschooler JOIN friend ON friend.friend_id = highschooler.id WHERE highschooler.name = 'kyle'
SELECT COUNT(*) FROM friend WHERE student_id = (     SELECT id FROM highschooler WHERE name = 'kyle' )
SELECT COUNT(*)  FROM friend  WHERE student_id = (SELECT id FROM highschooler WHERE name = 'Kyle')
SELECT id FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)
SELECT highschooler.id FROM highschooler LEFT JOIN friend ON friend.student_id = highschooler.id WHERE friend.friend_id IS NULL
SELECT name  FROM highschooler WHERE id NOT IN (     SELECT student_id      FROM friend )
SELECT highschooler.name  FROM highschooler  WHERE highschooler.id NOT IN (SELECT friend.student_id FROM friend)
SELECT highschooler.id FROM highschooler JOIN friend ON friend.friend_id = highschooler.id AND friend.student_id = highschooler.id JOIN likes ON likes.student_id = highschooler.id WHERE highschooler.id IN (SELECT liked_id FROM likes)
SELECT highschooler.id FROM highschooler JOIN friend ON friend.student_id = highschooler.id JOIN likes ON likes.student_id = highschooler.id WHERE friend.friend_id = highschooler.id AND likes.liked_id = highschooler.id;
SELECT highschooler.name FROM highschooler INNER JOIN friend ON friend.student_id = highschooler.id INNER JOIN likes ON likes.student_id = highschooler.id WHERE highschooler.id = friend.friend_id AND highschooler.id = likes.liked_id
SELECT h.name FROM highschooler h JOIN friend f ON f.student_id = h.id JOIN likes l ON l.student_id = h.id WHERE f.friend_id = h.id AND l.liked_id = h.id
SELECT student_id, COUNT(*) AS num_likes FROM likes GROUP BY student_id
SELECT student_id, COUNT(*) AS num_likes FROM likes GROUP BY student_id
SELECT highschooler.name, COUNT(likes.liked_id) AS number_of_likes FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY highschooler.name
SELECT highschooler.name, COUNT(likes.*) AS num_likes FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY highschooler.name;
SELECT highschooler.name FROM highschooler WHERE highschooler.id = (     SELECT student_id     FROM likes     GROUP BY student_id     ORDER BY COUNT(*) DESC     LIMIT 1 )
SELECT highschooler.name  FROM highschooler  WHERE highschooler.id IN(     SELECT likes.student_id      FROM likes      GROUP BY likes.student_id      ORDER BY COUNT(*) DESC      LIMIT 1 )
SELECT highschooler.name FROM highschooler JOIN likes ON highschooler.id = likes.student_id GROUP BY highschooler.name HAVING COUNT(likes.liked_id) >= 2;
SELECT highschooler.name FROM highschooler JOIN likes ON likes.student_id = highschooler.id GROUP BY highschooler.name HAVING COUNT(likes.student_id) >= 2
SELECT highschooler.name FROM highschooler WHERE highschooler.grade > 5 AND highschooler.id IN (     SELECT friend.student_id     FROM friend     GROUP BY friend.student_id     HAVING COUNT(friend.friend_id) >= 2 )
SELECT highschooler.name FROM highschooler WHERE highschooler.grade > 5 AND (     SELECT COUNT(*)     FROM friend     WHERE friend.student_id = highschooler.id ) >= 2
SELECT COUNT(*) FROM likes WHERE student_id = (SELECT id FROM highschooler WHERE name = 'kyle')
SELECT COUNT(*)  FROM likes  JOIN highschooler ON likes.student_id = highschooler.id  WHERE highschooler.name = 'kyle'
SELECT AVG(h.grade) FROM highschooler h WHERE h.id IN (     SELECT f.student_id FROM friend f     WHERE f.friend_id = h.id )
SELECT AVG(highschooler.grade) FROM highschooler WHERE highschooler.id IN (   SELECT friend.student_id   FROM friend )
SELECT MIN(grade)  FROM highschooler  WHERE id NOT IN  (SELECT student_id  FROM friend)
SELECT MIN(highschooler.grade) FROM highschooler WHERE highschooler.id NOT IN (SELECT friend.student_id FROM friend)
SELECT DISTINCT owners.state FROM owners INNER JOIN professionals ON owners.state = professionals.state
SELECT owners.state FROM owners JOIN professionals ON owners.state = professionals.state
SELECT AVG(age)  FROM dogs  WHERE dog_id IN (SELECT dog_id FROM treatments)
SELECT AVG(age) FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id
SELECT professional_id, last_name, cell_number  FROM professionals  WHERE state = 'indiana' OR professional_id IN (    SELECT professional_id     FROM treatments     GROUP BY professional_id     HAVING COUNT(*) > 2 )
SELECT professional_id, last_name, cell_number FROM professionals WHERE state = 'indiana' OR professional_id IN (SELECT professional_id FROM treatments GROUP BY professional_id HAVING COUNT(*) > 2)
SELECT d.name FROM dogs d JOIN treatments t ON d.dog_id = t.dog_id JOIN charges c ON t.charge_id = c.charge_id GROUP BY d.name HAVING SUM(c.charge_amount) <= 1000
SELECT dogs.name FROM dogs JOIN owners ON dogs.owner_id = owners.owner_id WHERE dogs.dog_id NOT IN (     SELECT treatments.dog_id     FROM treatments     JOIN professionals ON treatments.professional_id = professionals.professional_id     JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code     WHERE treatments.cost_of_treatment > 1000 )
SELECT DISTINCT first_name FROM (     SELECT first_name FROM professionals     UNION     SELECT first_name FROM owners ) AS names WHERE first_name NOT IN (     SELECT name FROM dogs ) ORDER BY first_name;
SELECT DISTINCT first_name  FROM (SELECT first_name FROM owners UNION SELECT first_name FROM professionals) AS names WHERE names.first_name NOT IN (SELECT name FROM dogs)
SELECT professionals.professional_id, professionals.role_code, professionals.email_address FROM professionals WHERE professionals.professional_id NOT IN (     SELECT treatments.professional_id     FROM treatments     )
SELECT professional_id, role_code, email_address FROM professionals WHERE professional_id NOT IN (     SELECT professional_id     FROM treatments )
SELECT owners.owner_id, owners.first_name, owners.last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id GROUP BY owners.owner_id, owners.first_name, owners.last_name ORDER BY COUNT(dogs.dog_id) DESC LIMIT 1;
SELECT owners.owner_id, owners.first_name, owners.last_name  FROM owners  JOIN dogs ON owners.owner_id = dogs.owner_id  GROUP BY owners.owner_id, owners.first_name, owners.last_name  HAVING COUNT(dogs.dog_id) = (     SELECT MAX(dog_count)      FROM (         SELECT COUNT(dog_id) as dog_count          FROM dogs          GROUP BY owner_id     ) AS dog_counts )
SELECT professional_id, role_code, first_name FROM professionals WHERE professional_id IN (     SELECT professional_id     FROM treatments     GROUP BY professional_id     HAVING COUNT(*) >= 2 )
SELECT professional_id, role_code, first_name  FROM professionals  WHERE professional_id IN      (SELECT professional_id       FROM treatments       GROUP BY professional_id       HAVING COUNT(*) >= 2)
SELECT breed_name FROM breeds WHERE breed_code = (   SELECT breed_code   FROM dogs   GROUP BY breed_code   ORDER BY COUNT(*) DESC   LIMIT 1 )
SELECT breed_name  FROM breeds  WHERE breed_code = (   SELECT breed_code    FROM dogs    GROUP BY breed_code    ORDER BY COUNT(*) DESC    LIMIT 1 )
SELECT owners.owner_id, owners.last_name FROM owners JOIN dogs ON dogs.owner_id = owners.owner_id JOIN treatments ON treatments.dog_id = dogs.dog_id GROUP BY owners.owner_id, owners.last_name ORDER BY COUNT(treatments.treatment_id) DESC LIMIT 1
SELECT owners.owner_id, owners.last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN treatments ON dogs.dog_id = treatments.dog_id GROUP BY owners.owner_id, owners.last_name ORDER BY SUM(treatments.cost_of_treatment) DESC LIMIT 1
SELECT treatment_types.treatment_type_description FROM treatment_types WHERE treatment_types.treatment_type_code = (   SELECT treatments.treatment_type_code   FROM treatments   GROUP BY treatments.treatment_type_code   ORDER BY SUM(treatments.cost_of_treatment) ASC   LIMIT 1 )
SELECT treatment_types.treatment_type_description FROM treatment_types JOIN treatments ON treatment_types.treatment_type_code = treatments.treatment_type_code GROUP BY treatment_types.treatment_type_description HAVING SUM(treatments.cost_of_treatment) = (   SELECT MIN(total_cost)   FROM (     SELECT treatment_types.treatment_type_description, SUM(treatments.cost_of_treatment) AS total_cost     FROM treatment_types     JOIN treatments ON treatment_types.treatment_type_code = treatments.treatment_type_code     GROUP BY treatment_types.treatment_type_description   ) AS total_costs )
SELECT owners.owner_id, owners.zip_code FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN treatments ON dogs.dog_id = treatments.dog_id JOIN charges ON treatments.charge_id = charges.charge_id GROUP BY owners.owner_id, owners.zip_code ORDER BY SUM(charges.charge_amount) DESC LIMIT 1
SELECT dogs.owner_id, owners.zip_code FROM dogs JOIN owners ON dogs.owner_id = owners.owner_id GROUP BY dogs.owner_id, owners.zip_code ORDER BY SUM( SELECT cost_of_treatment FROM treatments WHERE treatments.dog_id = dogs.dog_id ) DESC LIMIT 1
SELECT professional_id, cell_number FROM professionals WHERE professional_id IN(     SELECT professional_id     FROM treatments     GROUP BY professional_id     HAVING COUNT(DISTINCT treatment_type_code) >= 2 )
SELECT professionals.professional_id, professionals.cell_number  FROM professionals  INNER JOIN treatments ON treatments.professional_id = professionals.professional_id  GROUP BY professionals.professional_id  HAVING COUNT(DISTINCT treatments.treatment_type_code) >= 2
SELECT professionals.first_name, professionals.last_name FROM professionals JOIN treatments ON treatments.professional_id = professionals.professional_id WHERE treatments.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments)
SELECT first_name, last_name FROM professionals WHERE professional_id IN (   SELECT professional_id   FROM treatments   WHERE cost_of_treatment < (     SELECT AVG(cost_of_treatment)     FROM treatments   ) )
SELECT t.date_of_treatment, p.first_name FROM treatments t JOIN professionals p ON t.professional_id = p.professional_id
SELECT treatments.date_of_treatment, professionals.first_name  FROM treatments  JOIN professionals ON treatments.professional_id = professionals.professional_id
SELECT treatments.cost_of_treatment, treatment_types.treatment_type_description FROM treatments INNER JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT treatments.cost_of_treatment, treatment_types.treatment_type_description FROM treatments JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT owners.first_name, owners.last_name, sizes.size_description FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN sizes ON dogs.size_code = sizes.size_code
SELECT owners.first_name, owners.last_name, sizes.size_description FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id JOIN sizes ON dogs.size_code = sizes.size_code
SELECT owners.first_name, dogs.name FROM owners JOIN dogs ON dogs.owner_id = owners.owner_id
SELECT owners.first_name, dogs.name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id
SELECT dogs.name, treatments.date_of_treatment FROM dogs INNER JOIN breeds ON dogs.breed_code = breeds.breed_code INNER JOIN treatments ON dogs.dog_id = treatments.dog_id WHERE breeds.breed_name = (     SELECT breed_name     FROM breeds     GROUP BY breed_name     ORDER BY COUNT(*) ASC     LIMIT 1 )
SELECT dogs.name, treatments.date_of_treatment FROM dogs JOIN breeds ON dogs.breed_code = breeds.breed_code JOIN treatments ON dogs.dog_id = treatments.dog_id WHERE breeds.breed_name = 'rarest' ORDER BY dogs.name ASC, treatments.date_of_treatment ASC;
SELECT owners.first_name, dogs.name FROM dogs INNER JOIN owners ON dogs.owner_id = owners.owner_id WHERE owners.state = 'virginia'
SELECT owners.first_name, dogs.name  FROM owners  JOIN dogs ON owners.owner_id = dogs.owner_id  WHERE owners.state = 'Virginia'
SELECT dogs.date_arrived, dogs.date_departed FROM dogs INNER JOIN treatments ON dogs.dog_id = treatments.dog_id
SELECT date_arrived, date_departed FROM dogs INNER JOIN treatments ON dogs.dog_id = treatments.dog_id
SELECT owners.last_name  FROM owners  WHERE owners.owner_id = dogs.owner_id  AND dogs.age = (SELECT MIN(dogs.age) FROM dogs)
SELECT owners.last_name  FROM owners  JOIN dogs ON owners.owner_id = dogs.owner_id  WHERE dogs.age = (SELECT MIN(age) FROM dogs)
SELECT email_address FROM professionals WHERE state = 'Hawaii' OR state = 'Wisconsin'
SELECT email_address FROM professionals WHERE state = 'Hawaii' OR state = 'Wisconsin';
SELECT date_arrived, date_departed FROM dogs;
SELECT date_arrived, date_departed FROM dogs
SELECT COUNT(distinct(dog_id)) FROM treatments
SELECT COUNT(*) FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id
SELECT COUNT(DISTINCT professional_id) FROM treatments
SELECT COUNT(DISTINCT professional_id)  FROM treatments
SELECT role_code, street, city, state FROM professionals WHERE city LIKE '%west%'
SELECT role_code, street, city, state  FROM professionals  WHERE city LIKE '%west%';
SELECT first_name, last_name, email_address FROM owners WHERE UPPER(state) LIKE '%NORTH%'
SELECT first_name, last_name, email_address  FROM owners  WHERE state LIKE '%north%'
SELECT COUNT(*)  FROM dogs  WHERE age < (     SELECT AVG(age)      FROM dogs )
SELECT COUNT(*)  FROM dogs  WHERE age < (SELECT AVG(age) FROM dogs)
SELECT MAX(date_of_treatment)  FROM treatments;
SELECT cost_of_treatment  FROM treatments ORDER BY date_of_treatment DESC  LIMIT 1;
SELECT COUNT(*) FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments)
SELECT COUNT(*) FROM dogs WHERE dog_id NOT IN (SELECT dog_id FROM treatments)
SELECT COUNT(*) FROM owners WHERE owner_id NOT IN (SELECT DISTINCT owner_id FROM dogs)
SELECT COUNT(*) FROM owners WHERE owner_id NOT IN (SELECT owner_id FROM dogs)
SELECT COUNT(*) FROM professionals WHERE professional_id NOT IN (SELECT professional_id FROM treatments)
SELECT COUNT(*)  FROM professionals  WHERE professional_id NOT IN (SELECT DISTINCT professional_id FROM treatments)
SELECT name, age, weight FROM dogs WHERE abandoned_yn = 1
SELECT name, age, weight FROM dogs WHERE abandoned_yn = 1
SELECT AVG(age)  FROM dogs
SELECT AVG(age) FROM dogs
SELECT MAX(age) FROM dogs
SELECT MAX(age) FROM dogs
SELECT charge_type, charge_amount FROM charges
SELECT charge_type, charge_amount FROM charges
SELECT MAX(charge_amount) AS max_charge_amount  FROM charges
SELECT MAX(charge_amount) FROM charges
SELECT email_address, cell_number, home_phone FROM professionals
SELECT email_address, cell_number, home_phone FROM professionals
SELECT breed_name, size_description FROM breeds, sizes
SELECT DISTINCT dogs.breed_code, dogs.size_code FROM dogs
SELECT professionals.first_name, treatment_types.treatment_type_description FROM professionals JOIN treatments ON professionals.professional_id = treatments.professional_id JOIN treatment_types ON treatments.treatment_type_code = treatment_types.treatment_type_code
SELECT professionals.first_name, treatment_types.treatment_type_description FROM professionals JOIN treatments ON treatments.professional_id = professionals.professional_id JOIN treatment_types ON treatment_types.treatment_type_code = treatments.treatment_type_code
SELECT COUNT(*) FROM singer
SELECT COUNT(*) FROM singer;
SELECT name FROM singer ORDER BY net_worth_millions ASC
SELECT name  FROM singer  ORDER BY net_worth_millions ASC;
SELECT birth_year, citizenship FROM singer
SELECT birth_year, citizenship  FROM singer
SELECT name FROM singer WHERE citizenship <> 'france'
SELECT name FROM singer WHERE citizenship <> 'French'
SELECT name FROM singer WHERE birth_year = 1948 OR birth_year = 1949;
SELECT name FROM singer WHERE birth_year = 1948 OR birth_year = 1949
SELECT name FROM singer ORDER BY net_worth_millions DESC LIMIT 1;
SELECT singer.name  FROM singer  ORDER BY singer.net_worth_millions DESC  LIMIT 1
SELECT citizenship, COUNT(*) AS num_singers FROM singer GROUP BY citizenship;
SELECT citizenship, COUNT(*) AS count_singers FROM singer GROUP BY citizenship;
SELECT citizenship, COUNT(*) AS count FROM singer GROUP BY citizenship ORDER BY count DESC LIMIT 1;
SELECT citizenship, COUNT(*) AS count FROM singer GROUP BY citizenship ORDER BY count DESC LIMIT 1;
SELECT citizenship, MAX(net_worth_millions) AS maximum_net_worth FROM singer GROUP BY citizenship;
SELECT citizenship, max(net_worth_millions) AS maximum_net_worth FROM singer GROUP BY citizenship
SELECT song.title, singer.name FROM song JOIN singer ON song.singer_id = singer.singer_id
SELECT song.title, singer.name FROM song JOIN singer ON song.singer_id = singer.singer_id
SELECT DISTINCT singer.name FROM singer INNER JOIN song ON singer.singer_id = song.singer_id WHERE song.sales > 300000;
SELECT DISTINCT singer.name FROM singer JOIN song ON song.singer_id = singer.singer_id WHERE song.sales > 300000;
SELECT singer.name FROM singer INNER JOIN song ON singer.singer_id = song.singer_id GROUP BY singer.name HAVING COUNT(song.song_id) > 1;
SELECT singer.name FROM singer JOIN song ON singer.singer_id = song.singer_id GROUP BY singer.singer_id, singer.name HAVING COUNT(song.song_id) > 1
SELECT singer.name, SUM(song.sales) AS total_sales FROM singer INNER JOIN song ON singer.singer_id = song.singer_id GROUP BY singer.name
SELECT singer.name, SUM(song.sales) AS total_sales FROM singer INNER JOIN song ON singer.singer_id = song.singer_id GROUP BY singer.name
SELECT name FROM singer WHERE singer_id NOT IN (SELECT singer_id FROM song)
SELECT singer.name  FROM singer  WHERE singer.singer_id NOT IN (SELECT song.singer_id FROM song)
SELECT DISTINCT citizenship FROM singer WHERE birth_year < 1945 AND birth_year > 1955
SELECT DISTINCT citizenship  FROM singer  WHERE birth_year < 1945 AND birth_year > 1955
SELECT COUNT(*) FROM other_available_features;
SELECT feature_type_name  FROM ref_feature_types  JOIN other_available_features ON ref_feature_types.feature_type_code = other_available_features.feature_type_code  WHERE feature_name = 'aircon';
SELECT ref_property_types.property_type_description FROM properties INNER JOIN ref_property_types ON properties.property_type_code = ref_property_types.property_type_code WHERE properties.property_id = [property_id code];
SELECT property_name  FROM properties  WHERE property_type_code IN (   SELECT property_type_code    FROM ref_property_types    WHERE property_type_description IN ('house', 'apartment') )  AND room_count > 1