SELECT transcript_date, other_details  FROM transcripts  WHERE transcript_id = (SELECT transcript_id                         FROM transcript_contents                         LIMIT 1) 
SELECT teacher.name, course.course FROM teacher INNER JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id INNER JOIN course ON course_arrange.course_id = course.course_id
SELECT COUNT(*)  FROM flights  WHERE sourceairport = (SELECT airportcode FROM airports WHERE airportname = 'aberdeen')
SELECT COUNT(*)  FROM flights  JOIN airports ON flights.destairport = airports.airportcode  WHERE airports.airportname = 'aberdeen'
SELECT tv_channel.package_option, tv_channel.series_name FROM tv_channel WHERE tv_channel.hight_definition_tv = 'yes'
SELECT country.name, countrylanguage.language  FROM country  JOIN countrylanguage ON country.code = countrylanguage.countrycode  WHERE countrylanguage.percentage = (     SELECT MAX(percentage)      FROM countrylanguage      WHERE countrylanguage.countrycode = country.code     )
SELECT treatments.date_of_treatment, professionals.first_name  FROM treatments  JOIN professionals ON treatments.professional_id = professionals.professional_id
SELECT templates.template_id FROM templates WHERE templates.template_type_code IN ('pp', 'ppt')
SELECT COUNT(DISTINCT c.continent)  FROM country c JOIN countrylanguage cl ON c.code = cl.countrycode WHERE cl.language = 'Chinese'
SELECT AVG(age), MIN(age), MAX(age) FROM singer WHERE country = 'France'
SELECT highschooler.name  FROM highschooler  JOIN likes ON highschooler.id = likes.student_id  GROUP BY highschooler.id  HAVING COUNT(likes.liked_id) >= 2
SELECT COUNT(*) FROM highschooler WHERE grade = 9 OR grade = 10;
SELECT final_table_made, best_finish  FROM poker_player
SELECT cartoon.production_code, cartoon.channel FROM cartoon INNER JOIN tv_channel ON cartoon.channel = tv_channel.id ORDER BY cartoon.original_air_date DESC LIMIT 1;
SELECT AVG(num_of_ticket), MAX(num_of_ticket) FROM visit;
SELECT teacher.name FROM teacher JOIN course_arrange ON teacher.teacher_id = course_arrange.teacher_id GROUP BY teacher.name HAVING COUNT(course_arrange.course_id) >= 2
SELECT singer.name, singer.country  FROM singer  WHERE singer.song_name LIKE '%hey%'
SELECT players.first_name, players.country_code FROM players WHERE players.birth_date = (SELECT MIN(players.birth_date) FROM players)
SELECT COUNT(documents.document_id) FROM documents JOIN templates ON documents.template_id = templates.template_id WHERE templates.template_type_code = 'ppt'
SELECT MIN(shop.number_products), MAX(shop.number_products) FROM shop;
SELECT hand, COUNT(*) AS count_players  FROM players  GROUP BY hand
SELECT tv_channel.country FROM cartoon JOIN tv_channel ON cartoon.channel = tv_channel.id WHERE cartoon.written_by = 'todd casey'
SELECT battle.id, battle.name FROM battle JOIN ship ON ship.lost_in_battle = battle.id WHERE ship.ship_type = 'brig'
SELECT line_1, line_2 FROM addresses
SELECT COUNT(*)  FROM orchestra  WHERE major_record_format = 'cd' OR major_record_format = 'dvd'