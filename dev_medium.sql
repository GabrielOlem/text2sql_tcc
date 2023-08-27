SELECT transcript_date ,  other_details FROM Transcripts ORDER BY transcript_date ASC LIMIT 1	student_transcripts_tracking
SELECT T3.Name ,  T2.Course FROM course_arrange AS T1 JOIN course AS T2 ON T1.Course_ID  =  T2.Course_ID JOIN teacher AS T3 ON T1.Teacher_ID  =  T3.Teacher_ID	course_teach
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.SourceAirport  =  T2.AirportCode WHERE T2.City  =  "Aberdeen"	flight_2
SELECT count(*) FROM FLIGHTS AS T1 JOIN AIRPORTS AS T2 ON T1.DestAirport  =  T2.AirportCode WHERE T2.City  =  "Aberdeen"	flight_2
SELECT package_option ,  series_name FROM TV_Channel WHERE hight_definition_TV  =  "yes"	tvshow
SELECT LANGUAGE ,  CountryCode ,  max(Percentage) FROM countrylanguage GROUP BY CountryCode	world_1
SELECT T1.date_of_treatment ,  T2.first_name FROM Treatments AS T1 JOIN Professionals AS T2 ON T1.professional_id  =  T2.professional_id	dog_kennels
SELECT template_id FROM Templates WHERE template_type_code  =  "PP" OR template_type_code  =  "PPT"	cre_Doc_Template_Mgt
SELECT COUNT( DISTINCT Continent) FROM country AS T1 JOIN countrylanguage AS T2 ON T1.Code  =  T2.CountryCode WHERE T2.Language  =  "Chinese"	world_1
SELECT avg(age) ,  min(age) ,  max(age) FROM singer WHERE country  =  'France'	concert_singer
SELECT T2.name FROM Likes AS T1 JOIN Highschooler AS T2 ON T1.student_id  =  T2.id GROUP BY T1.student_id HAVING count(*)  >=  2	network_1
SELECT count(*) FROM Highschooler WHERE grade  =  9 OR grade  =  10	network_1
SELECT Final_Table_Made ,  Best_Finish FROM poker_player	poker_player
select production_code ,  channel from cartoon order by original_air_date desc limit 1	tvshow
SELECT avg(num_of_ticket) ,  max(num_of_ticket) FROM visit	museum_visit
SELECT T2.Name FROM course_arrange AS T1 JOIN teacher AS T2 ON T1.Teacher_ID  =  T2.Teacher_ID GROUP BY T2.Name HAVING COUNT(*)  >=  2	course_teach
SELECT name ,  country FROM singer WHERE song_name LIKE '%Hey%'	concert_singer
SELECT first_name ,  country_code FROM players ORDER BY birth_date LIMIT 1	wta_1
SELECT count(*) FROM Documents AS T1 JOIN Templates AS T2 ON T1.Template_ID  =  T2.Template_ID WHERE T2.Template_Type_Code  =  'PPT'	cre_Doc_Template_Mgt
SELECT min(Number_products) ,  max(Number_products) FROM shop	employee_hire_evaluation
SELECT count(*) ,  hand FROM players GROUP BY hand	wta_1
SELECT T1.country FROM TV_Channel AS T1 JOIN cartoon AS T2 ON T1.id = T2.Channel WHERE T2.written_by  =  'Todd Casey'	tvshow
SELECT DISTINCT T1.id ,  T1.name FROM battle AS T1 JOIN ship AS T2 ON T1.id  =  T2.lost_in_battle WHERE T2.ship_type  =  'Brig'	battle_death
SELECT line_1 ,  line_2 FROM addresses	student_transcripts_tracking
SELECT COUNT(*) FROM orchestra WHERE Major_Record_Format  =  "CD" OR Major_Record_Format  =  "DVD"	orchestra