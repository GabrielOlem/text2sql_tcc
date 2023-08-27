SELECT name FROM employee WHERE employee_id NOT IN (SELECT employee_id FROM evaluation)
SELECT DISTINCT tv_channel.country FROM tv_channel LEFT JOIN cartoon ON cartoon.channel = tv_channel.id WHERE cartoon.written_by <> 'todd casey' OR cartoon.written_by IS NULL
SELECT DISTINCT s.district FROM shop s WHERE EXISTS (SELECT 1               FROM shop s1               WHERE s1.district = s.district                     AND s1.number_products < 3000)       AND EXISTS (SELECT 1                   FROM shop s2                   WHERE s2.district = s.district                         AND s2.number_products > 10000);
SELECT documents.document_id FROM documents JOIN (     SELECT document_id, COUNT(*) AS num_paragraphs     FROM paragraphs     GROUP BY document_id ) AS paragraph_counts ON documents.document_id = paragraph_counts.document_id ORDER BY paragraph_counts.num_paragraphs LIMIT 1;
SELECT d.document_id FROM documents d JOIN paragraphs p ON d.document_id = p.document_id WHERE p.paragraph_text IN ('brazil', 'ireland')
SELECT countryname FROM countries WHERE countryid NOT IN (SELECT country                           FROM car_makers)
SELECT DISTINCT model FROM car_names JOIN cars_data ON car_names.makeid = cars_data.id WHERE cars_data.year > 1980
SELECT DISTINCT city.name  FROM city  JOIN country ON city.countrycode = country.code  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE country.continent = 'Asia'  AND countrylanguage.language = 'Chinese'  AND countrylanguage.isofficial = 'T'
SELECT AVG(d.age)  FROM dogs AS d  JOIN treatments AS t ON d.dog_id = t.dog_id
SELECT tv_channel.package_option  FROM tv_channel  WHERE tv_channel.id NOT IN  (SELECT cartoon.channel  FROM cartoon  WHERE cartoon.directed_by = 'ben jones')
SELECT COUNT(*)  FROM flights  WHERE sourceairport = (SELECT airportcode FROM airports WHERE airportname = 'aberdeen')  AND destairport = (SELECT airportcode FROM airports WHERE airportname = 'ashley')
SELECT orchestra.orchestra FROM orchestra LEFT JOIN performance ON orchestra.orchestra_id = performance.orchestra_id WHERE performance.performance_id IS NULL
SELECT COUNT(*) FROM flights  JOIN airports ON flights.destairport = airports.airportcode  WHERE airports.city = 'aberdeen' OR airports.city = 'abilene'
SELECT COUNT(*)  FROM has_pet  JOIN pets ON has_pet.petid = pets.petid  JOIN student ON has_pet.stuid = student.stuid  WHERE pets.pettype = 'dog' AND student.sex = 'f'
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)
SELECT COUNT(*) FROM cars_data WHERE accelerate > (SELECT MAX(horsepower) FROM cars_data)
SELECT players.first_name, players.last_name FROM matches JOIN players ON matches.winner_id = players.player_id WHERE matches.tourney_name = 'Australian Open' ORDER BY players.winner_rank_points DESC LIMIT 1
SELECT e.name FROM employee e JOIN evaluation ev ON e.employee_id = ev.employee_id WHERE ev.bonus = (SELECT MAX(bonus) FROM evaluation)
SELECT COUNT(pets.petid)  FROM has_pet  JOIN pets ON has_pet.petid = pets.petid  JOIN student ON has_pet.stuid = student.stuid  WHERE pets.pettype = 'dog' AND student.sex = 'female'
SELECT teacher.hometown, COUNT(*) as count FROM teacher GROUP BY teacher.hometown ORDER BY count DESC LIMIT 1;
SELECT highschooler.id FROM highschooler LEFT JOIN friend ON friend.student_id = highschooler.id GROUP BY highschooler.id HAVING COUNT(friend.friend_id) = 0
SELECT highschooler.name  FROM highschooler  WHERE highschooler.id IN      (SELECT friend.student_id       FROM friend       WHERE friend.friend_id = highschooler.id)  AND highschooler.id IN      (SELECT likes.student_id       FROM likes       WHERE likes.liked_id <> likes.student_id)
SELECT DISTINCT highschooler.id  FROM highschooler  JOIN friend ON friend.student_id = highschooler.id  JOIN likes ON likes.student_id = highschooler.id  WHERE friend.friend_id IS NOT NULL  AND likes.liked_id IS NOT NULL
SELECT nationality FROM people GROUP BY nationality ORDER BY COUNT(*) DESC LIMIT 1;
SELECT shop.name FROM shop WHERE shop.number_products > (SELECT AVG(number_products) FROM shop)