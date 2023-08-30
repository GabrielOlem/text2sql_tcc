SELECT COUNT(*) FROM singer<separator>SELECT COUNT(*) FROM singer<separator>SELECT name, country, age
FROM singer
ORDER BY age DESC<separator>SELECT name, country, age
FROM singer
ORDER BY age DESC<separator>SELECT AVG(age), MIN(age), MAX(age)
FROM singer
WHERE country = 'france'<separator>SELECT AVG(age), MIN(age), MAX(age) 
FROM singer 
WHERE country = 'France'<separator>SELECT singer.name, singer.song_release_year
FROM singer
WHERE singer.age = (
  SELECT MIN(age) 
  FROM singer
)<separator>SELECT name, song_release_year
FROM singer
WHERE age = (SELECT MIN(age) FROM singer)<separator>SELECT DISTINCT country 
FROM singer 
WHERE age > 20<separator>SELECT DISTINCT country
FROM singer
WHERE age > 20<separator>SELECT singer.country, COUNT(singer.singer_id) 
FROM singer 
GROUP BY singer.country<separator>SELECT country, COUNT(singer_id) as count
FROM singer
GROUP BY country<separator>SELECT song_name
FROM singer
WHERE age > (SELECT AVG(age) FROM singer)<separator>SELECT song_name
FROM singer
WHERE age > (SELECT AVG(age) FROM singer)<separator>SELECT location, name 
FROM stadium 
WHERE capacity BETWEEN 5000 AND 10000<separator>SELECT location, name FROM stadium WHERE capacity BETWEEN 5000 AND 10000;<separator>SELECT MAX(capacity), AVG(capacity) FROM stadium<separator>SELECT MAX(capacity), AVG(capacity) FROM stadium<separator>SELECT name, capacity
FROM stadium
WHERE average = (SELECT MAX(average) FROM stadium)<separator>SELECT name, capacity
FROM stadium
WHERE average = (SELECT MAX(average) FROM stadium)<separator>SELECT COUNT(*) FROM concert WHERE year = 2014 OR year = 2015;<separator>SELECT COUNT(*) FROM concert WHERE year = 2014 OR year = 2015<separator>SELECT stadium.name, COUNT(concert.concert_id) AS number_of_concerts
FROM stadium
JOIN concert ON stadium.stadium_id = concert.stadium_id
GROUP BY stadium.name;<separator>SELECT stadium.name, COUNT(concert.concert_id) AS num_concerts
FROM stadium
INNER JOIN concert ON stadium.stadium_id = concert.stadium_id
GROUP BY stadium.name<separator>SELECT stadium.name, stadium.capacity
FROM stadium
INNER JOIN concert ON stadium.stadium_id = concert.stadium_id
WHERE concert.year >= 2014
GROUP BY stadium.name, stadium.capacity
HAVING COUNT(concert.concert_id) = (
    SELECT MAX(concert_count)
    FROM (
        SELECT COUNT(concert.concert_id) as concert_count
        FROM stadium
        INNER JOIN concert ON stadium.stadium_id = concert.stadium_id
        WHERE concert.year >= 2014
        GROUP BY stadium.name, stadium.capacity
    ) AS counts
)<separator>SELECT stadium.name, stadium.capacity
FROM stadium
JOIN concert ON concert.stadium_id = stadium.stadium_id
WHERE concert.year > 2013
GROUP BY stadium.stadium_id
ORDER BY COUNT(concert.concert_id) DESC
LIMIT 1;<separator>SELECT year
FROM concert
GROUP BY year
ORDER BY COUNT(*) DESC
LIMIT 1;<separator>SELECT year
FROM concert
GROUP BY year
HAVING COUNT(*) = (
    SELECT MAX(concert_count)
    FROM (
        SELECT year, COUNT(*) AS concert_count
        FROM concert
        GROUP BY year
    ) AS subquery
)<separator>SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)<separator>SELECT name
FROM stadium
WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)<separator>SELECT DISTINCT singer.country
FROM singer
WHERE singer.age > 40
AND singer.singer_id IN (
   SELECT singer_in_concert.singer_id
   FROM singer_in_concert
   INNER JOIN concert ON singer_in_concert.concert_id = concert.concert_id
   WHERE concert.year = YEAR(CURDATE())
)
AND singer.singer_id IN (
   SELECT singer_in_concert.singer_id
   FROM singer_in_concert
   INNER JOIN concert ON singer_in_concert.concert_id = concert.concert_id
   WHERE concert.year = YEAR(CURDATE())
   AND singer.age < 30
)<separator>SELECT name 
FROM stadium 
WHERE stadium_id NOT IN (
    SELECT stadium_id 
    FROM concert 
    WHERE year = 2014
)<separator>SELECT stadium_name
FROM stadium
WHERE stadium_id NOT IN (
  SELECT stadium_id
  FROM concert
  WHERE year = 2014
)<separator>SELECT concert.concert_name, concert.theme, COUNT(singer_in_concert.singer_id) 
FROM concert 
INNER JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id 
GROUP BY concert.concert_name, concert.theme<separator>SELECT concert.concert_name, concert.theme, COUNT(singer_in_concert.singer_id) AS number_of_singers
FROM concert
LEFT JOIN singer_in_concert ON concert.concert_id = singer_in_concert.concert_id
GROUP BY concert.concert_name, concert.theme<separator>SELECT singer.name, COUNT(singer_in_concert.singer_id) AS number_of_concerts
FROM singer
JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id
GROUP BY singer.name<separator>SELECT singer.name, COUNT(*) as concert_count 
FROM singer 
JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id 
GROUP BY singer.name<separator>SELECT singer.name 
FROM singer 
JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id 
JOIN concert ON concert.concert_id = singer_in_concert.concert_id 
WHERE concert.year = 2014<separator>SELECT singer.name
FROM singer
JOIN singer_in_concert ON singer.singer_id = singer_in_concert.singer_id
JOIN concert ON concert.concert_id = singer_in_concert.concert_id
WHERE concert.year = 2014<separator>SELECT singer.name, singer.country
FROM singer
WHERE singer.song_name LIKE '%hey%'<separator>SELECT singer.name, singer.country 
FROM singer 
WHERE singer.singer_id IN (
    SELECT singer_in_concert.singer_id 
    FROM singer_in_concert 
    INNER JOIN concert ON singer_in_concert.concert_id = concert.concert_id 
    INNER JOIN singer ON singer_in_concert.singer_id = singer.singer_id 
    WHERE singer.song_name LIKE '%hey%'
)<separator>SELECT stadium.name, stadium.location 
FROM concert 
JOIN stadium ON concert.stadium_id = stadium.stadium_id 
WHERE concert.year = 2014 AND concert.stadium_id IN 
    (SELECT stadium_id from concert WHERE year = 2015)<separator>SELECT stadium.name, stadium.location 
