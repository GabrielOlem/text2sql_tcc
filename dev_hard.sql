SELECT name FROM employee WHERE Employee_ID NOT IN (SELECT Employee_ID FROM evaluation)	employee_hire_evaluation
SELECT country FROM TV_Channel EXCEPT SELECT T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.written_by  =  'Todd Casey'	tvshow
SELECT district FROM shop WHERE Number_products  <  3000 INTERSECT SELECT district FROM shop WHERE Number_products  >  10000	employee_hire_evaluation
SELECT document_id FROM Paragraphs GROUP BY document_id ORDER BY count(*) ASC LIMIT 1	cre_Doc_Template_Mgt
SELECT document_id FROM Paragraphs WHERE paragraph_text  =  'Brazil' INTERSECT SELECT document_id FROM Paragraphs WHERE paragraph_text  =  'Ireland'	cre_Doc_Template_Mgt
SELECT CountryName FROM countries EXCEPT SELECT T1.CountryName FROM countries AS T1 JOIN CAR_MAKERS AS T2 ON T1.countryId  =  T2.Country;	car_1
SELECT DISTINCT T1.model FROM MODEL_LIST AS T1 JOIN CAR_NAMES AS T2 ON T1.model  =  T2.model JOIN CARS_DATA AS T3 ON T2.MakeId  =  T3.id WHERE T3.year  >  1980;	car_1
select distinct t3.name from country as t1 join countrylanguage as t2 on t1.code  =  t2.countrycode join city as t3 on t1.code  =  t3.countrycode where t2.isofficial  =  't' and t2.language  =  'chinese' and t1.continent  =  "asia"	world_1
SELECT avg(age) FROM Dogs WHERE dog_id IN ( SELECT dog_id FROM Treatments )	dog_kennels
SELECT package_option FROM TV_Channel WHERE id NOT IN (SELECT channel FROM cartoon WHERE directed_by  =  'Ben Jones')	tvshow
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport  =  T2.AirportCode JOIN AIRPORTS AS T3 ON T1.SourceAirport  =  T3.AirportCode WHERE T2.City  =  "Ashley" AND T3.City  =  "Aberdeen"	flight_2
SELECT Orchestra FROM orchestra WHERE Orchestra_ID NOT IN (SELECT Orchestra_ID FROM performance)	orchestra
SELECT count(*) FROM Flights AS T1 JOIN Airports AS T2 ON T1.DestAirport  =  T2.AirportCode WHERE T2.city  =  "Aberdeen" OR T2.city  =  "Abilene"	flight_2
SELECT count(*) FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T1.sex  =  'F' AND T3.pettype  =  'dog'	pets_1
SELECT name FROM stadium WHERE stadium_id NOT IN (SELECT stadium_id FROM concert)	concert_singer
SELECT COUNT(*) FROM CARS_DATA WHERE Accelerate  >  ( SELECT Accelerate FROM CARS_DATA ORDER BY Horsepower DESC LIMIT 1 );	car_1
SELECT winner_name FROM matches WHERE tourney_name  =  'Australian Open' ORDER BY winner_rank_points DESC LIMIT 1	wta_1
SELECT t1.name FROM employee AS t1 JOIN evaluation AS t2 ON t1.Employee_ID  =  t2.Employee_ID ORDER BY t2.bonus DESC LIMIT 1	employee_hire_evaluation
SELECT count(*) FROM student AS T1 JOIN has_pet AS T2 ON T1.stuid  =  T2.stuid JOIN pets AS T3 ON T2.petid  =  T3.petid WHERE T1.sex  =  'F' AND T3.pettype  =  'dog'	pets_1
SELECT Hometown FROM teacher GROUP BY Hometown ORDER BY COUNT(*) DESC LIMIT 1	course_teach
SELECT id FROM Highschooler EXCEPT SELECT student_id FROM Friend	network_1
SELECT T2.name FROM Friend AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id INTERSECT SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.liked_id  =  T2.id	network_1
SELECT student_id FROM Friend INTERSECT SELECT liked_id FROM Likes	network_1
SELECT Nationality FROM people GROUP BY Nationality ORDER BY COUNT(*) DESC LIMIT 1	poker_player
SELECT name FROM shop WHERE number_products  >  (SELECT avg(number_products) FROM shop)	employee_hire_evaluation