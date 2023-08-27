SELECT semester_name, semester_id FROM semesters WHERE semester_id IN (     SELECT semester_id     FROM student_enrolment     GROUP BY semester_id     HAVING COUNT(student_id) = (         SELECT MAX(num_students)         FROM (             SELECT semester_id, COUNT(student_id) AS num_students             FROM student_enrolment             GROUP BY semester_id         ) AS counts     ) )
SELECT AVG(age)  FROM student  WHERE student.stuid NOT IN (SELECT has_pet.stuid FROM has_pet)
SELECT DISTINCT car_names.model FROM car_names JOIN car_makers ON car_names.makeid = car_makers.id JOIN model_list ON car_makers.id = model_list.maker JOIN cars_data ON car_names.makeid = cars_data.id WHERE (car_makers.fullname = 'general motors' OR cars_data.weight > 3500)
SELECT name  FROM country  WHERE code = (SELECT countrycode                FROM countrylanguage                GROUP BY countrycode                ORDER BY COUNT(language) DESC                LIMIT 1)
SELECT car_names.model FROM cars_data JOIN car_names ON cars_data.id = car_names.makeid WHERE cars_data.weight < (SELECT AVG(weight) FROM cars_data)
SELECT last_name FROM students  JOIN addresses ON students.current_address_id = addresses.address_id  WHERE state_province_county = 'north carolina'  AND student_id NOT IN (SELECT student_id FROM student_enrolment)
SELECT countries.countryname  FROM countries  JOIN continents ON countries.continent = continents.contid  JOIN car_makers ON countries.countryid = car_makers.country  WHERE continents.continent = 'Europe'  GROUP BY countries.countryname  HAVING COUNT(car_makers.id) >= 3
SELECT airports.city FROM airports JOIN flights ON flights.sourceairport = airports.airportcode GROUP BY airports.city ORDER BY COUNT(*) DESC LIMIT 1;
SELECT COUNT(*)  FROM visitor  WHERE id NOT IN      (SELECT visitor_id      FROM visit JOIN museum      ON visit.museum_id = museum.museum_id      WHERE museum.open_year > 2010)
SELECT visitor.id, visitor.name, visitor.level_of_membership FROM visitor JOIN visit ON visit.visitor_id = visitor.id GROUP BY visitor.id, visitor.name, visitor.level_of_membership HAVING SUM(visit.total_spent) = (     SELECT MAX(total_spent)     FROM visit )
SELECT museum_id, name FROM museum WHERE museum_id IN (     SELECT museum_id     FROM visit     GROUP BY museum_id     HAVING COUNT(*) = (         SELECT MAX(count)         FROM (             SELECT museum_id, COUNT(*) as count             FROM visit             GROUP BY museum_id         ) AS subquery     ) )
SELECT professionals.first_name, professionals.last_name FROM professionals INNER JOIN treatments ON professionals.professional_id = treatments.professional_id WHERE treatments.cost_of_treatment < (SELECT AVG(cost_of_treatment) FROM treatments)
SELECT student.fname  FROM student  JOIN has_pet ON student.stuid = has_pet.stuid  JOIN pets ON has_pet.petid = pets.petid  WHERE pets.pettype = 'cat'  AND student.stuid IN (   SELECT has_pet.stuid    FROM has_pet    JOIN pets ON has_pet.petid = pets.petid    WHERE pets.pettype = 'dog' )
SELECT abbreviation, country FROM airlines WHERE uid = (     SELECT airline     FROM flights     GROUP BY airline     HAVING COUNT(*) = (         SELECT MIN(count)         FROM (             SELECT COUNT(*) AS count             FROM flights             GROUP BY airline             ) AS subquery         )     );
SELECT stadium.name, stadium.location FROM stadium JOIN concert ON stadium.stadium_id = concert.stadium_id WHERE concert.year IN (2014, 2015)
SELECT district, COUNT(city) AS num_cities FROM city GROUP BY district HAVING population > (SELECT AVG(population) FROM city)
SELECT country.name FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE (countrylanguage.language = 'English' OR countrylanguage.language = 'Dutch') AND countrylanguage.isofficial = 1
SELECT DISTINCT c1.name  FROM country c1  JOIN countrylanguage cl1 ON c1.code = cl1.countrycode  JOIN countrylanguage cl2 ON c1.code = cl2.countrycode  WHERE cl1.language = 'English'  AND cl2.language = 'French'
SELECT COUNT(*) FROM battle WHERE id NOT IN (SELECT lost_in_battle FROM ship WHERE tonnage = '225')
SELECT airports.city FROM airports JOIN flights ON airports.airportcode = flights.destairport GROUP BY airports.city ORDER BY COUNT(*) DESC LIMIT 1;
SELECT owners.owner_id, owners.first_name, owners.last_name FROM owners JOIN dogs ON owners.owner_id = dogs.owner_id GROUP BY owners.owner_id, owners.first_name, owners.last_name ORDER BY COUNT(dogs.dog_id) DESC LIMIT 1
SELECT breed_name FROM breeds GROUP BY breed_name HAVING COUNT(dog_id) = (     SELECT MAX(dog_count)     FROM (         SELECT COUNT(dog_id) AS dog_count         FROM dogs         GROUP BY breed_code     ) AS count_table )
SELECT AVG(age)  FROM student  WHERE stuid NOT IN (     SELECT stuid      FROM has_pet )
SELECT area_code FROM area_code_state INNER JOIN votes ON area_code_state.state = votes.state GROUP BY area_code HAVING COUNT(*) = (     SELECT MAX(vote_count)     FROM (         SELECT COUNT(*) as vote_count         FROM area_code_state         INNER JOIN votes ON area_code_state.state = votes.state         GROUP BY area_code     ) AS counts )
SELECT tv_channel.series_name, tv_channel.country FROM tv_channel JOIN cartoon ON cartoon.channel = tv_channel.id WHERE cartoon.directed_by IN ('ben jones', 'michael chang')