FROM stadium
INNER JOIN concert ON stadium.stadium_id = concert.stadium_id
WHERE concert.year = 2014 AND stadium.stadium_id IN (
  SELECT concert.stadium_id 
  FROM concert 
  WHERE concert.year = 2015
)<separator>SELECT COUNT(*) 
FROM concert 
JOIN stadium ON concert.stadium_id = stadium.stadium_id 
WHERE stadium.capacity = (SELECT MAX(capacity) FROM stadium)<separator>SELECT COUNT(*) 
FROM concert 
WHERE stadium_id IN (
    SELECT stadium_id 
    FROM stadium 
    WHERE capacity = (
        SELECT MAX(capacity) 
        FROM stadium
    )
)<separator>SELECT COUNT(*) FROM pets WHERE weight > 10;<separator>SELECT COUNT(*)
FROM pets
WHERE weight > 10;<separator>SELECT MIN(pet_age) AS youngest_age, weight 
FROM pets 
WHERE pettype = 'dog'<separator>SELECT MIN(pet_age) AS youngest_dog_age, weight 
FROM pets 
WHERE pettype = 'dog' 
GROUP BY pettype 
ORDER BY youngest_dog_age 
LIMIT 1<separator>SELECT MAX(p.weight) AS maximum_weight, p.pettype AS pet_type
FROM pets p
GROUP BY p.pettype<separator>SELECT pets.pettype, MAX(pets.weight) AS max_weight
FROM pets
GROUP BY pets.pettype<separator>SELECT COUNT(has_pet.petid) 
FROM has_pet 
JOIN student ON has_pet.stuid = student.stuid 
JOIN pets ON has_pet.petid = pets.petid 
WHERE student.age > 20<separator>SELECT COUNT(has_pet.petid)
FROM has_pet
JOIN student ON has_pet.stuid = student.stuid
JOIN pets ON has_pet.petid = pets.petid
WHERE student.age > 20<separator>SELECT COUNT(pets.petid) 
FROM pets
INNER JOIN has_pet ON pets.petid = has_pet.petid
INNER JOIN student ON has_pet.stuid = student.stuid
WHERE pets.pettype = 'dog' AND student.sex = 'f'<separator>SELECT COUNT(pets.petid)
FROM has_pet
JOIN pets ON has_pet.petid = pets.petid
JOIN student ON has_pet.stuid = student.stuid
WHERE student.sex = 'female' AND pets.pettype = 'dog'<separator>SELECT COUNT(DISTINCT pettype) FROM pets<separator>SELECT COUNT(DISTINCT pettype) 
FROM pets;<separator>SELECT student.fname
FROM student
JOIN has_pet ON student.stuid = has_pet.stuid
JOIN pets ON has_pet.petid = pets.petid
WHERE pets.pettype IN ('cat', 'dog')<separator>SELECT student.fname 
FROM student 
JOIN has_pet ON student.stuid = has_pet.stuid 
JOIN pets ON has_pet.petid = pets.petid 
WHERE pets.pettype = 'cat' OR pets.pettype = 'dog';<separator>SELECT student.fname
FROM student
INNER JOIN has_pet ON student.stuid = has_pet.stuid
INNER JOIN pets ON has_pet.petid = pets.petid
WHERE pets.pettype = 'cat' AND student.stuid IN (
    SELECT has_pet.stuid
    FROM has_pet
    INNER JOIN pets ON has_pet.petid = pets.petid
    WHERE pets.pettype = 'dog'
)<separator>SELECT student.fname
FROM student
WHERE EXISTS (
  SELECT 1
  FROM has_pet
  JOIN pets ON has_pet.petid = pets.petid
  WHERE has_pet.stuid = student.stuid
  AND pets.pettype = 'cat'
)
AND EXISTS (
  SELECT 1
  FROM has_pet
  JOIN pets ON has_pet.petid = pets.petid
  WHERE has_pet.stuid = student.stuid
  AND pets.pettype = 'dog'
)<separator>SELECT student.major, student.age 
FROM student 
WHERE student.stuid NOT IN (
    SELECT has_pet.stuid 
    FROM has_pet 
    JOIN pets ON has_pet.petid = pets.petid 
    WHERE pets.pettype = 'cat'
)<separator>SELECT student.major, student.age FROM student
WHERE NOT EXISTS 
(SELECT * FROM has_pet
JOIN pets ON has_pet.petid = pets.petid
WHERE pets.pettype = 'cat'
AND has_pet.stuid = student.stuid)<separator>SELECT student.stuid
FROM student
LEFT JOIN has_pet ON student.stuid = has_pet.stuid
LEFT JOIN pets ON has_pet.petid = pets.petid
WHERE pets.pettype <> 'cat'
GROUP BY student.stuid;<separator>SELECT student.stuid 
FROM student
WHERE student.stuid NOT IN (
    SELECT has_pet.stuid 
    FROM has_pet 
    INNER JOIN pets ON has_pet.petid = pets.petid 
    WHERE pets.pettype = 'cat'
)<separator>SELECT student.fname, student.age
FROM student
JOIN has_pet ON student.stuid = has_pet.stuid
JOIN pets ON has_pet.petid = pets.petid
WHERE pets.pettype = 'dog'
AND NOT EXISTS (
  SELECT 1
  FROM has_pet
  JOIN pets ON has_pet.petid = pets.petid
  WHERE has_pet.stuid = student.stuid
  AND pets.pettype = 'cat'
)<separator>SELECT student.fname 
FROM student 
JOIN has_pet ON student.stuid = has_pet.stuid 
JOIN pets ON has_pet.petid = pets.petid 
WHERE pets.pettype = 'dog' 
AND student.stuid NOT IN (
    SELECT student.stuid 
    FROM student 
    JOIN has_pet ON student.stuid = has_pet.stuid 
    JOIN pets ON has_pet.petid = pets.petid 
    WHERE pets.pettype = 'cat'
)<separator>SELECT pettype, weight 
FROM pets 
WHERE pet_age = (SELECT MIN(pet_age) FROM pets)<separator>SELECT pettype, weight
FROM pets
WHERE pet_age = (SELECT MIN(pet_age) FROM pets)<separator>SELECT pets.petid, pets.weight
FROM pets
WHERE pets.pet_age > 1<separator>SELECT pets.petid, pets.weight
FROM pets
WHERE pets.pet_age > 1<separator>SELECT pets.pettype, AVG(pets.pet_age), MAX(pets.pet_age)
FROM pets
GROUP BY pets.pettype<separator>SELECT pets.pettype, AVG(pets.pet_age) AS average_age, MAX(pets.pet_age) AS maximum_age
FROM pets
GROUP BY pets.pettype<separator>SELECT pettype, AVG(weight) AS average_weight 
FROM pets 
GROUP BY pettype<separator>SELECT pettype, AVG(weight) 
FROM pets 
GROUP BY pettype;<separator>SELECT student.fname, student.age 
FROM student 
JOIN has_pet ON has_pet.stuid = student.stuid 
JOIN pets ON pets.petid = has_pet.petid<separator>SELECT student.fname, student.age
FROM student
JOIN has_pet ON student.stuid = has_pet.stuid
JOIN pets ON has_pet.petid = pets.petid<separator>SELECT pets.petid
FROM student
JOIN has_pet ON student.stuid = has_pet.stuid
JOIN pets ON has_pet.petid = pets.petid
WHERE student.lname = 'smith'<separator>SELECT petid
FROM has_pet
INNER JOIN student ON has_pet.stuid = student.stuid
WHERE student.lname = 'smith'<separator>SELECT student.stuid, COUNT(*) AS number_of_pets
FROM student JOIN has_pet ON student.stuid = has_pet.stuid
GROUP BY student.stuid
ORDER BY student.stuid;<separator>SELECT student.stuid, COUNT(has_pet.petid) AS num_pets 
FROM student 
JOIN has_pet ON student.stuid = has_pet.stuid 
GROUP BY student.stuid<separator>SELECT student.fname, student.sex 
FROM student 
INNER JOIN has_pet ON has_pet.stuid = student.stuid 
GROUP BY student.stuid 
HAVING COUNT(has_pet.petid) > 1<separator>SELECT student.fname, student.sex
FROM student
JOIN has_pet ON student.stuid = has_pet.stuid
GROUP BY student.stuid
HAVING COUNT(has_pet.petid) > 1;<separator>SELECT student.lname
FROM student
JOIN has_pet ON student.stuid = has_pet.stuid
JOIN pets ON has_pet.petid = pets.petid
WHERE pets.pettype = 'cat' AND pets.pet_age = 3<separator>SELECT student.lname 
FROM student 
JOIN has_pet ON student.stuid = has_pet.stuid 
JOIN pets ON has_pet.petid = pets.petid 
WHERE pets.pettype = 'cat' 
AND pets.pet_age = 3<separator>SELECT AVG(student.age) 
FROM student 
WHERE student.stuid NOT IN (SELECT has_pet.stuid FROM has_pet)<separator>SELECT AVG(age) 
FROM student 
WHERE stuid NOT IN (SELECT stuid FROM has_pet)<separator>SELECT COUNT(*) FROM continents;<separator>SELECT COUNT(*) FROM continents<separator>SELECT continents.contid, continents.continent, COUNT(countries.countryid) AS number_of_countries
FROM continents
JOIN countries ON continents.contid = countries.continent
GROUP BY continents.contid, continents.continent<separator>SELECT continents.contid, continents.continent, COUNT(countries.countryid) AS num_countries
FROM continents
JOIN countries ON continents.contid = countries.continent
GROUP BY continents.contid, continents.continent<separator>SELECT COUNT(countryid) FROM countries<separator>SELECT COUNT(*) FROM countries;<separator>SELECT car_makers.fullname, car_makers.id, COUNT(model_list.modelid) AS number_of_models
FROM car_makers
JOIN model_list ON car_makers.id = model_list.maker
GROUP BY car_makers.fullname, car_makers.id<separator>SELECT car_makers.id, car_makers.fullname, COUNT(model_list.modelid) AS num_models
FROM car_makers
JOIN model_list ON car_makers.id = model_list.maker
GROUP BY car_makers.id, car_makers.fullname<separator>SELECT model
FROM car_names
JOIN cars_data ON car_names.makeid = cars_data.id
WHERE horsepower = (SELECT MIN(horsepower) FROM cars_data)<separator>SELECT car_names.model 
FROM cars_data 
JOIN car_names ON cars_data.id = car_names.makeid 
WHERE cars_data.horsepower = (SELECT MIN(horsepower) FROM cars_data)<separator>SELECT model
FROM car_names
WHERE makeid IN (
  SELECT id
  FROM cars_data
  WHERE weight < (
    SELECT AVG(weight)
    FROM cars_data
  )
)<separator>SELECT car_names.model
FROM cars_data
JOIN car_names ON cars_data.id = car_names.makeid
WHERE cars_data.weight < (SELECT AVG(weight) FROM cars_data)<separator>SELECT car_makers.fullname 
FROM car_makers 
JOIN cars_data ON car_makers.id = cars_data.id 
WHERE cars_data.year = 1970<separator>SELECT DISTINCT car_makers.maker
FROM car_makers
JOIN cars_data ON car_makers.id = cars_data.id
WHERE cars_data.year = 1970<separator>SELECT car_makers.maker, cars_data.year
FROM car_makers
INNER JOIN model_list ON car_makers.id = model_list.maker
INNER JOIN car_names ON model_list.model = car_names.model
INNER JOIN cars_data ON car_names.makeid = cars_data.id
WHERE cars_data.year = (SELECT MIN(year) FROM cars_data)<separator>SELECT car_makers.maker, cars_data.year
FROM car_makers
JOIN cars_data ON car_makers.id = cars_data.id
ORDER BY cars_data.year ASC
LIMIT 1<separator>SELECT DISTINCT car_names.model 
FROM car_names 
JOIN cars_data ON cars_data.id = car_names.makeid 
WHERE cars_data.year > 1980<separator>SELECT car_names.model
FROM car_names
JOIN cars_data ON car_names.makeid = cars_data.id
WHERE cars_data.year > 1980<separator>SELECT COUNT(car_makers.id) AS count, continents.continent AS continent 
FROM car_makers 
JOIN countries ON car_makers.country = countries.countryid 
JOIN continents ON countries.continent = continents.contid 
GROUP BY continents.continent<separator>SELECT continents.continent, COUNT(car_makers.id) AS car_maker_count
FROM continents
JOIN countries ON countries.continent = continents.contid
JOIN car_makers ON car_makers.country = countries.countryid
GROUP BY continents.continent;<separator>SELECT countries.countryname
FROM countries
JOIN car_makers ON car_makers.country = countries.countryid
GROUP BY countries.countryname
ORDER BY COUNT(car_makers.id) DESC
LIMIT 1<separator>SELECT countryname 
FROM countries
WHERE countryid = (
    SELECT country 
    FROM car_makers
    GROUP BY country 
    HAVING COUNT(*) = (
        SELECT MAX(cnt) 
        FROM (
            SELECT COUNT(*) as cnt 
            FROM car_makers 
            GROUP BY country
        ) as counts
    )
)<separator>SELECT car_makers.fullname, COUNT(model_list.model) AS model_count
FROM car_makers
JOIN model_list ON car_makers.id = model_list.maker
GROUP BY car_makers.fullname<separator>SELECT car_makers.id, car_makers.fullname, COUNT(car_names.model) AS number_of_car_models
FROM car_makers
LEFT JOIN model_list ON car_makers.id = model_list.maker
LEFT JOIN car_names ON model_list.model = car_names.model
GROUP BY car_makers.id, car_makers.fullname<separator>SELECT cars_data.accelerate 
FROM cars_data 
INNER JOIN car_names ON cars_data.id = car_names.makeid 
INNER JOIN model_list ON car_names.model = model_list.model 
INNER JOIN car_makers ON model_list.maker = car_makers.id 
WHERE car_makers.maker = 'amc hornet sportabout (sw)'<separator>SELECT cars_data.accelerate 
FROM cars_data 
JOIN car_names ON cars_data.id = car_names.makeid 
JOIN model_list ON car_names.model = model_list.model 
JOIN car_makers ON model_list.maker = car_makers.id 
WHERE car_makers.maker = 'amc' 
AND car_names.make = 'hornet sportabout (sw)'<separator>SELECT COUNT(*) FROM car_makers 
WHERE car_makers.country = (SELECT countryid FROM countries WHERE countryname = 'france')<separator>SELECT COUNT(DISTINCT car_makers.id) 
FROM car_makers 
JOIN countries ON car_makers.country = countries.countryid
WHERE countries.countryname = 'france'<separator>SELECT COUNT(*) FROM car_names 
INNER JOIN model_list ON car_names.model = model_list.modelid
INNER JOIN car_makers ON model_list.maker = car_makers.id
INNER JOIN countries ON car_makers.country = countries.countryid
WHERE countries.countryname = 'usa'<separator>SELECT COUNT(*) FROM car_names
JOIN cars_data ON cars_data.id = car_names.makeid
JOIN car_makers ON car_makers.id = car_names.makeid
JOIN countries ON countries.countryid = car_makers.country
WHERE countries.countryname = 'united states'<separator>SELECT AVG(mpg) 
FROM cars_data 
WHERE cylinders = 4;<separator>SELECT AVG(mpg) 
FROM cars_data 
WHERE cylinders = 4<separator>SELECT MIN(weight) 
FROM cars_data 
WHERE cylinders = 8 AND year = 1974<separator>SELECT MIN(weight)
FROM cars_data
WHERE cylinders = 8 AND year = 1974<separator>SELECT car_makers.maker, model_list.model 
FROM car_makers 
JOIN model_list ON car_makers.id = model_list.maker
JOIN car_names ON model_list.model = car_names.model<separator>SELECT car_makers.maker, model_list.model 
FROM car_makers 
JOIN model_list ON car_makers.id = model_list.maker<separator>SELECT countryname, countryid
FROM countries
WHERE countryid IN
(SELECT DISTINCT car_makers.country
FROM car_makers)<separator>SELECT countries.countryname, countries.countryid
FROM countries
WHERE EXISTS (
  SELECT 1
  FROM car_makers
  WHERE car_makers.country = countries.countryid
)<separator>SELECT COUNT(*) 
FROM cars_data
WHERE horsepower > 150<separator>SELECT COUNT(*) 
FROM cars_data 
WHERE horsepower > 150;<separator>SELECT year, AVG(weight) 
FROM cars_data 
GROUP BY year<separator>SELECT AVG(weight), year
FROM cars_data
GROUP BY year<separator>SELECT countryname 
FROM countries 
WHERE continent = 'Europe' 
GROUP BY countryname 
HAVING COUNT(DISTINCT maker) >= 3;<separator>SELECT countryname
FROM countries
JOIN continents ON countries.continent = continents.contid
JOIN car_makers ON car_makers.country = countries.countryid
GROUP BY countryname
HAVING COUNT(car_makers.id) >= 3
WHERE continents.continent = "Europe"<separator>SELECT MAX(cars_data.horsepower), car_names.make
FROM cars_data 
JOIN car_names ON cars_data.id = car_names.makeid
JOIN model_list ON car_names.model = model_list.model
WHERE cars_data.cylinders = 3<separator>SELECT MAX(horsepower), car_makers.maker 
FROM cars_data 
JOIN car_names ON cars_data.id = car_names.makeid 
JOIN model_list ON car_names.model = model_list.model 
JOIN car_makers ON model_list.maker = car_makers.id 
WHERE cars_data.cylinders = 3<separator>SELECT cars_data.model
FROM cars_data
WHERE cars_data.mpg = (SELECT MAX(cars_data.mpg) FROM cars_data)<separator>SELECT model
FROM car_names
JOIN cars_data ON car_names.makeid = cars_data.id
ORDER BY mpg DESC
LIMIT 1;<separator>SELECT AVG(horsepower) FROM cars_data WHERE year < 1980<separator>SELECT AVG(horsepower) FROM cars_data WHERE year < 1980;<separator>SELECT AVG(cars_data.edispl)
FROM car_names
JOIN model_list ON car_names.model = model_list.model
JOIN cars_data ON car_names.makeid = cars_data.id
WHERE model_list.maker = (
    SELECT id
    FROM car_makers
    WHERE maker = 'volvo'
)<separator>SELECT AVG(cars_data.edispl)
FROM car_makers
JOIN model_list ON car_makers.id = model_list.maker
JOIN car_names ON model_list.model = car_names.model
JOIN cars_data ON car_names.makeid = cars_data.id
WHERE car_makers.maker = 'Volvo'<separator>SELECT cylinders, MAX(accelerate) 
FROM cars_data 
GROUP BY cylinders;<separator>SELECT MAX(accelerate) 
FROM cars_data 
GROUP BY cylinders<separator>SELECT model, COUNT(make) AS version_count
FROM car_names
GROUP BY model
ORDER BY version_count DESC
LIMIT 1;<separator>SELECT model, COUNT(DISTINCT make) AS num_versions 
FROM car_names 
GROUP BY model 
ORDER BY num_versions DESC 
LIMIT 1<separator>SELECT COUNT(*) FROM cars_data WHERE cylinders > 4;<separator>SELECT COUNT(*) FROM cars_data WHERE cylinders > 4;<separator>SELECT COUNT(*) 
FROM cars_data 
WHERE year = 1980;<separator>SELECT COUNT(*) FROM cars_data WHERE year = 1980<separator>SELECT COUNT(car_names.model)
FROM car_makers
JOIN model_list ON car_makers.id = model_list.maker
JOIN car_names ON model_list.model = car_names.model
WHERE car_makers.fullname = 'american motor company'<separator>SELECT COUNT(model_list.modelid) 
FROM car_makers 
INNER JOIN model_list ON car_makers.id = model_list.maker 
WHERE car_makers.maker = 'american motor company'<separator>SELECT car_makers.fullname, car_makers.id
FROM car_makers
JOIN model_list ON car_makers.id = model_list.maker
GROUP BY car_makers.fullname, car_makers.id
HAVING COUNT(model_list.modelid) > 3<separator>SELECT car_makers.id, car_makers.maker 
FROM car_makers 
JOIN model_list ON car_makers.id = model_list.maker 
GROUP BY car_makers.id, car_makers.maker 
HAVING COUNT(model_list.modelid) > 3;<separator>SELECT DISTINCT model
FROM car_makers AS cm
JOIN model_list AS ml ON cm.id = ml.maker
JOIN car_names AS cn ON ml.model = cn.model
JOIN cars_data AS cd ON cn.makeid = cd.id
WHERE (cm.fullname = 'general motors' OR cd.weight > 3500);<separator>SELECT model_list.model
FROM model_list
JOIN car_makers ON model_list.maker = car_makers.id
JOIN cars_data ON cars_data.id = model_list.modelid
WHERE car_makers.maker = 'general motors' OR cars_data.weight > 3500;<separator>SELECT year
FROM cars_data
WHERE weight >= 3000 AND weight <= 4000<separator>SELECT DISTINCT year FROM cars_data 
WHERE weight < 4000 
AND year IN (SELECT distinct year from cars_data WHERE weight > 3000)<separator>SELECT MAX(horsepower) FROM cars_data WHERE accelerate = (SELECT MAX(accelerate) FROM cars_data)<separator>SELECT horsepower 
FROM cars_data 
WHERE accelerate = (SELECT MAX(accelerate) FROM cars_data)<separator>SELECT min(cars_data.accelerate) FROM cars_data 
JOIN car_names ON cars_data.id = car_names.makeid 
JOIN model_list ON car_names.model = model_list.model 
JOIN car_makers ON model_list.maker = car_makers.id 
WHERE car_makers.maker = 'volvo'<separator>SELECT MIN(cylinders) 
FROM cars_data 
JOIN car_names ON cars_data.id = car_names.makeid 
JOIN model_list ON car_names.model = model_list.model 
JOIN car_makers ON model_list.maker = car_makers.id 
WHERE car_makers.maker = 'volvo' 
AND car_names.make = 'model' 
ORDER BY accelerate ASC 
LIMIT 1<separator>SELECT COUNT(*) FROM cars_data 
WHERE accelerate > (SELECT MAX(horsepower) FROM cars_data)<separator>SELECT COUNT(*) FROM cars_data WHERE accelerate > (SELECT MAX(horsepower) FROM cars_data)<separator>SELECT COUNT(DISTINCT countries.countryid) AS num_countries FROM countries
JOIN car_makers ON car_makers.country = countries.countryid
GROUP BY countries.countryid
HAVING COUNT(car_makers.id) > 2;<separator>SELECT COUNT(DISTINCT countries.countryid)
FROM car_makers
INNER JOIN countries ON car_makers.country = countries.countryid
GROUP BY countries.countryid
HAVING COUNT(DISTINCT car_makers.id) > 2<separator>SELECT COUNT(*) FROM cars_data WHERE cylinders > 6<separator>SELECT COUNT(*) 
FROM cars_data 
WHERE cylinders > 6;<separator>SELECT model
FROM cars_data AS cd
JOIN car_names AS cn ON cd.id = cn.makeid
JOIN model_list AS ml ON cn.model = ml.model
WHERE cd.cylinders = 4
ORDER BY cd.horsepower DESC
LIMIT 1<separator>SELECT car_names.model 
FROM car_names 
JOIN cars_data ON car_names.makeid = cars_data.id 
WHERE cars_data.cylinders = 4 
ORDER BY cars_data.horsepower DESC 
LIMIT 1<separator>SELECT car_names.makeid, car_names.make 
FROM cars_data 
JOIN car_names ON cars_data.id = car_names.makeid 
WHERE cars_data.horsepower > (SELECT MIN(horsepower) FROM cars_data) 
AND cars_data.cylinders <= 3<separator>SELECT car_makers.id, car_makers.maker, car_names.makeid, car_names.make
FROM car_makers
JOIN countries ON car_makers.country = countries.countryid
JOIN model_list ON model_list.maker = car_makers.id
JOIN car_names ON car_names.model = model_list.model
JOIN cars_data ON cars_data.id = car_names.makeid
WHERE cars_data.cylinders < 4 AND cars_data.horsepower > (SELECT MIN(horsepower) FROM cars_data)<separator>SELECT MAX(mpg) 
FROM cars_data 
WHERE cylinders = 8 AND year < 1980<separator>SELECT MAX(cars_data.mpg) 
FROM cars_data 
WHERE (cars_data.cylinders = 8 OR cars_data.year < 1980)<separator>SELECT model_list.model
FROM model_list
JOIN cars_data ON model_list.modelid = cars_data.id
JOIN car_makers ON model_list.maker = car_makers.id
WHERE cars_data.weight < 3500
AND car_makers.maker != 'ford motor company'<separator>SELECT car_names.model
FROM car_names
JOIN cars_data ON cars_data.id = car_names.makeid
JOIN car_makers ON car_makers.id = car_names.makeid
WHERE cars_data.weight < 3500
AND car_makers.maker <> 'ford motor company'<separator>SELECT countryname 
FROM countries 
WHERE countryid NOT IN (SELECT country 
                         FROM car_makers)<separator>SELECT countryname 
FROM countries 
WHERE countryid NOT IN (SELECT country 
                        FROM car_makers)<separator>SELECT id, maker 
FROM car_makers 
WHERE id IN (SELECT maker 
             FROM model_list 
             GROUP BY maker 
             HAVING COUNT(DISTINCT model) >= 2) 
