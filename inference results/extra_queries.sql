['<|schema|>table addresses, columns = [*,address_id,line_1,line_2,line_3,city,zip_postcode,state_province_county,country,other_address_details]\ntable courses, columns = [*,course_id,course_name,course_description,other_details]\ntable degree_programs, columns = [*,degree_program_id,department_id,degree_summary_name,degree_summary_description,other_details]\ntable departments, columns = [*,department_id,department_name,department_description,other_details]\ntable sections, columns = [*,section_id,course_id,section_name,section_description,other_details]\ntable semesters, columns = [*,semester_id,semester_name,semester_description,other_details]\ntable student_enrolment, columns = [*,student_enrolment_id,degree_program_id,semester_id,student_id,other_details]\ntable student_enrolment_courses, columns = [*,student_course_id,course_id,student_enrolment_id]\ntable students, columns = [*,student_id,current_address_id,permanent_address_id,first_name,middle_name,last_name,cell_mobile_number,email_address,ssn,date_first_registered,date_left,other_student_details]\ntable transcript_contents, columns = [*,student_course_id,transcript_id]\ntable transcripts, columns = [*,transcript_id,transcript_date,other_details]\nforeign_keys = [addresses.address_id,courses.course_id,departments.department_id,degree_programs.degree_program_id,sections.section_id,semesters.semester_id,students.student_id,student_enrolment.student_enrolment_id,student_enrolment_courses.student_course_id,transcripts.transcript_id]\n\nprimary_keys = [degree_programs.department_id = departments.department_id,sections.course_id = courses.course_id,students.permanent_address_id = addresses.address_id,students.current_address_id = addresses.address_id,student_enrolment.student_id = students.student_id,student_enrolment.semester_id = semesters.semester_id,student_enrolment.degree_program_id = degree_programs.degree_program_id,student_enrolment_courses.student_enrolment_id = student_enrolment.student_enrolment_id,student_enrolment_courses.course_id = courses.course_id,transcript_contents.transcript_id = transcripts.transcript_id,transcript_contents.student_course_id = student_enrolment_courses.student_course_id]<|endoftext|><|query|>for each semester, what is the name and id of the one with the most students registered?<|endoftext|><|sql|>select t1.semester_name ,  t1.semester_id from semesters as t1 join student_enrolment as t2 on t1.semester_id  =  t2.semester_id group by t1.semester_id order by count(*) desc limit 1;<|endoftext|>',
 '<|schema|>table has_pet, columns = [*,stuid,petid]\ntable pets, columns = [*,petid,pettype,pet_age,weight]\ntable student, columns = [*,stuid,lname,fname,age,sex,major,advisor,city_code]\nforeign_keys = [student.stuid,pets.petid]\n\nprimary_keys = [has_pet.stuid = student.stuid,has_pet.petid = pets.petid]<|endoftext|><|query|>find the average age of students who do not have any pet .<|endoftext|><|sql|>select avg(age) from student where stuid not in (select stuid from has_pet);<|endoftext|>',
 "<|schema|>table car_makers, columns = [*,id,maker,fullname,country]\ntable car_names, columns = [*,makeid,model,make]\ntable cars_data, columns = [*,id,mpg,cylinders,edispl,horsepower,weight,accelerate,year]\ntable continents, columns = [*,contid,continent]\ntable countries, columns = [*,countryid,countryname,continent]\ntable model_list, columns = [*,modelid,maker,model]\nforeign_keys = [continents.contid,countries.countryid,car_makers.id,model_list.modelid,car_names.makeid,cars_data.id]\n\nprimary_keys = [countries.continent = continents.contid,car_makers.country = countries.countryid,model_list.maker = car_makers.id,car_names.model = model_list.model,cars_data.id = car_names.makeid]<|endoftext|><|query|>which distinctive models are produced by maker with the full name general motors or weighing more than 3500?<|endoftext|><|sql|>select distinct t2.model from car_names as t1 join model_list as t2 on t1.model  =  t2.model join car_makers as t3 on t2.maker  =  t3.id join cars_data as t4 on t1.makeid  =  t4.id where t3.fullname  =  'general motors' or t4.weight  >  3500;<|endoftext|>",
 '<|schema|>table city, columns = [*,id,name,countrycode,district,population]\ntable country, columns = [*,code,name,continent,region,surfacearea,indepyear,population,lifeexpectancy,gnp,gnpold,localname,governmentform,headofstate,capital,code2]\ntable countrylanguage, columns = [*,countrycode,language,isofficial,percentage]\ntable sqlite_sequence, columns = [*,name,seq]\nforeign_keys = [city.id,country.code,countrylanguage.countrycode]\n\nprimary_keys = [city.countrycode = country.code,countrylanguage.countrycode = country.code]<|endoftext|><|query|>give the name of the nation that uses the greatest amount of languages.<|endoftext|><|sql|>select t1.name from country as t1 join countrylanguage as t2 on t1.code  =  t2.countrycode group by t1.name order by count(*) desc limit 1;<|endoftext|>',
 '<|schema|>table car_makers, columns = [*,id,maker,fullname,country]\ntable car_names, columns = [*,makeid,model,make]\ntable cars_data, columns = [*,id,mpg,cylinders,edispl,horsepower,weight,accelerate,year]\ntable continents, columns = [*,contid,continent]\ntable countries, columns = [*,countryid,countryname,continent]\ntable model_list, columns = [*,modelid,maker,model]\nforeign_keys = [continents.contid,countries.countryid,car_makers.id,model_list.modelid,car_names.makeid,cars_data.id]\n\nprimary_keys = [countries.continent = continents.contid,car_makers.country = countries.countryid,model_list.maker = car_makers.id,car_names.model = model_list.model,cars_data.id = car_names.makeid]<|endoftext|><|query|>find the model of the car whose weight is below the average weight.<|endoftext|><|sql|>select t1.model from car_names as t1 join cars_data as t2 on t1.makeid  =  t2.id where t2.weight  <  (select avg(weight) from cars_data);<|endoftext|>',
 "<|schema|>table addresses, columns = [*,address_id,line_1,line_2,line_3,city,zip_postcode,state_province_county,country,other_address_details]\ntable courses, columns = [*,course_id,course_name,course_description,other_details]\ntable degree_programs, columns = [*,degree_program_id,department_id,degree_summary_name,degree_summary_description,other_details]\ntable departments, columns = [*,department_id,department_name,department_description,other_details]\ntable sections, columns = [*,section_id,course_id,section_name,section_description,other_details]\ntable semesters, columns = [*,semester_id,semester_name,semester_description,other_details]\ntable student_enrolment, columns = [*,student_enrolment_id,degree_program_id,semester_id,student_id,other_details]\ntable student_enrolment_courses, columns = [*,student_course_id,course_id,student_enrolment_id]\ntable students, columns = [*,student_id,current_address_id,permanent_address_id,first_name,middle_name,last_name,cell_mobile_number,email_address,ssn,date_first_registered,date_left,other_student_details]\ntable transcript_contents, columns = [*,student_course_id,transcript_id]\ntable transcripts, columns = [*,transcript_id,transcript_date,other_details]\nforeign_keys = [addresses.address_id,courses.course_id,departments.department_id,degree_programs.degree_program_id,sections.section_id,semesters.semester_id,students.student_id,student_enrolment.student_enrolment_id,student_enrolment_courses.student_course_id,transcripts.transcript_id]\n\nprimary_keys = [degree_programs.department_id = departments.department_id,sections.course_id = courses.course_id,students.permanent_address_id = addresses.address_id,students.current_address_id = addresses.address_id,student_enrolment.student_id = students.student_id,student_enrolment.semester_id = semesters.semester_id,student_enrolment.degree_program_id = degree_programs.degree_program_id,student_enrolment_courses.student_enrolment_id = student_enrolment.student_enrolment_id,student_enrolment_courses.course_id = courses.course_id,transcript_contents.transcript_id = transcripts.transcript_id,transcript_contents.student_course_id = student_enrolment_courses.student_course_id]<|endoftext|><|query|>find the last name of the students who currently live in the state of north carolina but have not registered in any degree program.<|endoftext|><|sql|>select t1.last_name from students as t1 join addresses as t2 on t1.current_address_id  =  t2.address_id where t2.state_province_county  =  'northcarolina' except select distinct t3.last_name from students as t3 join student_enrolment as t4 on t3.student_id  =  t4.student_id;<|endoftext|>",
 "<|schema|>table car_makers, columns = [*,id,maker,fullname,country]\ntable car_names, columns = [*,makeid,model,make]\ntable cars_data, columns = [*,id,mpg,cylinders,edispl,horsepower,weight,accelerate,year]\ntable continents, columns = [*,contid,continent]\ntable countries, columns = [*,countryid,countryname,continent]\ntable model_list, columns = [*,modelid,maker,model]\nforeign_keys = [continents.contid,countries.countryid,car_makers.id,model_list.modelid,car_names.makeid,cars_data.id]\n\nprimary_keys = [countries.continent = continents.contid,car_makers.country = countries.countryid,model_list.maker = car_makers.id,car_names.model = model_list.model,cars_data.id = car_names.makeid]<|endoftext|><|query|>which countries in europe have at least 3 car manufacturers?<|endoftext|><|sql|>select t1.countryname from countries as t1 join continents as t2 on t1.continent  =  t2.contid join car_makers as t3 on t1.countryid  =  t3.country where t2.continent  =  'europe' group by t1.countryname having count(*)  >=  3;<|endoftext|>",
 '<|schema|>table airlines, columns = [*,uid,airline,abbreviation,country]\ntable airports, columns = [*,city,airportcode,airportname,country,countryabbrev]\ntable flights, columns = [*,airline,flightno,sourceairport,destairport]\nforeign_keys = [airlines.uid,airports.airportcode,flights.airline]\n\nprimary_keys = [flights.destairport = airports.airportcode,flights.sourceairport = airports.airportcode]<|endoftext|><|query|>which city has most number of departing flights?<|endoftext|><|sql|>select t1.city from airports as t1 join flights as t2 on t1.airportcode  =  t2.sourceairport group by t1.city order by count(*) desc limit 1;<|endoftext|>',
 '<|schema|>table museum, columns = [*,museum_id,name,num_of_staff,open_year]\ntable visit, columns = [*,museum_id,visitor_id,num_of_ticket,total_spent]\ntable visitor, columns = [*,id,name,level_of_membership,age]\nforeign_keys = [museum.museum_id,visitor.id,visit.museum_id]\n\nprimary_keys = [visit.visitor_id = visitor.id,visit.museum_id = museum.museum_id]<|endoftext|><|query|>find the number of visitors who did not visit any museum opened after 2010.<|endoftext|><|sql|>select count(*) from visitor where id not in (select t2.visitor_id from museum as t1 join visit as t2 on t1.museum_id  =  t2.museum_id where t1.open_year  >  2010);<|endoftext|>',
 '<|schema|>table museum, columns = [*,museum_id,name,num_of_staff,open_year]\ntable visit, columns = [*,museum_id,visitor_id,num_of_ticket,total_spent]\ntable visitor, columns = [*,id,name,level_of_membership,age]\nforeign_keys = [museum.museum_id,visitor.id,visit.museum_id]\n\nprimary_keys = [visit.visitor_id = visitor.id,visit.museum_id = museum.museum_id]<|endoftext|><|query|>what are the id, name and membership level of visitors who have spent the largest amount of money in total in all museum tickets?<|endoftext|><|sql|>select t2.visitor_id ,  t1.name ,  t1.level_of_membership from visitor as t1 join visit as t2 on t1.id  =  t2.visitor_id group by t2.visitor_id order by sum(t2.total_spent) desc limit 1;<|endoftext|>',
 '<|schema|>table museum, columns = [*,museum_id,name,num_of_staff,open_year]\ntable visit, columns = [*,museum_id,visitor_id,num_of_ticket,total_spent]\ntable visitor, columns = [*,id,name,level_of_membership,age]\nforeign_keys = [museum.museum_id,visitor.id,visit.museum_id]\n\nprimary_keys = [visit.visitor_id = visitor.id,visit.museum_id = museum.museum_id]<|endoftext|><|query|>what are the id and name of the museum visited most times?<|endoftext|><|sql|>select t2.museum_id ,  t1.name from museum as t1 join visit as t2 on t1.museum_id  =  t2.museum_id group by t2.museum_id order by count(*) desc limit 1;<|endoftext|>',
 '<|schema|>table breeds, columns = [*,breed_code,breed_name]\ntable charges, columns = [*,charge_id,charge_type,charge_amount]\ntable dogs, columns = [*,dog_id,owner_id,abandoned_yn,breed_code,size_code,name,age,date_of_birth,gender,weight,date_arrived,date_adopted,date_departed]\ntable owners, columns = [*,owner_id,first_name,last_name,street,city,state,zip_code,email_address,home_phone,cell_number]\ntable professionals, columns = [*,professional_id,role_code,first_name,street,city,state,zip_code,last_name,email_address,home_phone,cell_number]\ntable sizes, columns = [*,size_code,size_description]\ntable treatment_types, columns = [*,treatment_type_code,treatment_type_description]\ntable treatments, columns = [*,treatment_id,dog_id,professional_id,treatment_type_code,date_of_treatment,cost_of_treatment]\nforeign_keys = [breeds.breed_code,charges.charge_id,sizes.size_code,treatment_types.treatment_type_code,owners.owner_id,dogs.dog_id,professionals.professional_id,treatments.treatment_id]\n\nprimary_keys = [dogs.owner_id = owners.owner_id,dogs.owner_id = owners.owner_id,dogs.size_code = sizes.size_code,dogs.breed_code = breeds.breed_code,treatments.dog_id = dogs.dog_id,treatments.professional_id = professionals.professional_id,treatments.treatment_type_code = treatment_types.treatment_type_code]<|endoftext|><|query|>which professionals have operated a treatment that costs less than the average? give me theor first names and last names.<|endoftext|><|sql|>select distinct t1.first_name ,  t1.last_name from professionals as t1 join treatments as t2 where cost_of_treatment  <  ( select avg(cost_of_treatment) from treatments );<|endoftext|>',
 "<|schema|>table has_pet, columns = [*,stuid,petid]\ntable pets, columns = [*,petid,pettype,pet_age,weight]\ntable student, columns = [*,stuid,lname,fname,age,sex,major,advisor,city_code]\nforeign_keys = [student.stuid,pets.petid]\n\nprimary_keys = [has_pet.stuid = student.stuid,has_pet.petid = pets.petid]<|endoftext|><|query|>what are the students' first names who have both cats and dogs as pets?<|endoftext|><|sql|>select t1.fname from student as t1 join has_pet as t2 on t1.stuid  =  t2.stuid join pets as t3 on t3.petid  =  t2.petid where t3.pettype  =  'cat' intersect select t1.fname from student as t1 join has_pet as t2 on t1.stuid  =  t2.stuid join pets as t3 on t3.petid  =  t2.petid where t3.pettype  =  'dog';<|endoftext|>",
 '<|schema|>table airlines, columns = [*,uid,airline,abbreviation,country]\ntable airports, columns = [*,city,airportcode,airportname,country,countryabbrev]\ntable flights, columns = [*,airline,flightno,sourceairport,destairport]\nforeign_keys = [airlines.uid,airports.airportcode,flights.airline]\n\nprimary_keys = [flights.destairport = airports.airportcode,flights.sourceairport = airports.airportcode]<|endoftext|><|query|>find the abbreviation and country of the airline that has fewest number of flights?<|endoftext|><|sql|>select t1.abbreviation ,  t1.country from airlines as t1 join flights as t2 on t1.uid  =  t2.airline group by t1.airline order by count(*) limit 1;<|endoftext|>',
 '<|schema|>table concert, columns = [*,concert_id,concert_name,theme,stadium_id,year]\ntable singer, columns = [*,singer_id,name,country,song_name,song_release_year,age,is_male]\ntable singer_in_concert, columns = [*,concert_id,singer_id]\ntable stadium, columns = [*,stadium_id,location,name,capacity,highest,lowest,average]\nforeign_keys = [stadium.stadium_id,singer.singer_id,concert.concert_id,singer_in_concert.concert_id,singer_in_concert.singer_id]\n\nprimary_keys = [concert.stadium_id = stadium.stadium_id,singer_in_concert.singer_id = singer.singer_id,singer_in_concert.concert_id = concert.concert_id]<|endoftext|><|query|>find the name and location of the stadiums which some concerts happened in the years of both 2014 and 2015.<|endoftext|><|sql|>select t2.name ,  t2.location from concert as t1 join stadium as t2 on t1.stadium_id  =  t2.stadium_id where t1.year  =  2014 intersect select t2.name ,  t2.location from concert as t1 join stadium as t2 on t1.stadium_id  =  t2.stadium_id where t1.year  =  2015;<|endoftext|>',
 '<|schema|>table city, columns = [*,id,name,countrycode,district,population]\ntable country, columns = [*,code,name,continent,region,surfacearea,indepyear,population,lifeexpectancy,gnp,gnpold,localname,governmentform,headofstate,capital,code2]\ntable countrylanguage, columns = [*,countrycode,language,isofficial,percentage]\ntable sqlite_sequence, columns = [*,name,seq]\nforeign_keys = [city.id,country.code,countrylanguage.countrycode]\n\nprimary_keys = [city.countrycode = country.code,countrylanguage.countrycode = country.code]<|endoftext|><|query|>find the number of cities in each district whose population is greater than the average population of cities?<|endoftext|><|sql|>select count(*) ,  district from city where population  >  (select avg(population) from city) group by district;<|endoftext|>',
 '<|schema|>table city, columns = [*,id,name,countrycode,district,population]\ntable country, columns = [*,code,name,continent,region,surfacearea,indepyear,population,lifeexpectancy,gnp,gnpold,localname,governmentform,headofstate,capital,code2]\ntable countrylanguage, columns = [*,countrycode,language,isofficial,percentage]\ntable sqlite_sequence, columns = [*,name,seq]\nforeign_keys = [city.id,country.code,countrylanguage.countrycode]\n\nprimary_keys = [city.countrycode = country.code,countrylanguage.countrycode = country.code]<|endoftext|><|query|>what are the countries where either english or dutch is the official language ?<|endoftext|><|sql|>select t1.name from country as t1 join countrylanguage as t2 on t1.code  =  t2.countrycode where t2.language  =  "english" and isofficial  =  "t" union select t1.name from country as t1 join countrylanguage as t2 on t1.code  =  t2.countrycode where t2.language  =  "dutch" and isofficial  =  "t";<|endoftext|>',
 '<|schema|>table city, columns = [*,id,name,countrycode,district,population]\ntable country, columns = [*,code,name,continent,region,surfacearea,indepyear,population,lifeexpectancy,gnp,gnpold,localname,governmentform,headofstate,capital,code2]\ntable countrylanguage, columns = [*,countrycode,language,isofficial,percentage]\ntable sqlite_sequence, columns = [*,name,seq]\nforeign_keys = [city.id,country.code,countrylanguage.countrycode]\n\nprimary_keys = [city.countrycode = country.code,countrylanguage.countrycode = country.code]<|endoftext|><|query|>give the names of nations that speak both english and french.<|endoftext|><|sql|>select t1.name from country as t1 join countrylanguage as t2 on t1.code  =  t2.countrycode where t2.language  =  "english" intersect select t1.name from country as t1 join countrylanguage as t2 on t1.code  =  t2.countrycode where t2.language  =  "french";<|endoftext|>',
 "<|schema|>table battle, columns = [*,id,name,date,bulgarian_commander,latin_commander,result]\ntable death, columns = [*,caused_by_ship_id,id,note,killed,injured]\ntable ship, columns = [*,lost_in_battle,id,name,tonnage,ship_type,location,disposition_of_ship]\nforeign_keys = [battle.id,ship.id,death.id]\n\nprimary_keys = [ship.lost_in_battle = battle.id,death.caused_by_ship_id = ship.id]<|endoftext|><|query|>how many battles did not lose any ship with tonnage '225'?<|endoftext|><|sql|>select count(*) from battle where id not in ( select lost_in_battle from ship where tonnage  =  '225' );<|endoftext|>",
 '<|schema|>table airlines, columns = [*,uid,airline,abbreviation,country]\ntable airports, columns = [*,city,airportcode,airportname,country,countryabbrev]\ntable flights, columns = [*,airline,flightno,sourceairport,destairport]\nforeign_keys = [airlines.uid,airports.airportcode,flights.airline]\n\nprimary_keys = [flights.destairport = airports.airportcode,flights.sourceairport = airports.airportcode]<|endoftext|><|query|>which city has the most frequent destination airport?<|endoftext|><|sql|>select t1.city from airports as t1 join flights as t2 on t1.airportcode  =  t2.destairport group by t1.city order by count(*) desc limit 1;<|endoftext|>',
 '<|schema|>table breeds, columns = [*,breed_code,breed_name]\ntable charges, columns = [*,charge_id,charge_type,charge_amount]\ntable dogs, columns = [*,dog_id,owner_id,abandoned_yn,breed_code,size_code,name,age,date_of_birth,gender,weight,date_arrived,date_adopted,date_departed]\ntable owners, columns = [*,owner_id,first_name,last_name,street,city,state,zip_code,email_address,home_phone,cell_number]\ntable professionals, columns = [*,professional_id,role_code,first_name,street,city,state,zip_code,last_name,email_address,home_phone,cell_number]\ntable sizes, columns = [*,size_code,size_description]\ntable treatment_types, columns = [*,treatment_type_code,treatment_type_description]\ntable treatments, columns = [*,treatment_id,dog_id,professional_id,treatment_type_code,date_of_treatment,cost_of_treatment]\nforeign_keys = [breeds.breed_code,charges.charge_id,sizes.size_code,treatment_types.treatment_type_code,owners.owner_id,dogs.dog_id,professionals.professional_id,treatments.treatment_id]\n\nprimary_keys = [dogs.owner_id = owners.owner_id,dogs.owner_id = owners.owner_id,dogs.size_code = sizes.size_code,dogs.breed_code = breeds.breed_code,treatments.dog_id = dogs.dog_id,treatments.professional_id = professionals.professional_id,treatments.treatment_type_code = treatment_types.treatment_type_code]<|endoftext|><|query|>return the owner id, first name and last name of the owner who has the most dogs.<|endoftext|><|sql|>select t1.owner_id ,  t2.first_name ,  t2.last_name from dogs as t1 join owners as t2 on t1.owner_id  =  t2.owner_id group by t1.owner_id order by count(*) desc limit 1;<|endoftext|>',
 '<|schema|>table breeds, columns = [*,breed_code,breed_name]\ntable charges, columns = [*,charge_id,charge_type,charge_amount]\ntable dogs, columns = [*,dog_id,owner_id,abandoned_yn,breed_code,size_code,name,age,date_of_birth,gender,weight,date_arrived,date_adopted,date_departed]\ntable owners, columns = [*,owner_id,first_name,last_name,street,city,state,zip_code,email_address,home_phone,cell_number]\ntable professionals, columns = [*,professional_id,role_code,first_name,street,city,state,zip_code,last_name,email_address,home_phone,cell_number]\ntable sizes, columns = [*,size_code,size_description]\ntable treatment_types, columns = [*,treatment_type_code,treatment_type_description]\ntable treatments, columns = [*,treatment_id,dog_id,professional_id,treatment_type_code,date_of_treatment,cost_of_treatment]\nforeign_keys = [breeds.breed_code,charges.charge_id,sizes.size_code,treatment_types.treatment_type_code,owners.owner_id,dogs.dog_id,professionals.professional_id,treatments.treatment_id]\n\nprimary_keys = [dogs.owner_id = owners.owner_id,dogs.owner_id = owners.owner_id,dogs.size_code = sizes.size_code,dogs.breed_code = breeds.breed_code,treatments.dog_id = dogs.dog_id,treatments.professional_id = professionals.professional_id,treatments.treatment_type_code = treatment_types.treatment_type_code]<|endoftext|><|query|>which breed do the most dogs have? give me the breed name.<|endoftext|><|sql|>select t1.breed_name from breeds as t1 join dogs as t2 on t1.breed_code  =  t2.breed_code group by t1.breed_name order by count(*) desc limit 1;<|endoftext|>',
 '<|schema|>table has_pet, columns = [*,stuid,petid]\ntable pets, columns = [*,petid,pettype,pet_age,weight]\ntable student, columns = [*,stuid,lname,fname,age,sex,major,advisor,city_code]\nforeign_keys = [student.stuid,pets.petid]\n\nprimary_keys = [has_pet.stuid = student.stuid,has_pet.petid = pets.petid]<|endoftext|><|query|>what is the average age for all students who do not own any pets ?<|endoftext|><|sql|>select avg(age) from student where stuid not in (select stuid from has_pet);<|endoftext|>',
 '<|schema|>table area_code_state, columns = [*,area_code,state]\ntable contestants, columns = [*,contestant_number,contestant_name]\ntable votes, columns = [*,vote_id,phone_number,state,contestant_number,created]\nforeign_keys = [area_code_state.area_code,contestants.contestant_number,votes.vote_id]\n\nprimary_keys = [votes.contestant_number = contestants.contestant_number,votes.state = area_code_state.state]<|endoftext|><|query|>what is the area code in which the most voters voted?<|endoftext|><|sql|>select t1.area_code from area_code_state as t1 join votes as t2 on t1.state  =  t2.state group by t1.area_code order by count(*) desc limit 1;<|endoftext|>',
 "<|schema|>table cartoon, columns = [*,id,title,directed_by,written_by,original_air_date,production_code,channel]\ntable tv_channel, columns = [*,id,series_name,country,language,content,pixel_aspect_ratio_par,hight_definition_tv,pay_per_view_ppv,package_option]\ntable tv_series, columns = [*,id,episode,air_date,rating,share,18_49_rating_share,viewers_m,weekly_rank,channel]\nforeign_keys = [tv_channel.id,tv_series.id,cartoon.id]\n\nprimary_keys = [tv_series.channel = tv_channel.id,cartoon.channel = tv_channel.id]<|endoftext|><|query|>find the series name and country of the tv channel that is playing some cartoons directed by ben jones and michael chang?<|endoftext|><|sql|>select t1.series_name ,  t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.directed_by  =  'michael chang' intersect select t1.series_name ,  t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.directed_by  =  'ben jones';<|endoftext|>"]