# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Get the current DB connection
connection = ActiveRecord::Base.connection();
connection.execute("Insert INTO events_lecturers (event_id, lecturer_id) VALUES
    (1, 1),
    (1, 2),
    (1, 3);")

lecturers = 
Lecturer.create(
				[
					{ name: 'Nuno', country: 'Portugal', homepage: 'nuno.fct.pt', title: 'Sr.', resume: 'Rails dev' }, 
					{ name: 'Potter', country: 'Portugal', homepage: 'potter.fct.pt', title: 'Sr.', resume: 'Android dev' },
					{ name: 'Felipe', country: 'Portugal', homepage: 'felipe.fct.pt', title: 'Sr.', resume: 'Android dev' }
				]
				)
				
conferences =
Conference.create(
				 [
					{name:'Inforum 2015', begin:'2015-06-06 15:30', end:'2015-06-06 16:30', location:'Castelo Branco', logo:'inf2015.jpg'},
					{name:'IEEE 2014', begin:'2015-06-06 15:30', end:'2015-06-06 16:30', location:'Beja', logo:'inf2014.jpg'},
					{name:'ICFIE 2013', begin:'2013-06-22 03:23:00', end:'2013-06-23 03:23:00', location:'Kanyakumari, India', logo:'icfie13.jpg'}

				 ]
				 )
				 
events =
Event.create(
			[
				{name:'Coffee', room:'', begin:'2013-06-22 03:23:00', end:'2013-06-22 03:23:00', conference_id:'3'}
			]
			)	 
			
			
news =
News.create(
			[
				{title:'Its started!!!', body:' A conferencia ICFIE 2013 esta prestes a comecar.', conference_id:'3'}
			
			]
			)
			

				
				

users =
User.create(
			[
			{email:'nralves@campu.fct.unl.pt', password:'1234', title:'', name:'Nuno Alves', organization:'FCT-UNL', homepage:'nuno.fct.unl.pt', photo: 'me.jpg'}
			]
			)