GROUP BY id, maker 
HAVING COUNT(id) > 3<separator>SELECT car_makers.id, car_makers.maker 
FROM car_makers 
JOIN model_list ON car_makers.id = model_list.maker 
JOIN car_names ON model_list.model = car_names.model 
GROUP BY car_makers.id, car_makers.maker 
HAVING COUNT(DISTINCT car_names.makeid) > 3 AND COUNT(model_list.modelid) > 2<separator>SELECT countries.countryid, countries.countryname
FROM countries
WHERE countries.countryid IN (
    SELECT car_makers.country
    FROM car_makers
    WHERE car_makers.id IN (
        SELECT model_list.maker
        FROM model_list
        WHERE model_list.modelid IN (
            SELECT car_names.makeid
            FROM car_names
            WHERE car_names.model = 'fiat'
        )
    )
    GROUP BY car_makers.country
    HAVING COUNT(DISTINCT car_makers.id) > 3
)<separator>SELECT countries.countryid, countries.countryname
FROM countries
WHERE countries.countryid IN (
  SELECT car_makers.country
  FROM car_makers
  GROUP BY car_makers.country
  HAVING COUNT(car_makers.id) > 3
)
OR EXISTS (
  SELECT *
  FROM car_makers
  JOIN model_list ON car_makers.id = model_list.maker
  JOIN car_names ON model_list.model = car_names.model
  WHERE car_names.make = 'fiat'
)<separator>SELECT country 
FROM airlines 
WHERE airline = "jetblue airways"<separator>SELECT country
FROM airlines
WHERE airline = 'jetblue airways'<separator>SELECT abbreviation 
FROM airlines 
WHERE airline = 'jetblue airways'<separator>SELECT abbreviation FROM airlines WHERE airline = 'jetblue airways';<separator>SELECT airline, abbreviation
FROM airlines
WHERE country = 'usa'<separator>SELECT airline, abbreviation
FROM airlines
WHERE country = 'usa'<separator>SELECT airportcode, airportname FROM airports WHERE city = 'anthony';<separator>SELECT airportcode, airportname 
FROM airports 
WHERE city = 'anthony';<separator>SELECT COUNT(*) FROM airlines<separator>SELECT COUNT(*) FROM airlines;<separator>SELECT COUNT(*) FROM airports;<separator>SELECT COUNT(*) FROM airports<separator>SELECT COUNT(*) FROM flights<separator>SELECT COUNT(*) AS flight_count
FROM flights;<separator>SELECT airline 
FROM airlines 
WHERE abbreviation = 'ual'<separator>SELECT * FROM airlines WHERE abbreviation = 'ual'<separator>SELECT COUNT(*) FROM airlines WHERE country = 'usa';<separator>SELECT COUNT(*) FROM airlines WHERE country = 'USA';<separator>SELECT city, country
FROM airports
WHERE airportname = 'alton'<separator>SELECT airports.city, airports.country
FROM airports
WHERE airports.airportname = "Alton Airport"<separator>SELECT airportname
FROM airports
WHERE airportcode = 'ako';<separator>SELECT airportname
FROM airports
WHERE airportcode = 'ako';<separator>SELECT airportname FROM airports WHERE city = 'aberdeen';<separator>SELECT airportname FROM airports WHERE city = 'aberdeen'<separator>SELECT COUNT(*) FROM flights WHERE sourceairport = 'apg'<separator>SELECT COUNT(*) 
FROM flights 
WHERE sourceairport = 'apg'<separator>SELECT COUNT(*) FROM flights WHERE destairport = 'ato';<separator>SELECT COUNT(*) 
FROM flights 
WHERE destairport = 'ato'<separator>SELECT COUNT(*) 
FROM flights 
JOIN airports ON flights.sourceairport = airports.airportcode 
WHERE airports.city = 'aberdeen'<separator>SELECT COUNT(*) 
FROM flights 
WHERE sourceairport = (SELECT airportcode FROM airports WHERE airportname = 'aberdeen');<separator>SELECT COUNT(*) 
FROM flights 
JOIN airports ON flights.destairport = airports.airportcode 
WHERE airports.city = 'aberdeen'<separator>SELECT COUNT(*) FROM flights
JOIN airports ON flights.destairport = airports.airportcode
WHERE airports.city = 'aberdeen'<separator>SELECT COUNT(*) FROM flights 
JOIN airports ON flights.sourceairport = airports.airportcode 
JOIN airports AS dest ON flights.destairport = dest.airportcode 
WHERE airports.city = 'aberdeen' AND dest.city = 'ashley'<separator>SELECT COUNT(*) FROM flights 
WHERE sourceairport = (SELECT airportcode FROM airports WHERE airportname = 'aberdeen') 
AND destairport = (SELECT airportcode FROM airports WHERE airportname = 'ashley')<separator>SELECT COUNT(*) 
FROM flights 
JOIN airlines ON flights.airline = airlines.uid 
WHERE airlines.airline = 'jetblue airways'<separator>SELECT COUNT(*) 
FROM flights 
INNER JOIN airlines ON flights.airline = airlines.uid 
WHERE airlines.airline = 'JetBlue Airways'<separator>SELECT COUNT(*) FROM flights
JOIN airlines ON flights.airline = airlines.uid
JOIN airports ON flights.sourceairport = airports.airportcode AND flights.destairport = airports.airportcode
WHERE airlines.airline = 'united airlines' AND airports.airportcode = 'asy'<separator>SELECT COUNT(*) 
FROM flights 
JOIN airlines ON flights.airline = airlines.uid 
JOIN airports ON flights.destairport = airports.airportcode 
WHERE airlines.airline = 'united' 
AND airports.airportname = 'asy'<separator>SELECT COUNT(*) 
FROM flights 
JOIN airlines ON flights.airline = airlines.uid 
JOIN airports ON flights.sourceairport = airports.airportcode 
WHERE airlines.airline = 'united airlines' AND airports.airportcode = 'ahd'<separator>SELECT COUNT(*) 
FROM flights 
JOIN airlines 
ON flights.airline = airlines.uid 
WHERE flights.sourceairport = 'ahd' 
AND airlines.airline = 'united'<separator>SELECT COUNT(*) 
FROM flights 
JOIN airlines ON flights.airline = airlines.uid
JOIN airports ON flights.destairport = airports.airportcode
WHERE airlines.airline = 'united airlines' 
AND airports.city = 'aberdeen'<separator>SELECT COUNT(*) 
FROM flights 
JOIN airlines ON flights.airline = airlines.uid 
JOIN airports ON flights.destairport = airports.airportcode 
WHERE airlines.airline = 'united airlines' 
AND airports.city = 'aberdeen'<separator>SELECT airports.city, COUNT(*) AS num_arriving_flights
FROM airports
JOIN flights ON airports.airportcode = flights.destairport
GROUP BY airports.city
ORDER BY num_arriving_flights DESC
LIMIT 1;<separator>SELECT airports.city 
FROM airports 
JOIN flights ON flights.destairport = airports.airportcode 
GROUP BY airports.city 
ORDER BY COUNT(flights.destairport) DESC 
LIMIT 1;<separator>SELECT cities.city
FROM (
    SELECT airports.city, COUNT(flights.flightno) AS num_flights
    FROM airports
    JOIN flights ON airports.airportcode = flights.sourceairport
    GROUP BY airports.city
) AS cities
WHERE cities.num_flights = (
    SELECT MAX(num_flights)
    FROM (
        SELECT airports.city, COUNT(flights.flightno) AS num_flights
        FROM airports
        JOIN flights ON airports.airportcode = flights.sourceairport
        GROUP BY airports.city
    ) AS city_flights
)<separator>SELECT airports.city
FROM airports
JOIN flights ON flights.sourceairport = airports.airportcode
GROUP BY airports.city
ORDER BY COUNT(flights.sourceairport) DESC
LIMIT 1;<separator>SELECT airports.airportcode 
FROM airports 
JOIN flights 
ON flights.sourceairport = airports.airportcode OR flights.destairport = airports.airportcode 
GROUP BY airports.airportcode 
ORDER BY COUNT(*) DESC 
LIMIT 1;<separator>SELECT airports.airportcode 
FROM airports 
JOIN flights ON flights.destairport = airports.airportcode
GROUP BY airports.airportcode 
ORDER BY COUNT(flights.flightno) DESC 
LIMIT 1<separator>SELECT airportcode
FROM airports
LEFT JOIN flights ON flights.sourceairport = airports.airportcode
GROUP BY airportcode
ORDER BY COUNT(flights.uid)
LIMIT 1<separator>SELECT airportcode FROM airports 
WHERE airportcode IN 
(SELECT COUNT(flights.sourceairport) AS num_flights 
FROM flights 
GROUP BY flights.sourceairport 
ORDER BY num_flights ASC 
LIMIT 1)<separator>SELECT airlines.airline
FROM airlines
JOIN flights ON airlines.uid = flights.airline
GROUP BY airlines.airline
ORDER BY COUNT(flights.flightno) DESC
LIMIT 1;<separator>SELECT airlines.airline, COUNT(flights.uid) AS num_flights
FROM airlines
JOIN flights ON airlines.uid = flights.airline
GROUP BY airlines.airline
ORDER BY num_flights DESC
LIMIT 1;<separator>SELECT abbreviation, country
FROM airlines
WHERE uid = (
    SELECT airline
    FROM flights
    GROUP BY airline
    HAVING COUNT(*) = (
        SELECT MIN(num_flights)
        FROM (
            SELECT COUNT(*) AS num_flights
            FROM flights
            GROUP BY airline
        ) AS temp
    )
)<separator>SELECT abbreviation, country
FROM airlines
WHERE uid = (
    SELECT airline
    FROM flights
    GROUP BY airline
    ORDER BY COUNT(*) ASC
    LIMIT 1
)<separator>SELECT DISTINCT airlines.airline 
FROM airlines 
INNER JOIN flights ON airlines.uid = flights.airline 
WHERE flights.sourceairport = 'ahd'<separator>SELECT DISTINCT airline FROM airlines INNER JOIN flights ON airlines.uid = flights.airline INNER JOIN airports ON flights.sourceairport = airports.airportcode WHERE airports.airportcode = 'ahd'<separator>SELECT airlines.airline
FROM airlines
JOIN flights ON airlines.uid = flights.airline
JOIN airports ON flights.destairport = airports.airportcode
WHERE airports.airportcode = 'ahd';<separator>SELECT airlines.airline
FROM airlines
INNER JOIN flights ON airlines.uid = flights.airline
INNER JOIN airports ON flights.destairport = airports.airportcode
WHERE airports.airportcode = 'ahd'<separator>SELECT DISTINCT airlines.airline
FROM airlines
JOIN flights ON airlines.uid = flights.airline
JOIN airports ON flights.sourceairport = airports.airportcode
JOIN airports AS a2 ON flights.destairport = a2.airportcode
WHERE airports.airportcode = 'apg' AND a2.airportcode = 'cvo'<separator>SELECT DISTINCT airlines.airline
FROM airlines
INNER JOIN flights ON airlines.uid = flights.airline
INNER JOIN airports ON flights.sourceairport = airports.airportcode
WHERE airports.airportname = 'apg' AND airlines.airline IN (
  SELECT airlines.airline
  FROM airlines
  INNER JOIN flights ON airlines.uid = flights.airline
  INNER JOIN airports ON flights.sourceairport = airports.airportcode
  WHERE airports.airportname = 'cvo'
)<separator>SELECT DISTINCT airlines.airline
FROM airlines
JOIN flights ON airlines.uid = flights.airline
WHERE flights.sourceairport = 'cvo'
AND NOT EXISTS (
  SELECT 1
  FROM flights
  JOIN airports ON flights.destairport = airports.airportcode
  WHERE airlines.uid = flights.airline
  AND airports.airportcode = 'apg'
)<separator>SELECT DISTINCT airlines.airline
FROM airlines, flights, airports
WHERE flights.sourceairport = 'CVO' 
AND flights.destairport <> 'APG'
AND flights.airline = airlines.uid
AND flights.sourceairport = airports.airportcode;<separator>SELECT airline
FROM airlines
INNER JOIN flights ON airlines.uid = flights.airline
GROUP BY airline
HAVING COUNT(flights.flightno) >= 10;<separator>SELECT airlines.airline 
FROM airlines 
JOIN flights ON airlines.uid = flights.airline 
GROUP BY airlines.airline 
HAVING COUNT(flights.flightno) >= 10;<separator>SELECT * 
FROM airlines 
WHERE uid 
IN (
    SELECT airline 
    FROM flights 
    GROUP BY airline 
    HAVING COUNT(*) < 200
)<separator>SELECT airlines.airline
FROM airlines
JOIN flights ON airlines.uid = flights.airline
GROUP BY airlines.airline
HAVING COUNT(*) < 200<separator>SELECT flightno FROM flights
WHERE airline = 'united airlines'<separator>SELECT flightno FROM flights WHERE airline = 'united airlines'<separator>SELECT flightno FROM flights WHERE sourceairport = (SELECT airportcode FROM airports WHERE airportname = "apg")<separator>SELECT flights.flightno 
FROM flights 
JOIN airports ON flights.sourceairport = airports.airportcode 
WHERE airports.airportname = 'apg'<separator>SELECT flightno FROM flights WHERE destairport = 'apg'<separator>SELECT flightno
FROM flights
JOIN airports ON flights.destairport = airports.airportcode
WHERE airports.airportname = 'apg'<separator>SELECT flightno
FROM flights
WHERE sourceairport IN (
    SELECT airportcode
    FROM airports
    WHERE city = 'aberdeen'
)<separator>SELECT flightno 
FROM flights 
WHERE sourceairport = (SELECT airportcode FROM airports WHERE city = 'aberdeen')<separator>SELECT flights.flightno
FROM flights
JOIN airports ON flights.destairport = airports.airportcode
WHERE airports.city = 'aberdeen'<separator>SELECT flightno
FROM flights
WHERE destairport = (SELECT airportcode FROM airports WHERE airportname = 'Aberdeen');<separator>SELECT COUNT(*) 
FROM flights 
JOIN airports ON flights.destairport = airports.airportcode 
WHERE airports.city = 'aberdeen' OR airports.city = 'abilene'<separator>SELECT COUNT(*) FROM flights
WHERE destairport IN (SELECT airportcode FROM airports WHERE city = 'aberdeen' OR city = 'abilene')<separator>SELECT airportname FROM airports
LEFT JOIN flights ON airports.airportcode = flights.sourceairport OR airports.airportcode = flights.destairport
WHERE flights.flightno IS NULL<separator>SELECT DISTINCT airports.airportname
FROM airports
LEFT JOIN flights ON flights.sourceairport = airports.airportcode OR flights.destairport = airports.airportcode
WHERE flights.sourceairport IS NULL AND flights.destairport IS NULL<separator>SELECT COUNT(*) FROM employee<separator>SELECT COUNT(*) FROM employee;<separator>SELECT name 
FROM employee 
ORDER BY age ASC;<separator>SELECT name FROM employee ORDER BY age ASC;<separator>SELECT city, COUNT(*) AS number_of_employees
FROM employee
GROUP BY city<separator>SELECT city, COUNT(*) as num_employees 
FROM employee 
GROUP BY city<separator>SELECT employee.city 
FROM employee 
WHERE employee.age < 30
GROUP BY employee.city
HAVING COUNT(*) > 1<separator>SELECT city
FROM employee
WHERE age < 30
GROUP BY city
HAVING COUNT(*) > 1<separator>SELECT location, COUNT(*) AS number_of_shops 
FROM shop 
GROUP BY location<separator>SELECT location, COUNT(*) AS num_shops
FROM shop
GROUP BY location<separator>SELECT shop.manager_name, shop.district
FROM shop
WHERE shop.number_products = (SELECT MAX(number_products) FROM shop)<separator>SELECT shop.manager_name, shop.district
FROM shop
WHERE shop.number_products = (
    SELECT MAX(number_products)
    FROM shop
)<separator>SELECT MIN(number_products) AS minimum_products, MAX(number_products) AS maximum_products
FROM shop<separator>SELECT MIN(number_products), MAX(number_products) FROM shop;<separator>SELECT name, location, district
FROM shop
ORDER BY number_products DESC<separator>SELECT name, location, district
FROM shop
ORDER BY number_products DESC<separator>SELECT shop.name 
FROM shop 
WHERE shop.number_products > (SELECT AVG(number_products) FROM shop)<separator>SELECT shop.name
FROM shop
WHERE shop.number_products > (
  SELECT AVG(shop.number_products)
  FROM shop
)<separator>SELECT employee.name
FROM employee
JOIN evaluation ON evaluation.employee_id = employee.employee_id
GROUP BY employee.name
ORDER BY COUNT(evaluation.year_awarded) DESC
LIMIT 1<separator>SELECT employee.name
FROM employee
JOIN evaluation ON employee.employee_id = evaluation.employee_id
GROUP BY employee.employee_id, employee.name
ORDER BY COUNT(evaluation.year_awarded) DESC
LIMIT 1<separator>SELECT employee.name
FROM employee
JOIN evaluation ON employee.employee_id = evaluation.employee_id
WHERE evaluation.bonus = (SELECT MAX(bonus) FROM evaluation)<separator>SELECT employee.name
FROM employee
JOIN evaluation ON employee.employee_id = evaluation.employee_id
WHERE evaluation.bonus = (SELECT MAX(bonus) FROM evaluation)<separator>SELECT employee.name 
FROM employee 
WHERE employee.employee_id NOT IN 
(SELECT evaluation.employee_id 
FROM evaluation)<separator>SELECT name 
FROM employee 
WHERE employee_id NOT IN (SELECT employee_id FROM evaluation)<separator>SELECT shop.name
FROM shop
JOIN hiring ON hiring.shop_id = shop.shop_id
GROUP BY shop.name
HAVING COUNT(hiring.employee_id) = (
    SELECT MAX(employees)
    FROM (
        SELECT COUNT(hiring.employee_id) AS employees
        FROM shop
        JOIN hiring ON hiring.shop_id = shop.shop_id
        GROUP BY shop.name
    ) AS temp
)<separator>SELECT shop.name 
FROM shop 
JOIN hiring ON shop.shop_id = hiring.shop_id 
GROUP BY shop.name 
ORDER BY COUNT(hiring.employee_id) DESC 
LIMIT 1;<separator>SELECT name
FROM shop
WHERE shop_id NOT IN (
    SELECT shop_id
    FROM hiring
)<separator>SELECT shop.name
FROM shop
LEFT JOIN hiring ON shop.shop_id = hiring.shop_id
GROUP BY shop.name
HAVING COUNT(hiring.employee_id) = 0<separator>SELECT s.name, COUNT(*) AS num_employees_hired
FROM shop s
JOIN hiring h ON s.shop_id = h.shop_id
GROUP BY s.name<separator>SELECT shop.name, COUNT(employee.employee_id) as num_employees
FROM shop
LEFT JOIN hiring ON shop.shop_id = hiring.shop_id
LEFT JOIN employee ON hiring.employee_id = employee.employee_id
GROUP BY shop.name<separator>SELECT SUM(evaluation.bonus) AS total_bonus_given
FROM evaluation<separator>SELECT SUM(bonus) 
FROM evaluation<separator>SELECT * FROM hiring<separator>SELECT * FROM hiring<separator>SELECT DISTINCT s.district
FROM shop s
WHERE s.number_products < 3000 
AND s.district IN (
    SELECT s2.district
    FROM shop s2
    WHERE s2.number_products > 10000
)<separator>SELECT DISTINCT s1.district
FROM shop s1, shop s2
WHERE s1.number_products < 3000
AND s2.number_products > 10000
AND s1.district = s2.district<separator>SELECT COUNT(DISTINCT location) 
FROM shop<separator>SELECT COUNT(DISTINCT location) FROM shop<separator>SELECT COUNT(*) FROM documents<separator>SELECT COUNT(*) FROM documents<separator>SELECT document_id, document_name, document_description FROM documents<separator>SELECT document_id, document_name, document_description FROM documents;<separator>SELECT document_name, template_id 
FROM documents 
WHERE document_description LIKE '%w%'<separator>SELECT document_name, template_id
FROM documents
WHERE document_description LIKE '%w%'<separator>SELECT documents.document_id, documents.template_id, documents.document_description
FROM documents
WHERE documents.document_name = "robbin cv"<separator>SELECT documents.document_id, documents.template_id, documents.document_description
FROM documents
WHERE documents.document_name = 'robbin cv'<separator>SELECT COUNT(DISTINCT templates.template_id) AS num_templates
FROM documents
INNER JOIN templates ON documents.template_id = templates.template_id
GROUP BY documents.document_id<separator>SELECT COUNT(DISTINCT templates.template_id) AS num_templates_used
FROM documents
JOIN templates ON documents.template_id = templates.template_id;<separator>SELECT COUNT(*) FROM documents
WHERE template_id IN (SELECT template_id FROM templates WHERE template_type_code = 'ppt')<separator>SELECT COUNT(DISTINCT document_id) 
FROM documents 
INNER JOIN templates ON documents.template_id = templates.template_id 
INNER JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code 
WHERE ref_template_types.template_type_description = 'ppt'<separator>SELECT templates.template_id, COUNT(documents.document_id) AS num_documents
FROM templates
LEFT JOIN documents ON templates.template_id = documents.template_id
GROUP BY templates.template_id<separator>SELECT templates.template_id, COUNT(*) AS usage_count
FROM documents
JOIN templates ON documents.template_id = templates.template_id
GROUP BY templates.template_id;<separator>SELECT templates.template_id, templates.template_type_code
FROM templates
GROUP BY templates.template_id, templates.template_type_code
HAVING COUNT(DISTINCT documents.document_id) = (
    SELECT MAX(document_count)
    FROM (
        SELECT COUNT(DISTINCT documents.document_id) AS document_count
        FROM documents
        INNER JOIN templates ON documents.template_id = templates.template_id
        GROUP BY templates.template_id, templates.template_type_code
    ) AS document_counts
)<separator>SELECT templates.template_id, templates.template_type_code
FROM templates
JOIN documents ON templates.template_id = documents.template_id
GROUP BY templates.template_id, templates.template_type_code
ORDER BY COUNT(documents.document_id) DESC
LIMIT 1;<separator>SELECT templates.template_id
FROM templates
JOIN documents ON documents.template_id = templates.template_id
GROUP BY templates.template_id
HAVING COUNT(DISTINCT documents.document_id) > 1<separator>SELECT template_id
FROM documents
GROUP BY template_id
HAVING COUNT(document_id) > 1<separator>SELECT templates.template_id 
FROM templates 
LEFT JOIN documents ON templates.template_id = documents.template_id 
WHERE documents.template_id IS NULL<separator>SELECT templates.template_id
FROM templates
LEFT JOIN documents ON documents.template_id = templates.template_id
WHERE documents.template_id IS NULL<separator>SELECT COUNT(*) FROM templates<separator>SELECT COUNT(*) FROM templates<separator>SELECT templates.template_id, templates.version_number, templates.template_type_code
FROM templates<separator>SELECT templates.template_id, templates.version_number, templates.template_type_code
FROM templates<separator>SELECT DISTINCT template_type_code FROM templates<separator>SELECT template_type_code FROM ref_template_types;<separator>SELECT templates.template_id 
FROM templates 
WHERE templates.template_type_code = 'pp' OR templates.template_type_code = 'ppt'<separator>SELECT templates.template_id
FROM templates
WHERE templates.template_type_code IN ('pp','ppt')<separator>SELECT COUNT(*) 
FROM templates 
WHERE template_type_code = 'cv'<separator>SELECT COUNT(*) 
FROM templates 
JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code 
WHERE ref_template_types.template_type_description = 'cv'<separator>SELECT templates.version_number, templates.template_type_code
FROM templates
WHERE templates.version_number > 5<separator>SELECT version_number, template_type_code
FROM templates
WHERE version_number > 5;<separator>SELECT ref_template_types.template_type_code, COUNT(templates.template_id) AS number_of_templates
FROM ref_template_types
LEFT JOIN templates ON ref_template_types.template_type_code = templates.template_type_code
GROUP BY ref_template_types.template_type_code<separator>SELECT template_type_code, COUNT(*) 
FROM templates 
GROUP BY template_type_code<separator>SELECT template_type_code, COUNT(template_id) AS template_count
FROM templates
GROUP BY template_type_code
ORDER BY template_count DESC
LIMIT 1;<separator>SELECT template_type_code 
FROM templates
GROUP BY template_type_code
ORDER BY COUNT(*) DESC
LIMIT 1;<separator>SELECT template_type_code
FROM ref_template_types
JOIN templates ON ref_template_types.template_type_code = templates.template_type_code
GROUP BY template_type_code
HAVING COUNT(template_id) < 3;<separator>SELECT template_type_code 
FROM ref_template_types
WHERE template_type_code IN (SELECT template_type_code 
                             FROM templates 
                             GROUP BY template_type_code 
                             HAVING COUNT(*) < 3)<separator>SELECT MIN(version_number), template_type_code FROM templates<separator>SELECT MIN(templates.version_number), templates.template_type_code
