SELECT avg(Earnings) FROM poker_player	poker_player
SELECT sum(Population) FROM city WHERE District  =  "Gelderland"	world_1
SELECT count(DISTINCT GovernmentForm) FROM country WHERE Continent  =  "Africa"	world_1
SELECT count(*) FROM FLIGHTS WHERE DestAirport  =  "ATO"	flight_2
SELECT Abbreviation FROM AIRLINES WHERE Airline  =  "JetBlue Airways"	flight_2
SELECT grade FROM Highschooler	network_1
SELECT T1.Name FROM people AS T1 JOIN poker_player AS T2 ON T1.People_ID  =  T2.People_ID	poker_player
SELECT count(DISTINCT current_address_id) FROM Students	student_transcripts_tracking
SELECT template_type_code FROM Templates GROUP BY template_type_code HAVING count(*)  <  3	cre_Doc_Template_Mgt
SELECT Continent FROM country WHERE Name  =  "Anguilla"	world_1
SELECT Nationality FROM people GROUP BY Nationality HAVING COUNT(*)  >=  2	poker_player
SELECT Name FROM people WHERE Nationality != "Russia"	poker_player
SELECT course_description FROM Courses WHERE course_name  =  'math'	student_transcripts_tracking
SELECT section_name FROM Sections ORDER BY section_name DESC	student_transcripts_tracking
SELECT count(*) FROM players	wta_1
SELECT min(loser_rank) FROM matches	wta_1
SELECT count(*) FROM CARS_DATA WHERE Cylinders  >  4;	car_1
SELECT count(*) FROM country WHERE GovernmentForm  =  "Republic"	world_1
SELECT count(*) FROM Paragraphs	cre_Doc_Template_Mgt
SELECT country_code FROM players GROUP BY country_code HAVING count(*)  >  50	wta_1
SELECT Hometown FROM teacher GROUP BY Hometown HAVING COUNT(*)  >=  2	course_teach
SELECT Name FROM teacher ORDER BY Age ASC	course_teach
SELECT Episode FROM TV_series ORDER BY rating	tvshow
SELECT FlightNo FROM FLIGHTS WHERE SourceAirport  =  "APG"	flight_2
SELECT count(DISTINCT LOCATION) FROM shop	employee_hire_evaluation