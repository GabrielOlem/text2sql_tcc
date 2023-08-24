['<|schema|>table employee, columns = [*,employee_id,name,age,city]\ntable evaluation, columns = [*,employee_id,year_awarded,bonus]\ntable hiring, columns = [*,shop_id,employee_id,start_from,is_full_time]\ntable shop, columns = [*,shop_id,name,location,district,number_products,manager_name]\nforeign_keys = [employee.employee_id,shop.shop_id,hiring.employee_id,evaluation.employee_id]\n\nprimary_keys = [hiring.employee_id = employee.employee_id,hiring.shop_id = shop.shop_id,evaluation.employee_id = employee.employee_id]<|endoftext|><|query|>what are the names of the employees who never received any evaluation?<|endoftext|><|sql|>select name from employee where employee_id not in (select employee_id from evaluation);<|endoftext|>',
 "<|schema|>table cartoon, columns = [*,id,title,directed_by,written_by,original_air_date,production_code,channel]\ntable tv_channel, columns = [*,id,series_name,country,language,content,pixel_aspect_ratio_par,hight_definition_tv,pay_per_view_ppv,package_option]\ntable tv_series, columns = [*,id,episode,air_date,rating,share,18_49_rating_share,viewers_m,weekly_rank,channel]\nforeign_keys = [tv_channel.id,tv_series.id,cartoon.id]\n\nprimary_keys = [tv_series.channel = tv_channel.id,cartoon.channel = tv_channel.id]<|endoftext|><|query|>which countries' tv channels are not playing any cartoon written by todd casey?<|endoftext|><|sql|>select country from tv_channel except select t1.country from tv_channel as t1 join cartoon as t2 on t1.id = t2.channel where t2.written_by  =  'todd casey';<|endoftext|>",
 '<|schema|>table employee, columns = [*,employee_id,name,age,city]\ntable evaluation, columns = [*,employee_id,year_awarded,bonus]\ntable hiring, columns = [*,shop_id,employee_id,start_from,is_full_time]\ntable shop, columns = [*,shop_id,name,location,district,number_products,manager_name]\nforeign_keys = [employee.employee_id,shop.shop_id,hiring.employee_id,evaluation.employee_id]\n\nprimary_keys = [hiring.employee_id = employee.employee_id,hiring.shop_id = shop.shop_id,evaluation.employee_id = employee.employee_id]<|endoftext|><|query|>find the districts in which there are both shops selling less than 3000 products and shops selling more than 10000 products.<|endoftext|><|sql|>select district from shop where number_products  <  3000 intersect select district from shop where number_products  >  10000;<|endoftext|>',
 '<|schema|>table documents, columns = [*,document_id,template_id,document_name,document_description,other_details]\ntable paragraphs, columns = [*,paragraph_id,document_id,paragraph_text,other_details]\ntable ref_template_types, columns = [*,template_type_code,template_type_description]\ntable templates, columns = [*,template_id,version_number,template_type_code,date_effective_from,date_effective_to,template_details]\nforeign_keys = [ref_template_types.template_type_code,templates.template_id,documents.document_id,paragraphs.paragraph_id]\n\nprimary_keys = [templates.template_type_code = ref_template_types.template_type_code,documents.template_id = templates.template_id,paragraphs.document_id = documents.document_id]<|endoftext|><|query|>what is the document id with least number of paragraphs?<|endoftext|><|sql|>select document_id from paragraphs group by document_id order by count(*) asc limit 1;<|endoftext|>',
 "<|schema|>table documents, columns = [*,document_id,template_id,document_name,document_description,other_details]\ntable paragraphs, columns = [*,paragraph_id,document_id,paragraph_text,other_details]\ntable ref_template_types, columns = [*,template_type_code,template_type_description]\ntable templates, columns = [*,template_id,version_number,template_type_code,date_effective_from,date_effective_to,template_details]\nforeign_keys = [ref_template_types.template_type_code,templates.template_id,documents.document_id,paragraphs.paragraph_id]\n\nprimary_keys = [templates.template_type_code = ref_template_types.template_type_code,documents.template_id = templates.template_id,paragraphs.document_id = documents.document_id]<|endoftext|><|query|>show the document id with paragraph text 'brazil' and 'ireland'.<|endoftext|><|sql|>select document_id from paragraphs where paragraph_text  =  'brazil' intersect select document_id from paragraphs where paragraph_text  =  'ireland';<|endoftext|>",
 '<|schema|>table car_makers, columns = [*,id,maker,fullname,country]\ntable car_names, columns = [*,makeid,model,make]\ntable cars_data, columns = [*,id,mpg,cylinders,edispl,horsepower,weight,accelerate,year]\ntable continents, columns = [*,contid,continent]\ntable countries, columns = [*,countryid,countryname,continent]\ntable model_list, columns = [*,modelid,maker,model]\nforeign_keys = [continents.contid,countries.countryid,car_makers.id,model_list.modelid,car_names.makeid,cars_data.id]\n\nprimary_keys = [countries.continent = continents.contid,car_makers.country = countries.countryid,model_list.maker = car_makers.id,car_names.model = model_list.model,cars_data.id = car_names.makeid]<|endoftext|><|query|>what are the name of the countries where there is not a single car maker?<|endoftext|><|sql|>select countryname from countries except select t1.countryname from countries as t1 join car_makers as t2 on t1.countryid  =  t2.country;<|endoftext|>',
 '<|schema|>table car_makers, columns = [*,id,maker,fullname,country]\ntable car_names, columns = [*,makeid,model,make]\ntable cars_data, columns = [*,id,mpg,cylinders,edispl,horsepower,weight,accelerate,year]\ntable continents, columns = [*,contid,continent]\ntable countries, columns = [*,countryid,countryname,continent]\ntable model_list, columns = [*,modelid,maker,model]\nforeign_keys = [continents.contid,countries.countryid,car_makers.id,model_list.modelid,car_names.makeid,cars_data.id]\n\nprimary_keys = [countries.continent = continents.contid,car_makers.country = countries.countryid,model_list.maker = car_makers.id,car_names.model = model_list.model,cars_data.id = car_names.makeid]<|endoftext|><|query|>which distinct car models are the produced after 1980?<|endoftext|><|sql|>select distinct t1.model from model_list as t1 join car_names as t2 on t1.model  =  t2.model join cars_data as t3 on t2.makeid  =  t3.id where t3.year  >  1980;<|endoftext|>',
 '<|schema|>table city, columns = [*,id,name,countrycode,district,population]\ntable country, columns = [*,code,name,continent,region,surfacearea,indepyear,population,lifeexpectancy,gnp,gnpold,localname,governmentform,headofstate,capital,code2]\ntable countrylanguage, columns = [*,countrycode,language,isofficial,percentage]\ntable sqlite_sequence, columns = [*,name,seq]\nforeign_keys = [city.id,country.code,countrylanguage.countrycode]\n\nprimary_keys = [city.countrycode = country.code,countrylanguage.countrycode = country.code]<|endoftext|><|query|>which unique cities are in asian countries where chinese is the official language ?<|endoftext|><|sql|>select distinct t3.name from country as t1 join countrylanguage as t2 on t1.code  =  t2.countrycode join city as t3 on t1.code  =  t3.countrycode where t2.isofficial  =  \'t\' and t2.language  =  \'chinese\' and t1.continent  =  "asia";<|endoftext|>',
 '<|schema|>table breeds, columns = [*,breed_code,breed_name]\ntable charges, columns = [*,charge_id,charge_type,charge_amount]\ntable dogs, columns = [*,dog_id,owner_id,abandoned_yn,breed_code,size_code,name,age,date_of_birth,gender,weight,date_arrived,date_adopted,date_departed]\ntable owners, columns = [*,owner_id,first_name,last_name,street,city,state,zip_code,email_address,home_phone,cell_number]\ntable professionals, columns = [*,professional_id,role_code,first_name,street,city,state,zip_code,last_name,email_address,home_phone,cell_number]\ntable sizes, columns = [*,size_code,size_description]\ntable treatment_types, columns = [*,treatment_type_code,treatment_type_description]\ntable treatments, columns = [*,treatment_id,dog_id,professional_id,treatment_type_code,date_of_treatment,cost_of_treatment]\nforeign_keys = [breeds.breed_code,charges.charge_id,sizes.size_code,treatment_types.treatment_type_code,owners.owner_id,dogs.dog_id,professionals.professional_id,treatments.treatment_id]\n\nprimary_keys = [dogs.owner_id = owners.owner_id,dogs.owner_id = owners.owner_id,dogs.size_code = sizes.size_code,dogs.breed_code = breeds.breed_code,treatments.dog_id = dogs.dog_id,treatments.professional_id = professionals.professional_id,treatments.treatment_type_code = treatment_types.treatment_type_code]<|endoftext|><|query|>what is the average age of the dogs who have gone through any treatments?<|endoftext|><|sql|>select avg(age) from dogs where dog_id in ( select dog_id from treatments );<|endoftext|>',
 "<|schema|>table cartoon, columns = [*,id,title,directed_by,written_by,original_air_date,production_code,channel]\ntable tv_channel, columns = [*,id,series_name,country,language,content,pixel_aspect_ratio_par,hight_definition_tv,pay_per_view_ppv,package_option]\ntable tv_series, columns = [*,id,episode,air_date,rating,share,18_49_rating_share,viewers_m,weekly_rank,channel]\nforeign_keys = [tv_channel.id,tv_series.id,cartoon.id]\n\nprimary_keys = [tv_series.channel = tv_channel.id,cartoon.channel = tv_channel.id]<|endoftext|><|query|>find the package option of the tv channel that do not have any cartoon directed by ben jones.<|endoftext|><|sql|>select package_option from tv_channel where id not in (select channel from cartoon where directed_by  =  'ben jones');<|endoftext|>",
 '<|schema|>table airlines, columns = [*,uid,airline,abbreviation,country]\ntable airports, columns = [*,city,airportcode,airportname,country,countryabbrev]\ntable flights, columns = [*,airline,flightno,sourceairport,destairport]\nforeign_keys = [airlines.uid,airports.airportcode,flights.airline]\n\nprimary_keys = [flights.destairport = airports.airportcode,flights.sourceairport = airports.airportcode]<|endoftext|><|query|>how many flights fly from aberdeen to ashley?<|endoftext|><|sql|>select count(*) from flights as t1 join airports as t2 on t1.destairport  =  t2.airportcode join airports as t3 on t1.sourceairport  =  t3.airportcode where t2.city  =  "ashley" and t3.city  =  "aberdeen";<|endoftext|>',
 '<|schema|>table conductor, columns = [*,conductor_id,name,age,nationality,year_of_work]\ntable orchestra, columns = [*,orchestra_id,orchestra,conductor_id,record_company,year_of_founded,major_record_format]\ntable performance, columns = [*,performance_id,orchestra_id,type,date,official_ratings_(millions),weekly_rank,share]\ntable show, columns = [*,show_id,performance_id,if_first_show,result,attendance]\nforeign_keys = [conductor.conductor_id,orchestra.orchestra_id,performance.performance_id]\n\nprimary_keys = [orchestra.conductor_id = conductor.conductor_id,performance.orchestra_id = orchestra.orchestra_id,show.performance_id = performance.performance_id]<|endoftext|><|query|>what are the orchestras that do not have any performances?<|endoftext|><|sql|>select orchestra from orchestra where orchestra_id not in (select orchestra_id from performance);<|endoftext|>',
 '<|schema|>table airlines, columns = [*,uid,airline,abbreviation,country]\ntable airports, columns = [*,city,airportcode,airportname,country,countryabbrev]\ntable flights, columns = [*,airline,flightno,sourceairport,destairport]\nforeign_keys = [airlines.uid,airports.airportcode,flights.airline]\n\nprimary_keys = [flights.destairport = airports.airportcode,flights.sourceairport = airports.airportcode]<|endoftext|><|query|>find the number of flights landing in the city of aberdeen or abilene.<|endoftext|><|sql|>select count(*) from flights as t1 join airports as t2 on t1.destairport  =  t2.airportcode where t2.city  =  "aberdeen" or t2.city  =  "abilene";<|endoftext|>',
 "<|schema|>table has_pet, columns = [*,stuid,petid]\ntable pets, columns = [*,petid,pettype,pet_age,weight]\ntable student, columns = [*,stuid,lname,fname,age,sex,major,advisor,city_code]\nforeign_keys = [student.stuid,pets.petid]\n\nprimary_keys = [has_pet.stuid = student.stuid,has_pet.petid = pets.petid]<|endoftext|><|query|>find the number of dog pets that are raised by female students (with sex f).<|endoftext|><|sql|>select count(*) from student as t1 join has_pet as t2 on t1.stuid  =  t2.stuid join pets as t3 on t2.petid  =  t3.petid where t1.sex  =  'f' and t3.pettype  =  'dog';<|endoftext|>",
 '<|schema|>table concert, columns = [*,concert_id,concert_name,theme,stadium_id,year]\ntable singer, columns = [*,singer_id,name,country,song_name,song_release_year,age,is_male]\ntable singer_in_concert, columns = [*,concert_id,singer_id]\ntable stadium, columns = [*,stadium_id,location,name,capacity,highest,lowest,average]\nforeign_keys = [stadium.stadium_id,singer.singer_id,concert.concert_id,singer_in_concert.concert_id,singer_in_concert.singer_id]\n\nprimary_keys = [concert.stadium_id = stadium.stadium_id,singer_in_concert.singer_id = singer.singer_id,singer_in_concert.concert_id = concert.concert_id]<|endoftext|><|query|>what are the names of the stadiums without any concerts?<|endoftext|><|sql|>select name from stadium where stadium_id not in (select stadium_id from concert);<|endoftext|>',
 '<|schema|>table car_makers, columns = [*,id,maker,fullname,country]\ntable car_names, columns = [*,makeid,model,make]\ntable cars_data, columns = [*,id,mpg,cylinders,edispl,horsepower,weight,accelerate,year]\ntable continents, columns = [*,contid,continent]\ntable countries, columns = [*,countryid,countryname,continent]\ntable model_list, columns = [*,modelid,maker,model]\nforeign_keys = [continents.contid,countries.countryid,car_makers.id,model_list.modelid,car_names.makeid,cars_data.id]\n\nprimary_keys = [countries.continent = continents.contid,car_makers.country = countries.countryid,model_list.maker = car_makers.id,car_names.model = model_list.model,cars_data.id = car_names.makeid]<|endoftext|><|query|>how many cars have a larger accelerate than the car with the largest horsepower?<|endoftext|><|sql|>select count(*) from cars_data where accelerate  >  ( select accelerate from cars_data order by horsepower desc limit 1 );<|endoftext|>',
 "<|schema|>table matches, columns = [*,best_of,draw_size,loser_age,loser_entry,loser_hand,loser_ht,loser_id,loser_ioc,loser_name,loser_rank,loser_rank_points,loser_seed,match_num,minutes,round,score,surface,tourney_date,tourney_id,tourney_level,tourney_name,winner_age,winner_entry,winner_hand,winner_ht,winner_id,winner_ioc,winner_name,winner_rank,winner_rank_points,winner_seed,year]\ntable players, columns = [*,player_id,first_name,last_name,hand,birth_date,country_code]\ntable rankings, columns = [*,ranking_date,ranking,player_id,ranking_points,tours]\nforeign_keys = [players.player_id]\n\nprimary_keys = [matches.winner_id = players.player_id,matches.loser_id = players.player_id,rankings.player_id = players.player_id]<|endoftext|><|query|>what is the name of the winner with the most rank points who participated in the australian open tournament?<|endoftext|><|sql|>select winner_name from matches where tourney_name  =  'australian open' order by winner_rank_points desc limit 1;<|endoftext|>",
 '<|schema|>table employee, columns = [*,employee_id,name,age,city]\ntable evaluation, columns = [*,employee_id,year_awarded,bonus]\ntable hiring, columns = [*,shop_id,employee_id,start_from,is_full_time]\ntable shop, columns = [*,shop_id,name,location,district,number_products,manager_name]\nforeign_keys = [employee.employee_id,shop.shop_id,hiring.employee_id,evaluation.employee_id]\n\nprimary_keys = [hiring.employee_id = employee.employee_id,hiring.shop_id = shop.shop_id,evaluation.employee_id = employee.employee_id]<|endoftext|><|query|>find the name of the employee who got the highest one time bonus.<|endoftext|><|sql|>select t1.name from employee as t1 join evaluation as t2 on t1.employee_id  =  t2.employee_id order by t2.bonus desc limit 1;<|endoftext|>',
 "<|schema|>table has_pet, columns = [*,stuid,petid]\ntable pets, columns = [*,petid,pettype,pet_age,weight]\ntable student, columns = [*,stuid,lname,fname,age,sex,major,advisor,city_code]\nforeign_keys = [student.stuid,pets.petid]\n\nprimary_keys = [has_pet.stuid = student.stuid,has_pet.petid = pets.petid]<|endoftext|><|query|>how many dog pets are raised by female students?<|endoftext|><|sql|>select count(*) from student as t1 join has_pet as t2 on t1.stuid  =  t2.stuid join pets as t3 on t2.petid  =  t3.petid where t1.sex  =  'f' and t3.pettype  =  'dog';<|endoftext|>",
 '<|schema|>table course, columns = [*,course_id,staring_date,course]\ntable course_arrange, columns = [*,course_id,teacher_id,grade]\ntable teacher, columns = [*,teacher_id,name,age,hometown]\nforeign_keys = [course.course_id,teacher.teacher_id,course_arrange.course_id]\n\nprimary_keys = [course_arrange.teacher_id = teacher.teacher_id,course_arrange.course_id = course.course_id]<|endoftext|><|query|>what is the most commmon hometowns for teachers?<|endoftext|><|sql|>select hometown from teacher group by hometown order by count(*) desc limit 1;<|endoftext|>',
 '<|schema|>table friend, columns = [*,student_id,friend_id]\ntable highschooler, columns = [*,id,name,grade]\ntable likes, columns = [*,student_id,liked_id]\nforeign_keys = [highschooler.id,friend.student_id,likes.student_id]\n\nprimary_keys = [friend.friend_id = highschooler.id,friend.student_id = highschooler.id,likes.student_id = highschooler.id,likes.liked_id = highschooler.id]<|endoftext|><|query|>show ids of all students who do not have any friends.<|endoftext|><|sql|>select id from highschooler except select student_id from friend;<|endoftext|>',
 '<|schema|>table friend, columns = [*,student_id,friend_id]\ntable highschooler, columns = [*,id,name,grade]\ntable likes, columns = [*,student_id,liked_id]\nforeign_keys = [highschooler.id,friend.student_id,likes.student_id]\n\nprimary_keys = [friend.friend_id = highschooler.id,friend.student_id = highschooler.id,likes.student_id = highschooler.id,likes.liked_id = highschooler.id]<|endoftext|><|query|>show name of all students who have some friends and also are liked by someone else.<|endoftext|><|sql|>select t2.name from friend as t1 join highschooler as t2 on t1.student_id  =  t2.id intersect select t2.name from likes as t1 join highschooler as t2 on t1.liked_id  =  t2.id;<|endoftext|>',
 '<|schema|>table friend, columns = [*,student_id,friend_id]\ntable highschooler, columns = [*,id,name,grade]\ntable likes, columns = [*,student_id,liked_id]\nforeign_keys = [highschooler.id,friend.student_id,likes.student_id]\n\nprimary_keys = [friend.friend_id = highschooler.id,friend.student_id = highschooler.id,likes.student_id = highschooler.id,likes.liked_id = highschooler.id]<|endoftext|><|query|>what are the ids of students who both have friends and are liked?<|endoftext|><|sql|>select student_id from friend intersect select liked_id from likes;<|endoftext|>',
 '<|schema|>table people, columns = [*,people_id,nationality,name,birth_date,height]\ntable poker_player, columns = [*,poker_player_id,people_id,final_table_made,best_finish,money_rank,earnings]\nforeign_keys = [poker_player.poker_player_id,people.people_id]\n\nprimary_keys = [poker_player.people_id = people.people_id]<|endoftext|><|query|>give the nationality that is most common across all people.<|endoftext|><|sql|>select nationality from people group by nationality order by count(*) desc limit 1;<|endoftext|>',
 "<|schema|>table employee, columns = [*,employee_id,name,age,city]\ntable evaluation, columns = [*,employee_id,year_awarded,bonus]\ntable hiring, columns = [*,shop_id,employee_id,start_from,is_full_time]\ntable shop, columns = [*,shop_id,name,location,district,number_products,manager_name]\nforeign_keys = [employee.employee_id,shop.shop_id,hiring.employee_id,evaluation.employee_id]\n\nprimary_keys = [hiring.employee_id = employee.employee_id,hiring.shop_id = shop.shop_id,evaluation.employee_id = employee.employee_id]<|endoftext|><|query|>which shops' number products is above the average? give me the shop names.<|endoftext|><|sql|>select name from shop where number_products  >  (select avg(number_products) from shop);<|endoftext|>"]