FROM templates
GROUP BY templates.template_type_code<separator>SELECT templates.template_type_code
FROM documents 
JOIN templates ON documents.template_id = templates.template_id
WHERE documents.document_name = "data base"<separator>SELECT templates.template_type_code
FROM documents
JOIN templates ON documents.template_id = templates.template_id
WHERE documents.document_name = 'data base'<separator>SELECT documents.document_name
FROM documents
JOIN templates ON documents.template_id = templates.template_id
JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code
WHERE ref_template_types.template_type_code = 'bk'<separator>SELECT document_name
FROM documents
JOIN templates ON documents.template_id = templates.template_id
JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code
WHERE ref_template_types.template_type_code = 'bk';<separator>SELECT ref_template_types.template_type_code, COUNT(documents.document_id) AS num_documents
FROM ref_template_types
LEFT JOIN templates ON ref_template_types.template_type_code = templates.template_type_code
LEFT JOIN documents ON templates.template_id = documents.template_id
GROUP BY ref_template_types.template_type_code<separator>SELECT ref_template_types.template_type_code, COUNT(documents.template_id) AS document_count
FROM ref_template_types
LEFT JOIN templates ON ref_template_types.template_type_code = templates.template_type_code
LEFT JOIN documents ON templates.template_id = documents.template_id
GROUP BY ref_template_types.template_type_code<separator>SELECT
    templates.template_type_code
FROM
    templates
JOIN
    documents ON documents.template_id = templates.template_id
GROUP BY
    templates.template_type_code
ORDER BY
    COUNT(documents.document_id) DESC
LIMIT 1<separator>SELECT template_type_code 
FROM ref_template_types 
WHERE template_type_code IN (
    SELECT template_type_code 
    FROM templates 
    GROUP BY template_type_code 
    HAVING COUNT(*) = (
        SELECT MAX(template_count) 
        FROM (
            SELECT template_type_code, COUNT(*) as template_count 
            FROM templates 
            GROUP BY template_type_code
        ) t
    )
)<separator>SELECT template_type_code
FROM ref_template_types
WHERE template_type_code NOT IN (SELECT template_type_code FROM templates)<separator>SELECT template_type_code 
FROM ref_template_types 
WHERE template_type_code NOT IN (
    SELECT DISTINCT template_type_code 
    FROM templates 
    INNER JOIN documents ON templates.template_id = documents.template_id
)<separator>SELECT template_type_code, template_type_description FROM ref_template_types<separator>SELECT template_type_code, template_type_description
FROM ref_template_types;<separator>SELECT template_type_description
FROM ref_template_types
WHERE template_type_code = 'ad';<separator>SELECT template_type_description
FROM ref_template_types
WHERE template_type_code = 'ad'<separator>SELECT template_type_code 
FROM ref_template_types 
WHERE template_type_description = 'book'<separator>SELECT template_type_code
FROM ref_template_types
WHERE template_type_description = 'book'<separator>SELECT DISTINCT ref_template_types.template_type_description
FROM ref_template_types
JOIN templates ON ref_template_types.template_type_code = templates.template_type_code
JOIN documents ON templates.template_id = documents.template_id<separator>SELECT DISTINCT template_type_description 
FROM templates 
JOIN documents ON templates.template_id = documents.template_id 
JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code<separator>SELECT template_id
FROM templates
WHERE template_type_code IN (
    SELECT template_type_code
    FROM ref_template_types
    WHERE template_type_description = 'presentation'
)<separator>SELECT template_id
FROM templates
JOIN ref_template_types ON templates.template_type_code = ref_template_types.template_type_code
WHERE ref_template_types.template_type_description = 'presentation'<separator>SELECT COUNT(*) AS total_paragraphs 
FROM paragraphs<separator>SELECT COUNT(*) FROM paragraphs<separator>SELECT COUNT(paragraphs.paragraph_id) AS paragraph_count
FROM documents
JOIN paragraphs ON documents.document_id = paragraphs.document_id
WHERE documents.document_name = 'summer show'<separator>SELECT COUNT(*) 
FROM paragraphs 
JOIN documents ON paragraphs.document_id = documents.document_id 
WHERE documents.document_name = 'summer show'<separator>SELECT *
FROM paragraphs
WHERE paragraph_text = 'korea'<separator>SELECT * FROM paragraphs WHERE paragraph_text LIKE '%korea %'<separator>SELECT paragraph_id, paragraph_text
FROM paragraphs
WHERE document_id = (
  SELECT document_id
  FROM documents
  WHERE document_name = 'welcome to ny'
)<separator>SELECT paragraph_id, paragraph_text FROM paragraphs
JOIN documents ON paragraphs.document_id = documents.document_id
WHERE documents.document_name = 'welcome to ny'<separator>SELECT paragraph_text 
FROM paragraphs 
JOIN documents ON paragraphs.document_id = documents.document_id 
WHERE documents.document_name = 'customer reviews'<separator>SELECT paragraphs.paragraph_text FROM paragraphs
JOIN documents ON paragraphs.document_id = documents.document_id
WHERE documents.document_name = 'customer reviews'<separator>SELECT documents.document_id, COUNT(paragraphs.paragraph_id) AS num_paragraphs
FROM documents
JOIN paragraphs ON documents.document_id = paragraphs.document_id
GROUP BY documents.document_id
ORDER BY documents.document_id;<separator>SELECT documents.document_id, COUNT(paragraphs.paragraph_id) AS num_paragraphs
FROM documents
LEFT JOIN paragraphs ON documents.document_id = paragraphs.document_id
GROUP BY documents.document_id
ORDER BY documents.document_id<separator>SELECT
  documents.document_id,
  documents.document_name,
  COUNT(paragraphs.paragraph_id) AS num_paragraphs
FROM
  documents
JOIN
  paragraphs ON documents.document_id = paragraphs.document_id
GROUP BY
  documents.document_id,
  documents.document_name<separator>SELECT documents.document_id, documents.document_name, COUNT(paragraphs.paragraph_id) AS num_paragraphs
FROM documents
LEFT JOIN paragraphs ON documents.document_id = paragraphs.document_id
GROUP BY documents.document_id, documents.document_name<separator>SELECT DISTINCT documents.document_id 
FROM documents 
JOIN paragraphs ON paragraphs.document_id = documents.document_id 
GROUP BY documents.document_id 
HAVING COUNT(paragraphs.paragraph_id) > 1<separator>SELECT documents.document_id
FROM documents
JOIN paragraphs ON documents.document_id = paragraphs.document_id
GROUP BY documents.document_id
HAVING COUNT(paragraphs.paragraph_id) >= 2;<separator>SELECT documents.document_id, documents.document_name 
FROM documents 
WHERE documents.document_id = (
    SELECT paragraphs.document_id 
    FROM paragraphs 
    GROUP BY paragraphs.document_id 
    ORDER BY COUNT(paragraphs.document_id) DESC 
    LIMIT 1
)<separator>SELECT documents.document_id, documents.document_name
FROM documents
WHERE documents.document_id = (
    SELECT documents.document_id
    FROM documents
    JOIN paragraphs ON documents.document_id = paragraphs.document_id
    GROUP BY documents.document_id
    ORDER BY COUNT(paragraphs.paragraph_id) DESC
    LIMIT 1
)<separator>SELECT document_id
FROM documents
GROUP BY document_id
ORDER BY COUNT(*) ASC
LIMIT 1;<separator>SELECT documents.document_id
FROM documents
JOIN paragraphs ON paragraphs.document_id = documents.document_id
GROUP BY documents.document_id
ORDER BY COUNT(paragraphs.paragraph_id)
LIMIT 1;<separator>SELECT documents.document_id
FROM documents
WHERE documents.document_id IN (
    SELECT paragraphs.document_id
    FROM paragraphs
    GROUP BY paragraphs.document_id
    HAVING COUNT(paragraphs.paragraph_id) BETWEEN 1 AND 2
)<separator>SELECT documents.document_id
FROM documents
WHERE documents.document_id IN (SELECT paragraphs.document_id
                                 FROM paragraphs
                                 GROUP BY paragraphs.document_id
                                 HAVING COUNT(paragraphs.paragraph_id) BETWEEN 1 AND 2)<separator>SELECT documents.document_id
FROM documents
JOIN paragraphs ON paragraphs.document_id = documents.document_id
WHERE paragraphs.paragraph_text IN ('brazil', 'ireland')<separator>SELECT documents.document_id 
FROM documents
JOIN paragraphs ON documents.document_id = paragraphs.document_id
WHERE paragraphs.paragraph_text = 'brazil' AND paragraphs.paragraph_text = 'ireland'<separator>SELECT COUNT(*) FROM teacher<separator>SELECT COUNT(*) as total_count FROM teacher<separator>SELECT teacher.name 
FROM teacher 
ORDER BY teacher.age ASC<separator>SELECT name FROM teacher ORDER BY age ASC;<separator>SELECT age, hometown FROM teacher<separator>SELECT age, hometown FROM teacher<separator>SELECT teacher.name
FROM teacher
WHERE teacher.hometown <> 'little lever urban district'<separator>SELECT teacher.name 
FROM teacher 
WHERE teacher.hometown <> 'little lever urban district'<separator>SELECT name 
FROM teacher 
WHERE age IN (32, 33)<separator>SELECT name 
FROM teacher 
WHERE age = 32 OR age = 33;<separator>SELECT teacher.hometown FROM teacher
WHERE teacher.age = (SELECT MIN(age) FROM teacher)<separator>SELECT hometown 
FROM teacher
WHERE age = (
    SELECT MIN(age) 
    FROM teacher
)<separator>SELECT teacher.hometown, COUNT(teacher.hometown) AS num_teachers 
FROM teacher 
GROUP BY teacher.hometown<separator>SELECT hometown, COUNT(*) AS num_teachers
FROM teacher
GROUP BY hometown<separator>SELECT hometown, COUNT(*) AS count 
FROM teacher 
GROUP BY hometown 
ORDER BY count DESC 
LIMIT 1;<separator>SELECT hometown, COUNT(*) AS count
FROM teacher
GROUP BY hometown
ORDER BY count DESC
LIMIT 1;<separator>SELECT teacher.hometown 
FROM teacher 
INNER JOIN course_arrange ON course_arrange.teacher_id = teacher.teacher_id 
GROUP BY teacher.hometown
HAVING COUNT(DISTINCT teacher.teacher_id) > 1<separator>SELECT DISTINCT teacher.hometown
FROM teacher
GROUP BY teacher.hometown
HAVING COUNT(*) >= 2<separator>SELECT teacher.name, course.course
FROM teacher
JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id
JOIN course ON course_arrange.course_id = course.course_id<separator>SELECT teacher.name, course.course
FROM teacher
JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id
JOIN course ON course.course_id = course_arrange.course_id<separator>SELECT teacher.name, course.course
FROM teacher
JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id
JOIN course ON course_arrange.course_id = course.course_id
ORDER BY teacher.name ASC;<separator>SELECT teacher.name, course.course
FROM teacher
INNER JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id
INNER JOIN course ON course.course_id = course_arrange.course_id
ORDER BY teacher.name ASC;<separator>SELECT teacher.name 
FROM teacher 
JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id 
JOIN course ON course.course_id = course_arrange.course_id 
WHERE course.course = 'math'<separator>SELECT teacher.name 
FROM teacher 
JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id 
JOIN course ON course.course_id = course_arrange.course_id 
WHERE course.course = 'math'<separator>SELECT teacher.name, COUNT(course_arrange.course_id) AS num_courses
FROM teacher
JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id
GROUP BY teacher.name<separator>SELECT teacher.name, COUNT(course_arrange.course_id) AS course_count
FROM teacher
JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id
GROUP BY teacher.name<separator>SELECT teacher.name
FROM teacher
INNER JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id
GROUP BY teacher.name
HAVING COUNT(course_arrange.course_id) >= 2<separator>SELECT teacher.name
FROM teacher
INNER JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id
GROUP BY teacher.name
HAVING COUNT(DISTINCT course_arrange.course_id) >= 2;<separator>SELECT teacher.name
FROM teacher
LEFT JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id
WHERE course_arrange.teacher_id IS NULL<separator>SELECT teacher.name 
FROM teacher
LEFT JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id 
WHERE course_arrange.teacher_id IS NULL<separator>SELECT COUNT(visitor_id) 
FROM visitor 
WHERE age < 30<separator>SELECT name 
FROM visitor 
WHERE level_of_membership > 4 
ORDER BY level_of_membership DESC;<separator>SELECT AVG(age) 
FROM visitor 
WHERE level_of_membership <= 4<separator>SELECT visitor.name, visitor.level_of_membership
FROM visitor
WHERE visitor.level_of_membership > 4
ORDER BY visitor.age ASC;<separator>SELECT museum_id, name 
FROM museum 
WHERE num_of_staff = (SELECT MAX(num_of_staff) FROM museum)<separator>SELECT AVG(num_of_staff) 
FROM museum 
WHERE open_year < 2009<separator>SELECT open_year, num_of_staff FROM museum WHERE name = 'plaza museum';<separator>SELECT museum.name
FROM museum
WHERE museum.num_of_staff > (SELECT MIN(m.num_of_staff) 
                             FROM museum AS m 
                             WHERE m.open_year > 2010)<separator>SELECT v.id, v.name, v.age 
FROM visitor v
WHERE v.id IN (
    SELECT visitor_id 
    FROM visit 
    GROUP BY visitor_id 
    HAVING COUNT(DISTINCT museum_id) > 1
)<separator>SELECT visitor.id, visitor.name, visitor.level_of_membership
FROM visitor
JOIN visit ON visitor.id = visit.visitor_id
JOIN museum ON visit.museum_id = museum.museum_id
GROUP BY visitor.id, visitor.name, visitor.level_of_membership
ORDER BY SUM(visit.total_spent) DESC
LIMIT 1;<separator>SELECT museum_id, name
FROM museum
JOIN visit ON museum.museum_id = visit.museum_id
GROUP BY museum.museum_id, museum.name
HAVING COUNT(visit.museum_id) = (SELECT MAX(most_times)
								FROM (SELECT museum_id, COUNT(museum_id) AS most_times
										FROM visit
										GROUP BY museum_id) AS most_visited)<separator>SELECT museum.name
FROM museum
LEFT JOIN visit ON museum.museum_id = visit.museum_id
WHERE visit.visitor_id IS NULL<separator>SELECT visitor.name, visitor.age
FROM visitor
JOIN visit ON visitor.id = visit.visitor_id
WHERE visit.num_of_ticket = (
   SELECT MAX(num_of_ticket)
   FROM visit
)<separator>SELECT AVG(num_of_ticket), MAX(num_of_ticket) FROM visit<separator>SELECT SUM(total_spent) 
FROM visit 
JOIN visitor ON visit.visitor_id = visitor.id 
WHERE visitor.level_of_membership = 1<separator>SELECT visitor.name 
FROM visitor 
WHERE visitor.id IN (
    SELECT visit.visitor_id 
    FROM visit 
    INNER JOIN museum ON visit.museum_id = museum.museum_id 
    WHERE museum.open_year < 2009
) 
AND visitor.id IN (
    SELECT visit.visitor_id 
    FROM visit 
    INNER JOIN museum ON visit.museum_id = museum.museum_id 
    WHERE museum.open_year > 2011
)<separator>SELECT COUNT(DISTINCT visitor_id) 
FROM visit 
JOIN museum ON visit.museum_id = museum.museum_id
WHERE museum.open_year > 2010;<separator>SELECT COUNT(*) FROM museum WHERE open_year > 2013 OR open_year < 2008;<separator>SELECT COUNT(*) FROM players<separator>SELECT COUNT(*) FROM players<separator>SELECT COUNT(*) AS total_matches FROM matches<separator>SELECT COUNT(*) AS match_count
FROM matches<separator>SELECT first_name, birth_date 
FROM players 
WHERE country_code = 'usa'<separator>SELECT first_name, birth_date
FROM players
WHERE country_code = 'usa'<separator>SELECT AVG(loser_age) AS avg_loser_age, AVG(winner_age) AS avg_winner_age
FROM matches<separator>SELECT AVG(loser_age) as average_loser_age, AVG(winner_age) as average_winner_age
FROM matches<separator>SELECT AVG(winner_rank) 
FROM matches<separator>SELECT AVG(winner_rank)
FROM matches
INNER JOIN players ON matches.winner_id = players.player_id<separator>SELECT MAX(loser_rank) 
FROM matches 
JOIN players ON matches.loser_id = players.player_id<separator>SELECT MAX(loser_rank) AS best_rank 
FROM matches 
INNER JOIN players ON matches.loser_id = players.player_id<separator>SELECT COUNT(DISTINCT country_code) FROM players;<separator>SELECT COUNT(DISTINCT country_code) AS distinct_countries
FROM players<separator>SELECT COUNT(DISTINCT loser_name)
FROM matches<separator>SELECT COUNT(DISTINCT loser_name)
FROM matches;<separator>SELECT tourney_name FROM matches
GROUP BY tourney_name
HAVING COUNT(*) > 10;<separator>SELECT DISTINCT tourney_name
FROM matches
GROUP BY tourney_name
HAVING COUNT(match_num) > 10<separator>SELECT DISTINCT winner_name
FROM matches
WHERE year = 2013
AND winner_name IN (
    SELECT DISTINCT winner_name
    FROM matches
    WHERE year = 2016
)<separator>SELECT DISTINCT p.first_name, p.last_name
FROM players p
JOIN matches m ON m.winner_id = p.player_id
WHERE (m.year = 2013 OR m.year = 2016)
GROUP BY p.player_id
HAVING COUNT(DISTINCT m.year) = 2<separator>SELECT COUNT(*) FROM matches WHERE year = 2013 OR year = 2016<separator>SELECT COUNT(*) FROM matches WHERE year IN (2013, 2016)<separator>SELECT players.country_code, players.first_name 
FROM players 
WHERE players.player_id IN (
    SELECT matches.winner_id 
    FROM matches 
    INNER JOIN tourneys ON matches.tourney_id = tourneys.tourney_id 
    WHERE tourneys.tourney_name = 'tourney wta championships' 
        AND tourneys.tourney_level = 'G'
    INTERSECT
    SELECT matches.winner_id 
    FROM matches 
    INNER JOIN tourneys ON matches.tourney_id = tourneys.tourney_id 
    WHERE tourneys.tourney_name = 'australian open'
)<separator>SELECT players.first_name, players.country_code 
FROM players 
INNER JOIN matches ON players.player_id = matches.winner_id 
INNER JOIN tournaments ON matches.tourney_id = tournaments.tourney_id 
WHERE tournaments.tourney_name = 'WTA Championships' AND tournaments.tourney_name = 'Australian Open'<separator>SELECT players.first_name, players.country_code 
FROM players 
WHERE players.birth_date = (SELECT MIN(birth_date) FROM players)<separator>SELECT players.first_name, players.country_code
FROM players
WHERE players.birth_date = (SELECT MAX(players.birth_date) FROM players)<separator>SELECT first_name, last_name 
FROM players 
ORDER BY birth_date ASC;<separator>SELECT CONCAT(players.first_name, ' ', players.last_name) AS full_name
FROM players
ORDER BY players.birth_date ASC<separator>SELECT first_name, last_name
FROM players
WHERE hand = 'L'
ORDER BY birth_date;<separator>SELECT first_name || ' ' || last_name AS full_name 
FROM players 
WHERE hand = 'L' 
ORDER BY birth_date<separator>SELECT players.first_name, players.country_code 
FROM players 
INNER JOIN rankings ON players.player_id = rankings.player_id 
GROUP BY players.player_id 
ORDER BY COUNT(rankings.tours) DESC LIMIT 1;<separator>SELECT players.first_name, players.country_code
FROM players
INNER JOIN rankings ON players.player_id = rankings.player_id
GROUP BY players.player_id
HAVING COUNT(rankings.tours) = (SELECT MAX(tours) FROM rankings)<separator>SELECT year, COUNT(*) as num_matches
FROM matches
GROUP BY year
ORDER BY num_matches DESC
LIMIT 1;<separator>SELECT year, COUNT(*) AS match_count
FROM matches
GROUP BY year
ORDER BY match_count DESC
LIMIT 1;<separator>SELECT m.winner_name, m.winner_rank_points
FROM matches m
GROUP BY m.winner_id, m.winner_name, m.winner_rank_points
HAVING COUNT(*) = (
    SELECT MAX(winner_count)
    FROM (
        SELECT COUNT(*) as winner_count
        FROM matches
        GROUP BY winner_id
    ) s
)<separator>SELECT winner_name, winner_rank_points 
FROM matches 
JOIN players ON matches.winner_id = players.player_id 
GROUP BY winner_id 
ORDER BY COUNT(*) DESC 
LIMIT 1<separator>SELECT winner_name
FROM matches
JOIN players ON matches.winner_id = players.player_id
WHERE matches.tourney_name = 'australian open'
ORDER BY winner_rank_points DESC
LIMIT 1<separator>SELECT winner_name 
FROM matches 
WHERE tourney_name = 'australian open' 
ORDER BY winner_rank_points DESC 
LIMIT 1<separator>SELECT m.winner_name, m.loser_name
FROM matches m
WHERE m.minutes = (SELECT MAX(minutes) FROM matches)<separator>SELECT m.winner_name, m.loser_name
FROM matches m
WHERE m.minutes = (SELECT MAX(minutes) FROM matches)<separator>SELECT players.first_name, AVG(rankings.ranking) AS average_ranking
FROM players
JOIN rankings ON players.player_id = rankings.player_id
GROUP BY players.player_id, players.first_name<separator>SELECT players.first_name, AVG(rankings.ranking)
FROM players
JOIN rankings ON players.player_id = rankings.player_id
GROUP BY players.first_name<separator>SELECT players.first_name, SUM(rankings.ranking_points) AS total_ranking_points
FROM players
JOIN rankings ON players.player_id = rankings.player_id
GROUP BY players.player_id, players.first_name<separator>SELECT first_name, SUM(rankings.ranking_points) AS total_ranking_points
FROM players
LEFT JOIN rankings ON players.player_id = rankings.player_id
GROUP BY first_name<separator>SELECT country_code, COUNT(*) AS player_count
FROM players
GROUP BY country_code<separator>SELECT COUNT(*) as num_players, country_code
FROM players
GROUP BY country_code<separator>SELECT players.country_code  
FROM players  
GROUP BY players.country_code  
HAVING COUNT(players.player_id) = (SELECT MAX(player_count)  
                                  FROM (SELECT COUNT(players.player_id) as player_count  
                                        FROM players  
                                        GROUP BY players.country_code) as player_counts)<separator>SELECT players.country_code
FROM players
GROUP BY players.country_code
ORDER BY COUNT(*) DESC
LIMIT 1<separator>SELECT country_code FROM players
GROUP BY country_code
HAVING COUNT(*) > 50<separator>SELECT DISTINCT players.country_code
FROM players
GROUP BY players.country_code
HAVING COUNT(players.player_id) > 50<separator>SELECT ranking_date, COUNT(tours) AS total_tours
FROM rankings
GROUP BY ranking_date<separator>SELECT ranking_date, COUNT(tours) AS total_tours
FROM rankings
GROUP BY ranking_date<separator>SELECT year, COUNT(*) AS match_count
FROM matches
GROUP BY year;<separator>SELECT year, COUNT(*) AS total_matches
FROM matches
GROUP BY year;<separator>SELECT winner_name, winner_rank 
FROM matches 
JOIN players ON matches.winner_id = players.player_id 
ORDER BY winner_age 
LIMIT 3<separator>SELECT winner_name, winner_rank 
FROM matches 
WHERE winner_age IS NOT NULL 
ORDER BY winner_age 
LIMIT 3<separator>SELECT COUNT(DISTINCT m.winner_id) AS num_of_winners
FROM matches m
JOIN players p ON m.winner_id = p.player_id
WHERE m.tourney_name = 'wta championships'
  AND p.hand = 'left'<separator>SELECT COUNT(matches.winner_id) 
FROM matches 
JOIN players ON matches.winner_id = players.player_id
WHERE players.hand = 'L'
AND matches.tourney_name = 'WTA Championships';<separator>SELECT players.first_name, players.country_code, players.birth_date
FROM players
INNER JOIN matches ON matches.winner_id = players.player_id
INNER JOIN rankings ON rankings.player_id = players.player_id
WHERE rankings.ranking_points = (SELECT MAX(ranking_points) FROM rankings)
<separator>SELECT players.first_name, players.country_code, players.birth_date 
FROM players 
WHERE players.player_id = (
    SELECT rankings.player_id 
    FROM rankings 
    WHERE rankings.ranking_points = (
        SELECT MAX(rankings.ranking_points)
        FROM rankings
    )
    LIMIT 1
)<separator>SELECT hand, COUNT(*) AS num_players
FROM players
GROUP BY hand<separator>SELECT hand, COUNT(*) as player_count
FROM players
GROUP BY hand<separator>SELECT COUNT(*) 
FROM ship 
WHERE disposition_of_ship = 'captured'<separator>SELECT name, tonnage 
FROM ship 
ORDER BY name DESC;<separator>SELECT name, date, result 
FROM battle<separator>SELECT battle.name AS battle_name, 
       MAX(death.killed) AS maximum_death_toll, 
       MIN(death.killed) AS minimum_death_toll
FROM battle
JOIN death ON death.caused_by_ship_id = battle.id
GROUP BY battle.id, battle.name;<separator>SELECT AVG(death.injured) AS average_injuries
FROM death
JOIN ship ON death.caused_by_ship_id = ship.id
JOIN battle ON ship.lost_in_battle = battle.id<separator>SELECT * from death 
WHERE caused_by_ship_id IN (
    SELECT id FROM ship 
    WHERE tonnage = 't'
)<separator>SELECT name, result
FROM battle
WHERE bulgarian_commander != 'boril'<separator>SELECT battle.id, battle.name 
FROM battle 
INNER JOIN ship ON battle.id = ship.lost_in_battle 
WHERE ship.ship_type = 'brig'<separator>SELECT battle.id, battle.name
FROM battle
JOIN death ON battle.id = death.caused_by_ship_id
GROUP BY battle.id, battle.name
HAVING SUM(death.killed) > 10<separator>SELECT ship.id, ship.name 
FROM ship
JOIN death ON death.caused_by_ship_id = ship.id
GROUP BY ship.id, ship.name
ORDER BY SUM(death.injured) DESC
LIMIT 1<separator>SELECT DISTINCT battle.name 
FROM battle 
WHERE battle.bulgarian_commander = 'kaloyan' 
AND battle.latin_commander = 'baldwin i'<separator>SELECT COUNT(DISTINCT result) FROM battle;<separator>SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225')<separator>SELECT battle.name, battle.date 
FROM battle 
INNER JOIN ship ON ship.lost_in_battle = battle.id
WHERE (ship.name = 'lettice' OR ship.name = 'hms atalanta')<separator>SELECT battle.name, battle.result, battle.bulgarian_commander FROM battle 
JOIN ship ON ship.lost_in_battle = battle.id 
WHERE ship.name != 'english channel' OR ship.lost_in_battle IS NULL<separator>SELECT note 
FROM death 
WHERE note LIKE '%east%'<separator>SELECT line_1, line_2
FROM addresses<separator>SELECT line_1, line_2 FROM addresses<separator>SELECT COUNT(*) FROM courses;<separator>SELECT COUNT(*) FROM courses;<separator>SELECT course_description 
FROM courses 
WHERE course_name = 'math'<separator>SELECT course_description
FROM courses
WHERE course_name LIKE 'math%'<separator>SELECT zip_postcode
FROM addresses
WHERE city = 'port chelsea'<separator>SELECT zip_postcode
FROM addresses
WHERE city = 'port chelsea'<separator>SELECT departments.department_id, departments.department_name
FROM departments
JOIN degree_programs ON departments.department_id = degree_programs.department_id
GROUP BY departments.department_id, departments.department_name
ORDER BY COUNT(degree_programs.degree_program_id) DESC
LIMIT 1<separator>SELECT department_id, department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM degree_programs
    GROUP BY department_id
    HAVING COUNT(degree_program_id) = (
        SELECT MAX(degree_count)
        FROM (
            SELECT COUNT(degree_program_id) as degree_count
            FROM degree_programs
            GROUP BY department_id
        ) AS department_degrees
    )
)<separator>SELECT COUNT(*) 
FROM departments 
WHERE department_id IN (SELECT department_id 
                        FROM degree_programs)<separator>SELECT COUNT(DISTINCT department_id) FROM degree_programs;<separator>SELECT COUNT(DISTINCT degree_summary_name) FROM degree_programs<separator>SELECT COUNT(DISTINCT degree_program_id) FROM degree_programs<separator>SELECT COUNT(degree_programs.degree_program_id)
FROM degree_programs
JOIN departments ON degree_programs.department_id = departments.department_id
WHERE departments.department_name = 'engineering'<separator>SELECT COUNT(*) FROM degree_programs WHERE department_id = (SELECT department_id FROM departments WHERE department_name = 'engineering');<separator>SELECT section_name, section_description 
FROM sections<separator>SELECT section_name, section_description
FROM sections<separator>SELECT course_id, course_name
FROM courses
WHERE course_id IN (
  SELECT course_id
  FROM sections
  GROUP BY course_id
  HAVING COUNT(*) <= 2
)<separator>SELECT course_id, course_name
FROM courses
WHERE course_id IN (SELECT course_id
                    FROM sections
                    GROUP BY course_id
                    HAVING COUNT(section_id) < 2)<separator>SELECT section_name
FROM sections
ORDER BY section_name DESC<separator>SELECT section_name
FROM sections
ORDER BY section_name DESC;<separator>SELECT semesters.semester_name, semesters.semester_id
FROM student_enrolment
JOIN semesters ON student_enrolment.semester_id = semesters.semester_id
GROUP BY student_enrolment.semester_id
ORDER BY COUNT(student_enrolment.student_id) DESC
LIMIT 1<separator>SELECT semester_id, semester_name 
FROM semesters 
WHERE semester_id IN (
    SELECT semester_id 
    FROM student_enrolment 
    GROUP BY semester_id 
    HAVING COUNT(*) = (
        SELECT MAX(student_count) 
        FROM (
            SELECT semester_id, COUNT(*) AS student_count 
            FROM student_enrolment 
            GROUP BY semester_id
        ) AS counts
    )
)<separator>SELECT department_description 
FROM departments 
WHERE department_name LIKE '%computer%';<separator>SELECT department_description 
FROM departments 
WHERE department_name LIKE '%computer%'<separator>SELECT students.first_name, students.middle_name, students.last_name, students.student_id
FROM students
JOIN student_enrolment ON students.student_id = student_enrolment.student_id
JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id
GROUP BY students.student_id
HAVING COUNT(DISTINCT degree_programs.degree_program_id) = 2;<separator>SELECT students.student_id, students.first_name, students.middle_name, students.last_name
FROM students
JOIN student_enrolment ON students.student_id = student_enrolment.student_id
GROUP BY students.student_id
HAVING COUNT(DISTINCT student_enrolment.degree_program_id) = 2
AND COUNT(DISTINCT student_enrolment.semester_id) = 1<separator>SELECT students.first_name, students.middle_name, students.last_name
FROM students
JOIN student_enrolment ON student_enrolment.student_id = students.student_id
JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id
WHERE degree_programs.degree_summary_name LIKE '%bachelor%';<separator>SELECT first_name, middle_name, last_name
FROM students
JOIN student_enrolment ON students.student_id = student_enrolment.student_id
JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id
WHERE degree_summary_name = 'Bachelor'
<separator>SELECT degree_summary_name 
FROM degree_programs 
WHERE degree_program_id = (
    SELECT degree_program_id 
    FROM student_enrolment 
    GROUP BY degree_program_id 
    ORDER BY COUNT(student_id) DESC 
    LIMIT 1
)<separator>SELECT degree_programs.degree_summary_name
FROM degree_programs
JOIN student_enrolment ON degree_programs.degree_program_id = student_enrolment.degree_program_id
GROUP BY degree_programs.degree_summary_name
ORDER BY COUNT(student_enrolment.student_enrolment_id) DESC
LIMIT 1<separator>SELECT degree_programs.degree_program_id, degree_programs.degree_summary_name 
FROM degree_programs 
JOIN student_enrolment ON degree_programs.degree_program_id = student_enrolment.degree_program_id 
GROUP BY degree_programs.degree_program_id, degree_programs.degree_summary_name 
ORDER BY COUNT(student_enrolment.student_enrolment_id) DESC 
LIMIT 1;<separator>SELECT degree_program_id, degree_summary_description
FROM degree_programs
WHERE degree_program_id IN (
    SELECT degree_program_id
    FROM student_enrolment
    GROUP BY degree_program_id
    HAVING COUNT(*) = (
        SELECT MAX(student_count)
        FROM (
            SELECT degree_program_id, COUNT(*) AS student_count
            FROM student_enrolment
            GROUP BY degree_program_id
        ) AS count_table
    )
)<separator>SELECT student_enrolment.student_id, students.first_name, students.middle_name, students.last_name, COUNT(student_enrolment.student_enrolment_id) AS num_enrollments 
FROM student_enrolment 
INNER JOIN students ON student_enrolment.student_id = students.student_id 
GROUP BY student_enrolment.student_id, students.first_name, students.middle_name, students.last_name 
ORDER BY num_enrollments DESC 
LIMIT 1;<separator>SELECT students.student_id, students.first_name, students.middle_name, students.last_name, COUNT(student_enrolment.student_enrolment_id) AS number_of_enrollments
FROM students
JOIN student_enrolment ON students.student_id = student_enrolment.student_id
GROUP BY students.student_id, students.first_name, students.middle_name, students.last_name
ORDER BY number_of_enrollments DESC
LIMIT 1<separator>SELECT s.semester_name
FROM semesters s
LEFT JOIN student_enrolment se ON s.semester_id = se.semester_id
WHERE se.semester_id IS NULL<separator>SELECT semester_name FROM semesters 
WHERE semester_id NOT IN (SELECT semester_id FROM student_enrolment)<separator>SELECT course_name
FROM courses
WHERE course_id IN (
    SELECT course_id
    FROM student_enrolment_courses
)<separator>SELECT course_name
FROM courses
WHERE course_id IN (
    SELECT course_id
    FROM student_enrolment_courses
)<separator>SELECT course_name 
FROM courses 
WHERE course_id = (SELECT course_id 
                   FROM student_enrollment_courses 
                   GROUP BY course_id 
                   ORDER BY COUNT(*) DESC 
                   LIMIT 1)<separator>SELECT course_name 
FROM courses 
WHERE course_id = (
    SELECT course_id 
    FROM student_enrolment_courses 
    GROUP BY course_id 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
    )<separator>SELECT last_name
FROM students
JOIN addresses ON students.current_address_id = addresses.address_id
WHERE state_province_county = 'north carolina'
AND student_id NOT IN (SELECT student_id FROM student_enrolment)<separator>SELECT last_name
FROM students
WHERE state_province_county = 'North Carolina'
AND student_id NOT IN (
    SELECT student_id
    FROM student_enrolment
    WHERE degree_program_id IS NULL
)<separator>SELECT transcripts.transcript_date, transcripts.transcript_id
FROM transcripts
INNER JOIN transcript_contents ON transcripts.transcript_id = transcript_contents.transcript_id
INNER JOIN student_enrolment_courses ON transcript_contents.student_course_id = student_enrolment_courses.student_course_id
GROUP BY transcripts.transcript_date, transcripts.transcript_id
HAVING COUNT(student_enrolment_courses.course_id) >= 2;<separator>SELECT transcripts.transcript_date, transcripts.transcript_id
FROM transcripts
INNER JOIN transcript_contents ON transcripts.transcript_id = transcript_contents.transcript_id
INNER JOIN student_enrolment_courses ON transcript_contents.student_course_id = student_enrolment_courses.student_course_id
GROUP BY transcripts.transcript_date, transcripts.transcript_id
HAVING COUNT(student_enrolment_courses.student_course_id) >= 2;<separator>SELECT cell_mobile_number 
FROM students 
WHERE first_name = 'timmothy' AND last_name = 'ward'<separator>SELECT cell_mobile_number
FROM students
WHERE first_name = 'timmothy' AND last_name = 'ward'<separator>SELECT first_name, middle_name, last_name 
FROM students 
WHERE date_first_registered = (SELECT MIN(date_first_registered) FROM students) 
LIMIT 1<separator>SELECT students.first_name, students.middle_name, students.last_name
FROM students INNER JOIN student_enrolment ON students.student_id = student_enrolment.student_id
ORDER BY student_enrolment.date_first_registered
LIMIT 1<separator>SELECT first_name, middle_name, last_name
FROM students
ORDER BY date_left ASC
LIMIT 1;<separator>SELECT students.first_name, students.middle_name, students.last_name
FROM students
LEFT JOIN student_enrolment ON students.student_id = student_enrolment.student_id
LEFT JOIN transcript_contents ON student_enrolment.student_enrolment_id = transcript_contents.student_course_id
LEFT JOIN transcripts ON transcript_contents.transcript_id = transcripts.transcript_id
ORDER BY transcripts.transcripts_date ASC
LIMIT 1<separator>SELECT students.first_name
FROM students
JOIN addresses ON students.permanent_address_id = addresses.address_id
WHERE students.current_address_id != students.permanent_address_id<separator>SELECT students.first_name 
FROM students 
JOIN addresses AS perm_address ON students.permanent_address_id = perm_address.address_id 
JOIN addresses AS curr_address ON students.current_address_id = curr_address.address_id 
WHERE perm_address.address_id <> curr_address.address_id<separator>SELECT a.address_id, a.line_1, a.line_2, a.line_3
FROM addresses a
JOIN students s ON s.current_address_id = a.address_id
GROUP BY a.address_id
ORDER BY COUNT(s.current_address_id) DESC
LIMIT 1;<separator>SELECT address_id, line_1, line_2 
FROM addresses 
WHERE address_id IN (
    SELECT current_address_id 
    FROM students 
    GROUP BY current_address_id 
    ORDER BY COUNT(*) DESC 
    LIMIT 1
)<separator>SELECT AVG(transcripts.transcript_date)
FROM transcripts;<separator>SELECT AVG(transcript_date) FROM transcripts;<separator>SELECT transcript_date, other_details
FROM transcripts
ORDER BY transcript_date ASC
LIMIT 1;<separator>SELECT MIN(transcript_date) AS earliest_date, other_details 
FROM transcripts 
GROUP BY other_details<separator>SELECT COUNT(*) FROM transcripts<separator>SELECT COUNT(*) FROM transcripts<separator>SELECT MAX(transcript_date) FROM transcripts;<separator>SELECT MAX(transcript_date) FROM transcripts<separator>SELECT COUNT(student_enrolment_courses.student_course_id) AS enrollment_count, student_enrolment_courses.student_course_id
FROM student_enrolment_courses
GROUP BY student_enrolment_courses.student_course_id
ORDER BY enrollment_count DESC
LIMIT 1<separator>SELECT course_id, COUNT(*) AS count
FROM student_enrolment_courses
GROUP BY course_id
ORDER BY count DESC
LIMIT 1;<separator>SELECT transcript_id, transcript_date 
FROM transcripts 
WHERE transcript_id IN (
    SELECT transcript_id 
    FROM transcript_contents 
    GROUP BY transcript_id 
    HAVING COUNT(*) = (
        SELECT MIN(result_count) 
        FROM (
            SELECT transcript_id, COUNT(*) as result_count 
            FROM transcript_contents 
            GROUP BY transcript_id
        ) AS counts
    )
)<separator>SELECT transcript_id, transcript_date 
FROM transcripts 
ORDER BY (SELECT COUNT(*) FROM transcript_contents WHERE transcript_contents.transcript_id = transcripts.transcript_id) ASC 
LIMIT 1<separator>SELECT semesters.semester_name
FROM semesters
JOIN student_enrolment ON semesters.semester_id = student_enrolment.semester_id
JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id
WHERE degree_programs.degree_summary_name = 'Master' AND semesters.semester_id IN (
  SELECT semesters.semester_id
  FROM semesters
  JOIN student_enrolment ON semesters.semester_id = student_enrolment.semester_id
  JOIN degree_programs ON student_enrolment.degree_program_id = degree_programs.degree_program_id
  WHERE degree_programs.degree_summary_name = 'Bachelor'
)<separator>SELECT semester_id 
FROM student_enrolment 
WHERE degree_program_id IN (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Masters') 
    AND degree_program_id IN (SELECT degree_program_id FROM degree_programs WHERE degree_summary_name = 'Bachelors');<separator>SELECT COUNT(DISTINCT current_address_id) FROM students WHERE current_address_id IS NOT NULL<separator>SELECT DISTINCT addresses.*
FROM addresses
INNER JOIN students ON addresses.address_id = students.current_address_id OR addresses.address_id = students.permanent_address_id<separator>SELECT * FROM students ORDER BY last_name DESC, first_name DESC, middle_name DESC;<separator>SELECT * FROM students ORDER BY last_name DESC<separator>SELECT * FROM sections WHERE section_name = 'h'<separator>SELECT section_description FROM sections WHERE section_name = 'h';<separator>SELECT students.first_name 
FROM students 
JOIN addresses ON students.permanent_address_id = addresses.address_id 
WHERE addresses.country = 'haiti' 
OR students.cell_mobile_number = '09700166582'<separator>SELECT students.first_name
FROM students
JOIN addresses ON students.permanent_address_id = addresses.address_id
WHERE addresses.country = 'haiti'
OR students.cell_mobile_number = '09700166582'<separator>SELECT title
FROM cartoon
ORDER BY title ASC;<separator>SELECT title FROM cartoon ORDER BY title ASC;<separator>SELECT * FROM cartoon WHERE directed_by = "ben jones";<separator>SELECT cartoon.title
FROM cartoon
WHERE cartoon.directed_by = 'Ben Jones'<separator>SELECT COUNT(*) 
FROM cartoon 
WHERE written_by = 'joseph kuhr'<separator>SELECT COUNT(*) 
FROM cartoon 
WHERE written_by = 'Joseph Kuhr'<separator>SELECT cartoon.title, cartoon.directed_by
FROM cartoon
ORDER BY cartoon.original_air_date;<separator>SELECT cartoon.title, cartoon.directed_by 
FROM cartoon 
ORDER BY cartoon.original_air_date<separator>SELECT title 
FROM cartoon 
WHERE directed_by = 'ben jones' OR directed_by = 'brandon vietti'<separator>SELECT title 
FROM cartoon 
WHERE directed_by = "ben jones" OR directed_by = "brandon vietti"<separator>SELECT tv_channel.country, COUNT(tv_channel.id) AS num_channels
FROM tv_channel
GROUP BY tv_channel.country
ORDER BY num_channels DESC
LIMIT 1;<separator>SELECT country, COUNT(*) AS number_of_channels
FROM tv_channel
GROUP BY country
ORDER BY number_of_channels DESC
LIMIT 1;<separator>SELECT COUNT(DISTINCT series_name) AS num_series, COUNT(DISTINCT content) AS num_contents
FROM tv_channel<separator>SELECT COUNT(DISTINCT series_name) AS series_count, COUNT(DISTINCT content) AS content_count
FROM tv_channel<separator>SELECT content FROM tv_channel WHERE series_name = 'sky radio'<separator>SELECT content
FROM tv_channel
WHERE series_name = 'sky radio'<separator>SELECT package_option
FROM tv_channel
WHERE series_name = "sky radio"<separator>SELECT package_option
FROM tv_channel
WHERE series_name = 'sky radio'<separator>SELECT COUNT(*) FROM tv_channel WHERE language = 'english'<separator>SELECT COUNT(*) FROM tv_channel WHERE language = 'english';<separator>SELECT tv_channel.language, COUNT(tv_channel.id) AS numb_of_channels
FROM tv_channel
GROUP BY tv_channel.language
ORDER BY numb_of_channels ASC
LIMIT 1;<separator>SELECT tv_channel.language, COUNT(tv_series.channel) AS num_channels 
FROM tv_channel 
JOIN tv_series ON tv_channel.id = tv_series.channel 
GROUP BY tv_channel.language 
ORDER BY num_channels ASC 
LIMIT 1;<separator>SELECT tv_channel.language, COUNT(tv_channel.id) 
FROM tv_channel 
GROUP BY tv_channel.language<separator>SELECT COUNT(tv_channel.id) AS language_count
FROM tv_channel
WHERE tv_channel.language = '<language>';<separator>SELECT tv_channel.series_name
FROM tv_channel
JOIN cartoon ON tv_channel.id = cartoon.channel
WHERE cartoon.title = "the rise of the blue beetle!"<separator>SELECT tv_channel.series_name 
FROM tv_channel 
INNER JOIN cartoon ON cartoon.channel = tv_channel.id 
WHERE cartoon.title = "the rise of the blue beetle"<separator>SELECT cartoon.title 
FROM cartoon 
JOIN tv_channel ON cartoon.channel = tv_channel.id 
JOIN tv_series ON tv_series.channel = tv_channel.id 
WHERE tv_channel.series_name = "sky radio"<separator>SELECT cartoon.title 
FROM cartoon 
JOIN tv_channel ON cartoon.channel = tv_channel.id 
JOIN tv_series ON tv_series.channel = tv_channel.id 
WHERE tv_channel.series_name = "sky radio"<separator>SELECT episode 
FROM tv_series 
ORDER BY rating<separator>SELECT * 
FROM tv_series
ORDER BY rating ASC;<separator>SELECT tv_series.episode, tv_series.rating 
FROM tv_series 
ORDER BY tv_series.rating DESC 
LIMIT 3<separator>SELECT episode, rating
FROM tv_series 
ORDER BY rating DESC
LIMIT 3<separator>SELECT MIN(tv_series.share), MAX(tv_series.share) FROM tv_series;<separator>SELECT MAX(share), MIN(share) FROM tv_series;<separator>SELECT air_date
FROM tv_series
WHERE episode = "a love of a lifetime";<separator>SELECT air_date
FROM tv_series
WHERE episode = "a love of a lifetime"<separator>SELECT weekly_rank 
FROM tv_series 
WHERE episode = "a love of a lifetime"<separator>SELECT weekly_rank 
FROM tv_series 
WHERE episode = "a love of a lifetime"<separator>SELECT tv_channel.series_name AS tv_channel_series_name
FROM cartoon
INNER JOIN tv_channel ON cartoon.channel = tv_channel.id
INNER JOIN tv_series ON tv_series.channel = tv_channel.id
WHERE tv_series.episode = 'a love of a lifetime'<separator>SELECT cartoon.title
FROM cartoon
INNER JOIN tv_series ON cartoon.id = tv_series.id
WHERE tv_series.episode = "a love of a lifetime"<separator>SELECT tv_series.episode 
FROM tv_series 
JOIN tv_channel ON tv_series.channel = tv_channel.id
WHERE tv_channel.series_name = 'sky radio'<separator>SELECT episode
FROM tv_series
WHERE series_name = "sky radio"<separator>SELECT directed_by, COUNT(*) AS num_cartoons
FROM cartoon
GROUP BY directed_by;<separator>SELECT cartoon.directed_by, COUNT(*) 
FROM cartoon 
GROUP BY cartoon.directed_by<separator>SELECT production_code, channel 
FROM cartoon 
WHERE original_air_date = (SELECT MAX(original_air_date) FROM cartoon)<separator>SELECT production_code, channel FROM cartoon 
ORDER BY original_air_date DESC 
LIMIT 1;<separator>SELECT tv_channel.package_option, tv_channel.series_name
FROM tv_channel
WHERE tv_channel.hight_definition_tv = 'yes'<separator>SELECT tv_channel.package_option, tv_series.series_name
FROM tv_channel
JOIN tv_series ON tv_series.channel = tv_channel.id
WHERE tv_channel.hight_definition_tv = true<separator>SELECT DISTINCT tv_channel.country
FROM tv_channel
JOIN cartoon ON cartoon.channel = tv_channel.id
WHERE cartoon.written_by = 'Todd Casey'<separator>SELECT tv_channel.country
FROM cartoon
JOIN tv_channel ON cartoon.channel = tv_channel.id
WHERE cartoon.written_by = 'todd casey'<separator>SELECT DISTINCT tv_channel.country
FROM tv_channel
LEFT JOIN cartoon ON cartoon.channel = tv_channel.id AND cartoon.written_by = 'todd casey'
WHERE cartoon.id IS NULL<separator>SELECT DISTINCT tv_channel.country
FROM tv_channel
WHERE tv_channel.id NOT IN (SELECT cartoon.channel
                             FROM cartoon
                             WHERE cartoon.written_by = 'todd casey')<separator>SELECT tv_channel.series_name, tv_channel.country
FROM tv_channel
JOIN cartoon ON cartoon.channel = tv_channel.id
WHERE cartoon.directed_by IN ('ben jones', 'michael chang')<separator>SELECT tv_channel.series_name, tv_channel.country 
FROM tv_channel 
JOIN cartoon ON cartoon.channel = tv_channel.id 
WHERE cartoon.directed_by = 'ben jones' 
   OR cartoon.directed_by = 'michael chang'<separator>SELECT pixel_aspect_ratio_par, country
FROM tv_channel
WHERE language <> 'english'<separator>SELECT pixel_aspect_ratio_par, country 
FROM tv_channel 
WHERE language <> 'English'<separator>SELECT tv_channel.id
FROM tv_channel
WHERE tv_channel.country IN (
    SELECT tv_channel.country
    FROM tv_channel
    GROUP BY tv_channel.country
    HAVING COUNT(tv_channel.id) > 2
)<separator>SELECT id FROM tv_channel
GROUP BY id
HAVING COUNT(id) > 2<separator>SELECT tv_channel.id
FROM tv_channel
WHERE tv_channel.id NOT IN (
    SELECT cartoon.channel
    FROM cartoon
    WHERE cartoon.directed_by = 'ben jones'
)<separator>SELECT tv_channel.id FROM tv_channel LEFT JOIN cartoon ON tv_channel.id = cartoon.channel WHERE cartoon.directed_by <> 'Ben Jones' OR cartoon.directed_by IS NULL<separator>SELECT tv_channel.package_option 
FROM tv_channel 
LEFT JOIN cartoon ON tv_channel.id = cartoon.channel 
WHERE cartoon.directed_by != 'ben jones' OR cartoon.directed_by IS NULL<separator>SELECT package_option 
FROM tv_channel 
WHERE id NOT IN (
    SELECT DISTINCT channel 
    FROM cartoon 
    WHERE directed_by = 'ben jones'
)<separator>SELECT COUNT(*) FROM poker_player<separator>SELECT COUNT(*) FROM poker_player<separator>SELECT earnings
FROM poker_player
ORDER BY earnings DESC<separator>SELECT earnings 
FROM poker_player
ORDER BY earnings DESC;<separator>SELECT final_table_made, best_finish FROM poker_player<separator>SELECT final_table_made, best_finish
FROM poker_player
WHERE poker_player.people_id = people.people_id<separator>SELECT AVG(poker_player.earnings) FROM poker_player<separator>SELECT AVG(earnings) AS average_earnings
FROM poker_player<separator>SELECT money_rank 
FROM poker_player 
WHERE earnings = (SELECT MAX(earnings) FROM poker_player)<separator>SELECT money_rank 
FROM poker_player
WHERE earnings = (SELECT MAX(earnings) FROM poker_player)<separator>SELECT MAX(final_table_made) 
FROM poker_player 
JOIN people ON poker_player.people_id = people.people_id 
WHERE earnings < 200000;<separator>SELECT MAX(final_table_made) 
FROM poker_player 
WHERE earnings < 200000<separator>SELECT name
FROM people
JOIN poker_player ON people.people_id = poker_player.people_id<separator>SELECT people.name 
FROM poker_player 
JOIN people ON poker_player.people_id = people.people_id<separator>SELECT people.name 
FROM people 
INNER JOIN poker_player 
ON people.people_id = poker_player.people_id 
WHERE poker_player.earnings > 300000;<separator>SELECT p.name 
FROM people p 
JOIN poker_player pp ON p.people_id = pp.people_id 
WHERE pp.earnings > 300000;<separator>SELECT people.name
FROM people
JOIN poker_player
ON people.people_id = poker_player.people_id
ORDER BY poker_player.final_table_made ASC<separator>SELECT p.name
FROM people p
JOIN poker_player pp ON p.people_id = pp.people_id
ORDER BY pp.final_table_made ASC<separator>SELECT birth_date 
FROM people 
INNER JOIN poker_player 
ON people.people_id = poker_player.people_id 
WHERE earnings = (SELECT MIN(earnings) FROM poker_player)<separator>SELECT birth_date
FROM poker_player
JOIN people ON poker_player.people_id = people.people_id
ORDER BY earnings
LIMIT 1;<separator>SELECT money_rank 
FROM poker_player 
JOIN people ON poker_player.people_id = people.people_id 
WHERE height = (SELECT MAX(height) FROM people)<separator>SELECT poker_player.money_rank 
FROM poker_player 
JOIN people ON poker_player.people_id = people.people_id 
WHERE people.height = (SELECT MAX(height) FROM people)<separator>SELECT AVG(earnings) FROM poker_player 
JOIN people ON poker_player.people_id = people.people_id 
WHERE height > 200;<separator>SELECT AVG(earnings)
FROM poker_player
JOIN people ON people.people_id = poker_player.people_id
WHERE height > 200<separator>SELECT people.name 
FROM people 
INNER JOIN poker_player 
ON people.people_id = poker_player.people_id 
ORDER BY poker_player.earnings DESC<separator>SELECT people.name 
FROM people 
INNER JOIN poker_player ON poker_player.people_id = people.people_id 
ORDER BY poker_player.earnings DESC<separator>SELECT nationality, COUNT(*) AS count FROM people GROUP BY nationality;<separator>SELECT nationality, COUNT(*) AS count FROM people GROUP BY nationality;<separator>SELECT nationality, COUNT(*) as count 
FROM people 
GROUP BY nationality 
ORDER BY count DESC 
LIMIT 1<separator>SELECT nationality
FROM people
GROUP BY nationality
ORDER BY COUNT(*) DESC
LIMIT 1;<separator>SELECT p1.nationality 
FROM people p1 
JOIN people p2 ON p1.nationality = p2.nationality 
WHERE p1.people_id <> p2.people_id<separator>SELECT nationality
FROM people
GROUP BY nationality
HAVING COUNT(*) >= 2<separator>SELECT name, birth_date 
FROM people 
ORDER BY name ASC<separator>SELECT name, birth_date
FROM people
ORDER BY name ASC;<separator>SELECT name
FROM people
WHERE nationality <> 'russia'<separator>SELECT name 
FROM people 
WHERE nationality <> 'Russia'<separator>SELECT p.name
FROM people p
LEFT JOIN poker_player pp ON p.people_id = pp.people_id
WHERE pp.people_id IS NULL<separator>SELECT name 
FROM people 
LEFT JOIN poker_player ON people.people_id = poker_player.people_id 
WHERE poker_player.people_id IS NULL<separator>SELECT COUNT(DISTINCT nationality) FROM people<separator>SELECT COUNT(DISTINCT nationality) AS total_nationalities FROM people<separator>SELECT COUNT(DISTINCT state) FROM area_code_state<separator>SELECT contestant_number, contestant_name FROM contestants ORDER BY contestant_name DESC<separator>SELECT vote_id, phone_number, state FROM votes<separator>SELECT MAX(area_code) AS max_area_code, MIN(area_code) AS min_area_code
FROM area_code_state<separator>SELECT MAX(created) FROM votes WHERE state = 'ca'<separator>SELECT contestant_name
FROM contestants
WHERE contestant_name <> 'jessie alloway'<separator>SELECT DISTINCT state, created
FROM votes;<separator>SELECT contestant_number, contestant_name
FROM contestants
WHERE contestant_number IN (
    SELECT contestant_number
    FROM votes
    GROUP BY contestant_number
    HAVING COUNT(*) >= 2
)<separator>SELECT contestant_number, contestant_name
FROM contestants
WHERE contestant_number IN (
    SELECT contestant_number
    FROM votes
    GROUP BY contestant_number
    HAVING COUNT(vote_id) = (
        SELECT MIN(vote_count)
        FROM (
            SELECT contestant_number, COUNT(vote_id) AS vote_count
            FROM votes
            GROUP BY contestant_number
        ) AS vote_counts
    )
)<separator>SELECT COUNT(*) 
FROM votes 
WHERE state = 'ny' OR state = 'ca'<separator>SELECT COUNT(*) FROM contestants 
LEFT JOIN votes ON contestants.contestant_number = votes.contestant_number 
WHERE votes.vote_id IS NULL<separator>SELECT area_code_state.area_code 
FROM area_code_state 
JOIN votes ON area_code_state.state = votes.state 
GROUP BY area_code_state.area_code 
ORDER BY COUNT(votes.vote_id) DESC 
LIMIT 1<separator>SELECT created, state, phone_number
FROM votes
WHERE contestant_number = (SELECT contestant_number FROM contestants WHERE contestant_name = 'tabatha gehling')<separator>SELECT area_code_state.area_code
FROM area_code_state
INNER JOIN votes ON area_code_state.state = votes.state
INNER JOIN contestants ON votes.contestant_number = contestants.contestant_number
WHERE contestants.contestant_name = 'tabatha gehling' 
  AND EXISTS (
    SELECT 1 
    FROM votes 
    INNER JOIN contestants ON votes.contestant_number = contestants.contestant_number
    WHERE contestants.contestant_name = 'kelly clauss' 
      AND votes.state = area_code_state.state
  )
GROUP BY area_code_state.area_code<separator>SELECT contestant_name 
FROM contestants 
WHERE contestant_name LIKE '%al%'<separator>SELECT name FROM country WHERE indepyear > 1950<separator>SELECT name 
FROM country
WHERE indepyear > 1950<separator>SELECT COUNT(*) 
FROM country 
WHERE governmentform = 'Republic';<separator>SELECT COUNT(*) FROM country WHERE governmentform = 'Republic'<separator>SELECT SUM(surfacearea)
FROM country
WHERE region = 'Caribbean'<separator>SELECT SUM(surfacearea) 
FROM country 
WHERE continent = 'Caribbean'<separator>SELECT continent 
FROM country 
WHERE name = 'Anguilla';<separator>SELECT continent 
FROM country 
WHERE code = (SELECT countrycode FROM city WHERE name = 'anguilla')<separator>SELECT region FROM country WHERE code = (SELECT countrycode FROM city WHERE name = "kabul")<separator>SELECT region
FROM city
JOIN country ON city.countrycode = country.code
WHERE city.name = 'kabul'<separator>SELECT language
FROM countrylanguage
WHERE countrycode = 'ABW'
ORDER BY percentage DESC
LIMIT 1;<separator>SELECT language
FROM countrylanguage
WHERE isofficial = 'T' AND countrycode = 'ABW'<separator>SELECT city.population, country.lifeexpectancy
FROM city
JOIN country ON city.countrycode = country.code
WHERE country.name = 'Brazil'<separator>SELECT population, lifeexpectancy
FROM country
WHERE name = 'Brazil';<separator>SELECT region, population FROM country WHERE name = 'Angola';<separator>SELECT region, population FROM country WHERE name = 'Angola';<separator>SELECT AVG(lifeexpectancy) FROM country WHERE region = 'Central Africa'<separator>SELECT AVG(lifeexpectancy) FROM country WHERE continent = 'Africa' AND region = 'Central Africa'<separator>SELECT country.name
FROM country
WHERE country.continent = 'Asia'
ORDER BY country.lifeexpectancy ASC
LIMIT 1;<separator>SELECT country.name 
FROM country 
WHERE continent = 'Asia' 
ORDER BY lifeexpectancy ASC 
LIMIT 1;<separator>SELECT SUM(population) AS total_population, MAX(gnp) AS maximum_gnp 
FROM country 
WHERE continent = 'Asia'<separator>SELECT SUM(city.population) AS total_population, MAX(country.gnp) AS largest_gnp 
FROM country 
INNER JOIN city ON city.countrycode = country.code 
WHERE country.continent = 'Asia'<separator>SELECT AVG(country.lifeexpectancy) 
FROM country 
WHERE country.continent = 'Africa' 
AND country.governmentform = 'Republic'<separator>SELECT AVG(lifeexpectancy) 
FROM country 
WHERE continent = 'Africa' 
AND governmentform = 'Republic'<separator>SELECT SUM(surfacearea) FROM country WHERE continent IN ('Asia','Europe')<separator>SELECT SUM(surfacearea) 
FROM country 
WHERE continent = 'Asia' OR continent = 'Europe'<separator>SELECT SUM(population) 
FROM city 
WHERE district = 'gelderland'<separator>SELECT SUM(city.population) FROM city WHERE city.district = 'gelderland';<separator>SELECT AVG(gnp), SUM(population) 
FROM country 
WHERE governmentform = 'US territory'<separator>SELECT AVG(country.gnp) AS mean_gnp, SUM(country.population) AS total_population 
FROM country 
WHERE country.code IN (SELECT countrycode 
                       FROM countrylanguage 
                       WHERE language = 'English' AND isofficial = 'T' AND percentage = 100) 
AND country.continent = 'North America' AND country.region = 'Caribbean'<separator>SELECT COUNT(DISTINCT language) FROM countrylanguage<separator>SELECT COUNT(DISTINCT language) FROM countrylanguage<separator>SELECT COUNT(DISTINCT governmentform) 
FROM country 
WHERE continent = 'Africa'<separator>SELECT COUNT(DISTINCT governmentform) 
FROM country 
WHERE continent = 'Africa'<separator>SELECT COUNT(DISTINCT language) 
FROM countrylanguage 
WHERE countrycode IN (SELECT code 
                      FROM country 
                      WHERE name = 'Aruba')<separator>SELECT COUNT(DISTINCT language) 
FROM countrylanguage 
WHERE countrycode = 'ABW'<separator>SELECT COUNT(*) FROM countrylanguage WHERE countrycode = 'AFG' AND isofficial = 1;<separator>SELECT COUNT(*) FROM countrylanguage 
WHERE countrycode IN (SELECT code FROM country WHERE name = 'Afghanistan') 
AND isofficial = true<separator>SELECT country.name
FROM country
JOIN (
    SELECT countrycode, COUNT(language) AS num_languages
    FROM countrylanguage
    GROUP BY countrycode
    ORDER BY num_languages DESC
    LIMIT 1
) AS max_languages ON country.code = max_languages.countrycode<separator>SELECT country.name
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
GROUP BY country.code, country.name
ORDER BY COUNT(DISTINCT countrylanguage.language) DESC
LIMIT 1;<separator>SELECT country.continent 
FROM country 
JOIN countrylanguage ON country.code = countrylanguage.countrycode 
GROUP BY country.continent 
ORDER BY COUNT(DISTINCT countrylanguage.language) DESC 
LIMIT 1;<separator>SELECT country.continent, COUNT(distinct countrylanguage.language) as languages_spoken
FROM country
JOIN countrylanguage ON countrylanguage.countrycode = country.code
GROUP BY country.continent
ORDER BY COUNT(distinct countrylanguage.language) DESC
LIMIT 1<separator>SELECT COUNT(DISTINCT countrylanguage.countrycode) AS num_countries 
FROM countrylanguage
WHERE language IN ('English', 'Dutch')
GROUP BY countrylanguage.countrycode
HAVING COUNT(DISTINCT language) = 2;<separator>SELECT COUNT(DISTINCT c.code) 
FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode 
WHERE cl.language IN ('English', 'Dutch') AND cl.isofficial = 'T'<separator>SELECT DISTINCT c.name 
FROM country c 
JOIN countrylanguage cl ON c.code = cl.countrycode 
WHERE (cl.language = 'English' OR cl.language = 'French') 
GROUP BY c.name 
HAVING COUNT(DISTINCT cl.language) = 2<separator>SELECT DISTINCT c.name
FROM country c
INNER JOIN countrylanguage cl ON c.code = cl.countrycode
WHERE cl.language IN ('English', 'French')
GROUP BY c.name
HAVING COUNT(DISTINCT cl.language) = 2<separator>SELECT DISTINCT c.name 
FROM country c 
JOIN countrylanguage cl1 ON c.code = cl1.countrycode 
JOIN countrylanguage cl2 ON c.code = cl2.countrycode 
WHERE cl1.language = 'English' 
AND cl1.isofficial = 'T' 
AND cl2.language = 'French' 
AND cl2.isofficial = 'T'<separator>SELECT country.name 
FROM country 
JOIN countrylanguage ON country.code = countrylanguage.countrycode 
WHERE 
    countrylanguage.language IN ('English', 'French') 
    AND 
    countrylanguage.isofficial = 'T'<separator>SELECT COUNT(DISTINCT country.continent)  
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode  
WHERE countrylanguage.language = 'Chinese'<separator>SELECT COUNT(DISTINCT country.continent) 
FROM country 
JOIN countrylanguage ON country.code = countrylanguage.countrycode 
WHERE countrylanguage.language = 'Chinese'<separator>SELECT country.region
FROM countrylanguage
JOIN country ON countrylanguage.countrycode = country.code
WHERE countrylanguage.language IN ('English', 'Dutch')<separator>SELECT region 
FROM country
WHERE EXISTS (
    SELECT * 
    FROM countrylanguage 
    WHERE (language = 'Dutch' OR language = 'English') 
    AND isofficial = 'T' 
    AND country.code = countrylanguage.countrycode)<separator>SELECT country.name 
FROM country 
JOIN countrylanguage ON country.code = countrylanguage.countrycode 
WHERE (countrylanguage.language = 'English' OR countrylanguage.language = 'Dutch') 
AND countrylanguage.isofficial = 'T'<separator>SELECT country.name
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE (countrylanguage.language = 'English' OR countrylanguage.language = 'Dutch')
AND countrylanguage.isofficial = 1<separator>SELECT language
FROM countrylanguage
WHERE countrycode IN (
    SELECT code
    FROM country
    WHERE continent = 'Asia'
)
ORDER BY percentage DESC
LIMIT 1;<separator>SELECT language
FROM countrylanguage
WHERE countrycode IN (
  SELECT code
  FROM country
  WHERE continent = 'Asia'
)
GROUP BY language
ORDER BY COUNT(*) DESC
LIMIT 1;<separator>SELECT c.language
FROM countrylanguage c
JOIN country co ON c.countrycode = co.code
WHERE co.governmentform = 'Republic'
GROUP BY c.language
HAVING COUNT(DISTINCT co.name) = 1<separator>SELECT language
FROM countrylanguage
WHERE countrycode IN (
    SELECT code
    FROM country
    WHERE governmentform = 'Republic'
)
GROUP BY language
HAVING COUNT(DISTINCT countrycode) = 1<separator>SELECT city.name
FROM city
JOIN countrylanguage ON city.countrycode = countrylanguage.countrycode
JOIN country ON city.countrycode = country.code
WHERE countrylanguage.language = 'English'
ORDER BY city.population DESC
LIMIT 1;<separator>SELECT city.name
FROM city
INNER JOIN countrylanguage ON city.countrycode = countrylanguage.countrycode
WHERE countrylanguage.language = 'English'
ORDER BY city.population DESC
LIMIT 1;<separator>SELECT country.name, country.population, country.lifeexpectancy 
FROM country 
WHERE country.continent = 'Asia' 
ORDER BY country.surfacearea DESC 
LIMIT 1<separator>SELECT country.name, country.population, country.lifeexpectancy 
FROM country 
WHERE country.continent = 'Asia' 
ORDER BY country.surfacearea DESC 
LIMIT 1<separator>SELECT AVG(lifeexpectancy) 
FROM country 
WHERE country.code NOT IN (
    SELECT countrylanguage.countrycode 
    FROM countrylanguage 
    WHERE language = 'English' 
    AND isofficial = 'T'
)<separator>SELECT AVG(lifeexpectancy) 
FROM country 
WHERE code NOT IN (
    SELECT countrycode 
    FROM countrylanguage 
    WHERE language = 'English' 
    AND isofficial = 'T'
)<separator>SELECT SUM(c.population) AS total_population
FROM country AS c
LEFT JOIN countrylanguage AS cl ON c.code = cl.countrycode
WHERE cl.language <> 'English' OR cl.language IS NULL<separator>SELECT SUM(population) 
FROM country 
WHERE code NOT IN (
    SELECT countrycode 
    FROM countrylanguage 
    WHERE language = 'English'
)<separator>SELECT language
FROM countrylanguage
JOIN country ON countrylanguage.countrycode = country.code
WHERE country.headofstate = 'Beatrix'<separator>SELECT language FROM countrylanguage
JOIN country ON countrylanguage.countrycode = country.code
WHERE country.headofstate = 'Beatrix'
AND countrylanguage.isofficial = true<separator>SELECT COUNT(DISTINCT language) AS total_languages
FROM countrylanguage
WHERE isofficial = 1
AND countrycode IN (
    SELECT code
    FROM country
    WHERE indepyear < 1930
)<separator>SELECT COUNT(DISTINCT language) 
FROM countrylanguage
WHERE countrycode IN (SELECT code FROM country WHERE indepyear < 1930) 
AND isofficial = TRUE<separator>SELECT country.name
FROM country
WHERE country.surfacearea > 
    (SELECT MAX(surfacearea) 
     FROM country 
     WHERE country.continent = 'Europe')<separator>SELECT c.name
FROM country c
WHERE c.surfacearea > 
    (SELECT MAX(surfacearea)
     FROM country
     WHERE continent = 'Europe')<separator>SELECT country.name 
FROM country 
WHERE country.continent = 'Africa' 
AND country.population < 
(SELECT MIN(population) 
FROM country 
WHERE continent = 'Asia')<separator>SELECT name FROM country WHERE continent = 'Africa' AND population < (SELECT MIN(population) FROM country WHERE continent = 'Asia')<separator>SELECT name
FROM country
WHERE continent = 'Asia' AND population > (SELECT MAX(population) FROM country WHERE continent = 'Africa')<separator>SELECT name 
FROM country 
WHERE continent = 'Asia' 
AND population > (SELECT MAX(population) 
                  FROM country 
                  WHERE continent = 'Africa')<separator>SELECT code
FROM country
WHERE code NOT IN (
  SELECT countrycode
  FROM countrylanguage
  WHERE language = 'English'
)<separator>SELECT country.code
FROM country
LEFT JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE countrylanguage.language <> 'English' OR countrylanguage.language IS NULL<separator>SELECT DISTINCT(country.code) 
FROM country
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE NOT countrylanguage.language = 'English'<separator>SELECT DISTINCT country.code 
FROM country 
JOIN countrylanguage ON country.code = countrylanguage.countrycode 
WHERE countrylanguage.language <> 'English'<separator>SELECT code
FROM country
WHERE code NOT IN (
    SELECT countrycode
    FROM countrylanguage
    WHERE language = 'English'
)
AND governmentform != 'Republic'<separator>SELECT code
FROM country
WHERE code NOT IN (
    SELECT countrycode
    FROM countrylanguage
    WHERE language = 'English' AND isofficial = 'T'
)
AND governmentform <> 'Republic'<separator>SELECT city.name 
FROM city 
JOIN country ON city.countrycode = country.code 
JOIN countrylanguage ON country.code = countrylanguage.countrycode 
WHERE country.continent = 'Europe' 
AND countrylanguage.language <> 'English' 
AND countrylanguage.isofficial = 0<separator>SELECT city.name
FROM city
JOIN country ON city.countrycode = country.code
JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE country.continent = 'Europe'
AND countrylanguage.language = 'English'
AND countrylanguage.isofficial = 'F'
<separator>SELECT DISTINCT city.name 
FROM city 
JOIN country ON city.countrycode = country.code 
JOIN countrylanguage ON country.code = countrylanguage.countrycode 
WHERE country.continent = 'Asia' 
AND countrylanguage.language = 'Chinese' 
AND countrylanguage.isofficial = 'T'<separator>SELECT DISTINCT city.name
FROM city
JOIN country ON city.countrycode = country.code
JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE country.continent = 'Asia' AND countrylanguage.language = 'Chinese' AND countrylanguage.isofficial = 'T';<separator>SELECT country.name, country.indepyear, country.surfacearea 
FROM country 
WHERE country.population = (
    SELECT MIN(population) 
    FROM country
)<separator>SELECT country.name, country.indepyear, country.surfacearea
FROM country
WHERE country.population = (SELECT MIN(population) FROM country)<separator>SELECT country.population, country.name, country.headofstate
FROM country
WHERE country.surfacearea = (
    SELECT MAX(surfacearea) FROM country
)<separator>SELECT country.name, country.population, country.headofstate
FROM country
WHERE country.surfacearea = (SELECT MAX(surfacearea) FROM country)<separator>SELECT country.name, COUNT(countrylanguage.language) AS num_languages 
FROM country 
JOIN countrylanguage ON country.code = countrylanguage.countrycode 
GROUP BY country.name 
HAVING COUNT(countrylanguage.language) >= 3<separator>SELECT country.name, COUNT(countrylanguage.language) as language_count 
FROM country 
INNER JOIN countrylanguage 
ON country.code = countrylanguage.countrycode 
GROUP BY country.name 
HAVING COUNT(countrylanguage.language) > 2;<separator>SELECT district, COUNT(*) AS city_count
FROM city
WHERE population > (SELECT AVG(population) FROM city)
GROUP BY district;<separator>SELECT district, COUNT(*) AS city_count
FROM city
WHERE population > (SELECT AVG(population) FROM city)
GROUP BY district;<separator>SELECT governmentform, SUM(population) AS total_population
FROM country
WHERE lifeexpectancy > 72
GROUP BY governmentform;<separator>SELECT governmentform, SUM(population) AS total_population
FROM country
WHERE lifeexpectancy > 72
GROUP BY governmentform;<separator>SELECT continent, AVG(lifeexpectancy) AS average_life_expectancy, SUM(population) AS total_population 
FROM country 
WHERE AVG(lifeexpectancy) < 72 
GROUP BY continent<separator>SELECT country.continent, SUM(country.population) AS total_population, AVG(country.lifeexpectancy) AS average_life_expectancy
FROM country
GROUP BY country.continent
HAVING AVG(country.lifeexpectancy) < 72;<separator>SELECT name, surfacearea FROM country ORDER BY surfacearea DESC LIMIT 5<separator>SELECT name, surfacearea 
FROM country 
ORDER BY surfacearea DESC 
LIMIT 5<separator>SELECT name 
FROM country 
ORDER BY population DESC 
LIMIT 3;<separator>SELECT name 
FROM country 
ORDER BY population DESC 
LIMIT 3<separator>SELECT name
FROM country
ORDER BY population
LIMIT 3;<separator>SELECT name 
FROM country 
ORDER BY population ASC 
LIMIT 3<separator>SELECT COUNT(*) FROM country WHERE continent = 'Asia'<separator>SELECT COUNT(*) FROM country WHERE continent = 'Asia';<separator>SELECT name 
FROM country 
WHERE continent = "Europe" AND population = 80000<separator>SELECT name 
FROM country 
WHERE continent = 'Europe' 
AND population = 80000<separator>SELECT SUM(population), AVG(surfacearea)
FROM country
WHERE continent = 'North America' AND surfacearea > 3000;<separator>SELECT SUM(country.population) AS total_population, AVG(country.surfacearea) AS average_surface_area
FROM country
WHERE country.continent = 'North America' AND country.surfacearea > 3000;<separator>SELECT name 
FROM city 
WHERE population BETWEEN 160000 AND 900000;<separator>SELECT name FROM city WHERE population >= 160000 AND population <= 900000;<separator>SELECT countrylanguage.language 
FROM countrylanguage 
WHERE countrylanguage.isofficial = 'T' 
GROUP BY countrylanguage.language 
ORDER BY COUNT(countrylanguage.countrycode) DESC 
LIMIT 1<separator>SELECT language
FROM countrylanguage
GROUP BY language
HAVING COUNT(DISTINCT countrycode) = (
    SELECT MAX(countries)
    FROM (
        SELECT COUNT(DISTINCT countrycode) AS countries
        FROM countrylanguage
        GROUP BY language
    )
)<separator>SELECT country.name, countrylanguage.language
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE countrylanguage.percentage = (
  SELECT MAX(percentage)
  FROM countrylanguage
  WHERE countrylanguage.countrycode = country.code
)
GROUP BY country.name;<separator>SELECT country.code, countrylanguage.language
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
GROUP BY country.code
HAVING MAX(countrylanguage.percentage)<separator>SELECT COUNT(DISTINCT country.code) AS total_countries 
FROM countrylanguage 
JOIN country ON country.code = countrylanguage.countrycode 
WHERE countrylanguage.language = 'Spanish' 
AND countrylanguage.isofficial = true 
AND countrylanguage.percentage = (
    SELECT MAX(percentage) 
    FROM countrylanguage 
    WHERE language = 'Spanish'
)<separator>SELECT COUNT(*) 
FROM countrylanguage
WHERE language = 'Spanish' 
AND percentage > 50<separator>SELECT DISTINCT country.code
FROM country
JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE countrylanguage.language = 'Spanish'
ORDER BY countrylanguage.percentage DESC
LIMIT 1;<separator>SELECT code
FROM country
WHERE code IN (SELECT countrycode FROM countrylanguage WHERE language = 'Spanish' AND percentage > 50)<separator>SELECT COUNT(*) FROM conductor<separator>SELECT COUNT(conductor_id) FROM conductor<separator>SELECT name
FROM conductor
ORDER BY age ASC;<separator>SELECT name FROM conductor ORDER BY age;<separator>SELECT name
FROM conductor
WHERE nationality <> 'usa'<separator>SELECT name FROM conductor WHERE nationality != 'usa'<separator>SELECT record_company FROM orchestra ORDER BY year_of_founded DESC<separator>SELECT orchestra.record_company
FROM orchestra
ORDER BY orchestra.year_of_founded DESC<separator>SELECT AVG(attendance) 
FROM show<separator>SELECT AVG(attendance)
FROM show<separator>SELECT MAX(share) AS max_share, MIN(share) AS min_share 
FROM performance 
WHERE type != 'live final'<separator>SELECT MAX(share), MIN(share)
FROM performance
WHERE type <> 'live final'<separator>SELECT COUNT(DISTINCT conductor.nationality)
FROM conductor<separator>SELECT COUNT(DISTINCT nationality) 
FROM conductor<separator>SELECT name FROM conductor ORDER BY year_of_work DESC<separator>SELECT conductor.name 
FROM conductor 
ORDER BY conductor.year_of_work DESC<separator>SELECT name FROM conductor ORDER BY year_of_work DESC LIMIT 1;<separator>SELECT conductor.name
FROM conductor
ORDER BY conductor.year_of_work DESC
LIMIT 1<separator>SELECT conductor.name, orchestra.orchestra
FROM conductor
JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id<separator>SELECT conductor.name, orchestra.orchestra
FROM conductor
JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id<separator>SELECT conductor.name 
FROM conductor
INNER JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id
GROUP BY conductor.conductor_id
HAVING COUNT(DISTINCT orchestra.orchestra_id) > 1<separator>SELECT conductor.name
FROM conductor
GROUP BY conductor.name
HAVING COUNT(DISTINCT orchestra_id) > 1<separator>SELECT conductor.name
FROM conductor
JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id
GROUP BY conductor.name
ORDER BY COUNT(orchestra.orchestra_id) DESC
LIMIT 1;<separator>SELECT conductor.name
FROM conductor
JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id
GROUP BY conductor.conductor_id, conductor.name
ORDER BY COUNT(orchestra.orchestra_id) DESC
LIMIT 1;<separator>SELECT conductor.name 
FROM conductor 
INNER JOIN orchestra ON conductor.conductor_id = orchestra.conductor_id 
WHERE orchestra.year_of_founded > 2008<separator>SELECT conductor.name
FROM conductor 
JOIN orchestra ON orchestra.conductor_id = conductor.conductor_id
WHERE orchestra.year_of_founded > 2008<separator>SELECT record_company, COUNT(orchestra_id) as number_of_orchestras
FROM orchestra
GROUP BY record_company<separator>SELECT record_company, COUNT(orchestra_id) AS num_orchestras
FROM orchestra
GROUP BY record_company<separator>SELECT major_record_format, COUNT(*) AS count
FROM orchestra
GROUP BY major_record_format
ORDER BY count ASC;<separator>SELECT major_record_format, COUNT(*) as frequency
FROM orchestra
GROUP BY major_record_format
ORDER BY frequency DESC<separator>SELECT orchestra.record_company 
FROM orchestra 
GROUP BY orchestra.record_company 
ORDER BY COUNT(orchestra.orchestra_id) DESC 
LIMIT 1;<separator>SELECT record_company, COUNT(orchestra_id) AS num_orchestras
FROM orchestra
GROUP BY record_company
ORDER BY num_orchestras DESC
LIMIT 1;<separator>SELECT orchestra.orchestra
FROM orchestra
LEFT JOIN performance ON orchestra.orchestra_id = performance.orchestra_id
WHERE performance.performance_id IS NULL<separator>SELECT orchestra.orchestra_id, orchestra.orchestra
FROM orchestra
LEFT JOIN performance ON performance.orchestra_id = orchestra.orchestra_id
WHERE performance.performance_id IS NULL<separator>SELECT record_company
FROM orchestra
WHERE year_of_founded < 2003 OR year_of_founded > 2003<separator>SELECT DISTINCT o1.record_company
FROM orchestra o1, orchestra o2
WHERE o1.year_of_founded < 2003
AND o2.year_of_founded > 2003
AND o1.record_company = o2.record_company<separator>SELECT COUNT(*) 
FROM orchestra 
WHERE major_record_format = "cd" OR major_record_format = "dvd"<separator>SELECT COUNT(*) 
FROM orchestra 
WHERE major_record_format IN ('cd', 'dvd')<separator>SELECT DISTINCT orchestra.year_of_founded
FROM orchestra
INNER JOIN performance ON orchestra.orchestra_id = performance.orchestra_id
GROUP BY orchestra.orchestra_id
HAVING COUNT(performance.performance_id) > 1<separator>SELECT orchestra.year_of_founded
FROM orchestra
JOIN performance ON orchestra.orchestra_id = performance.orchestra_id
GROUP BY orchestra.orchestra_id
HAVING COUNT(performance.performance_id) > 1;<separator>SELECT COUNT(*) FROM highschooler<separator>SELECT COUNT(*) FROM highschooler<separator>SELECT name, grade
FROM highschooler<separator>SELECT name, grade FROM highschooler<separator>SELECT grade FROM highschooler<separator>SELECT grade 
FROM highschooler<separator>SELECT grade 
FROM highschooler 
WHERE name = 'kyle'<separator>SELECT grade
FROM highschooler
WHERE name = 'kyle';<separator>SELECT highschooler.name 
FROM highschooler 
WHERE highschooler.grade = 10<separator>SELECT name
FROM highschooler
WHERE grade = 10;<separator>SELECT id
FROM highschooler
WHERE name = 'kyle'<separator>SELECT id
FROM highschooler
WHERE name = 'kyle'<separator>SELECT COUNT(*) FROM highschooler WHERE grade IN (9, 10)<separator>SELECT COUNT(*) FROM highschooler WHERE grade IN (9, 10);<separator>SELECT grade, COUNT(*) AS count 
FROM highschooler 
GROUP BY grade<separator>SELECT grade, COUNT(*) 
FROM highschooler 
GROUP BY grade<separator>SELECT grade 
FROM highschooler 
GROUP BY grade 
ORDER BY COUNT(*) DESC 
LIMIT 1;<separator>SELECT grade
FROM highschooler
GROUP BY grade
HAVING COUNT(*) = (
  SELECT MAX(highschooler_count)
  FROM (
    SELECT COUNT(*) AS highschooler_count
    FROM highschooler
    GROUP BY grade
  ) AS grades_count
)<separator>SELECT grade
FROM highschooler
GROUP BY grade
HAVING COUNT(*) >= 4;<separator>SELECT grade
FROM highschooler
GROUP BY grade
HAVING COUNT(id) >= 4<separator>SELECT highschooler.id, COUNT(friend.friend_id) AS number_of_friends
FROM friend
JOIN highschooler ON friend.friend_id = highschooler.id
GROUP BY highschooler.id;<separator>SELECT highschooler.name, COUNT(friend.friend_id) AS friend_count
FROM highschooler
LEFT JOIN friend ON highschooler.id = friend.student_id
GROUP BY highschooler.name<separator>SELECT highschooler.name, COUNT(friend.friend_id) AS number_of_friends
FROM highschooler
LEFT JOIN friend ON highschooler.id = friend.student_id
GROUP BY highschooler.name<separator>SELECT highschooler.name, COUNT(friend.friend_id) AS num_friends
FROM highschooler
LEFT JOIN friend ON friend.student_id = highschooler.id
GROUP BY highschooler.name;<separator>SELECT highschooler.name
FROM highschooler
JOIN friend ON friend.student_id = highschooler.id
GROUP BY highschooler.name
ORDER BY COUNT(friend.friend_id) DESC
LIMIT 1<separator>SELECT highschooler.name
FROM highschooler
JOIN friend ON friend.student_id = highschooler.id
GROUP BY highschooler.name
ORDER BY COUNT(friend.friend_id) DESC
LIMIT 1;<separator>SELECT highschooler.name
FROM highschooler
JOIN friend ON friend.student_id = highschooler.id
GROUP BY highschooler.id, highschooler.name
HAVING COUNT(friend.friend_id) >= 3;<separator>SELECT highschooler.name
FROM highschooler
JOIN friend ON friend.student_id = highschooler.id
GROUP BY highschooler.name
HAVING COUNT(friend.friend_id) >= 3<separator>SELECT highschooler.name 
FROM highschooler 
JOIN friend ON friend.friend_id = highschooler.id
WHERE highschooler.name = 'Kyle'<separator>SELECT highschooler.name
FROM highschooler
JOIN friend ON friend.friend_id = highschooler.id
WHERE highschooler.name = 'Kyle'<separator>SELECT COUNT(*) 
FROM friend 
WHERE student_id = (
    SELECT id 
    FROM highschooler 
    WHERE name = 'kyle'
)<separator>SELECT COUNT(*) 
FROM friend 
WHERE friend.student_id = 'kyle's id'<separator>SELECT h.id
FROM highschooler h
WHERE h.id NOT IN (SELECT f.student_id FROM friend f)
ORDER BY h.id<separator>SELECT id
FROM highschooler
WHERE id NOT IN (SELECT student_id
                 FROM friend)<separator>SELECT highschooler.name
FROM highschooler
WHERE highschooler.id NOT IN (SELECT friend.student_id FROM friend)<separator>SELECT highschooler.name
FROM highschooler
LEFT JOIN friend ON friend.student_id = highschooler.id
WHERE friend.friend_id IS NULL<separator>SELECT highschooler.id
FROM highschooler
INNER JOIN friend ON friend.friend_id = highschooler.id
INNER JOIN likes ON likes.liked_id = highschooler.id
WHERE friend.student_id = highschooler.id<separator>SELECT DISTINCT highschooler.id
FROM highschooler
JOIN friend ON friend.friend_id = highschooler.id
JOIN likes ON likes.student_id = highschooler.id
WHERE friend.student_id = highschooler.id
AND likes.liked_id = highschooler.id<separator>SELECT highschooler.name
FROM highschooler
JOIN friend ON friend.student_id = highschooler.id
JOIN likes ON likes.student_id = highschooler.id
WHERE friend.friend_id IS NOT NULL
AND likes.liked_id <> highschooler.id<separator>SELECT highschooler.name
FROM highschooler
WHERE highschooler.id IN (
  SELECT friend.student_id
  FROM friend
  JOIN likes ON friend.student_id = likes.student_id
  WHERE friend.friend_id = highschooler.id AND likes.liked_id = highschooler.id
)<separator>SELECT student_id, count(*) AS num_likes
FROM likes
GROUP BY student_id<separator>SELECT student_id, COUNT(*) AS likes_count
FROM likes
GROUP BY student_id<separator>SELECT h.name, COUNT(l.liked_id) AS num_likes 
FROM highschooler h 
JOIN likes l ON h.id = l.student_id 
GROUP BY h.name<separator>SELECT highschooler.name, COUNT(likes.student_id) AS num_likes
FROM highschooler
JOIN likes ON highschooler.id = likes.student_id
GROUP BY highschooler.name<separator>SELECT highschooler.name
FROM highschooler
WHERE highschooler.id IN (
    SELECT likes.student_id
    FROM likes
    GROUP BY likes.student_id
    HAVING COUNT(*) = (
        SELECT MAX(like_count)
        FROM (
            SELECT likes.student_id, COUNT(*) AS like_count
            FROM likes
            GROUP BY likes.student_id
        ) AS like_counts
    )
)<separator>SELECT h.name
FROM highschooler h
JOIN likes l ON h.id = l.student_id
GROUP BY h.id
ORDER BY COUNT(l.liked_id) DESC
LIMIT 1;<separator>SELECT highschooler.name 
FROM highschooler 
JOIN likes ON highschooler.id = likes.student_id 
GROUP BY highschooler.name 
HAVING COUNT(likes.liked_id) >= 2;<separator>SELECT highschooler.name
FROM highschooler
INNER JOIN likes ON highschooler.id = likes.student_id
GROUP BY highschooler.id, highschooler.name
HAVING COUNT(likes.liked_id) >= 2<separator>SELECT highschooler.name
FROM highschooler
WHERE highschooler.grade > 5
AND (
  SELECT COUNT(*)
  FROM friend
  WHERE friend.student_id = highschooler.id
) >= 2<separator>SELECT highschooler.name 
FROM highschooler 
WHERE highschooler.grade > 5 
AND (SELECT COUNT(*) 
    FROM friend 
    WHERE friend.student_id = highschooler.id) >= 2<separator>SELECT COUNT(*) FROM likes WHERE student_id = (SELECT id FROM highschooler WHERE name = 'Kyle')<separator>SELECT COUNT(*) 
FROM likes, highschooler
WHERE highschooler.name = 'kyle' 
AND likes.student_id = highschooler.id;<separator>SELECT AVG(grade) 
FROM highschooler 
WHERE id IN (
  SELECT student_id 
  FROM friend
)<separator>SELECT AVG(highschooler.grade) 
FROM highschooler 
WHERE highschooler.id IN (SELECT friend.student_id 
                          FROM friend)<separator>SELECT MIN(grade)
FROM highschooler
WHERE id NOT IN (
  SELECT student_id
  FROM friend
)<separator>SELECT MIN(grade) FROM highschooler WHERE id NOT IN (SELECT student_id FROM friend)<separator>SELECT DISTINCT owners.state
FROM owners
JOIN professionals ON owners.state = professionals.state;<separator>SELECT owners.state
FROM owners
INNER JOIN professionals ON owners.state = professionals.state<separator>SELECT AVG(age) 
FROM dogs 
WHERE dog_id IN 
    (SELECT dog_id 
     FROM treatments)<separator>SELECT AVG(age) FROM dogs JOIN treatments ON dogs.dog_id = treatments.dog_id<separator>SELECT professional_id, last_name, cell_number
FROM professionals
WHERE state = 'Indiana' OR professional_id IN (
    SELECT professional_id
    FROM treatments
    GROUP BY professional_id
    HAVING COUNT(treatment_id) > 2
)<separator>SELECT professional_id, last_name, cell_number 
FROM professionals 
WHERE state = 'Indiana' OR professional_id IN (SELECT professional_id 
                                               FROM treatments 
                                               GROUP BY professional_id 
                                               HAVING COUNT(*) > 2)<separator>SELECT dogs.name
FROM dogs
JOIN treatments ON dogs.dog_id = treatments.dog_id
JOIN charges ON treatments.charge_id = charges.charge_id
WHERE charges.charge_amount <= 1000<separator>SELECT dogs.name
FROM dogs
JOIN owners ON dogs.owner_id = owners.owner_id
JOIN treatments ON treatments.dog_id = dogs.dog_id
WHERE treatments.cost_of_treatment <= 1000<separator>SELECT owners.first_name
FROM owners
WHERE owners.first_name NOT IN (
    SELECT dogs.name
    FROM dogs
    UNION
    SELECT professionals.first_name
    FROM professionals
)