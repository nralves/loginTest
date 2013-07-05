# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#encoding: utf-8 


	#Conference.create({name:'Inforum 2013', begin:'21-09-2013 09:00', end:'24-09-2013 23:00', location:'Orlando,Florida', logo: File.open(Rails.root.join('CSVs/resources/users/logoInf.gif'))})
	Conference.create({name:'Inforum 2013', begin:'21-09-2013 09:00', end:'24-09-2013 23:00', location:'Orlando,Florida', logo: 'logoInf.gif'})

user1 =
User.create(
			{email:'nralves@campus.fct.unl.pt', password:'1234', title:'', name:'Nuno Alves', organization:'FCT-UNL', homepage:'nuno.fct.unl.pt', photo: File.open(Rails.root.join('CSVs/resources/users/nuno.jpg'))}
			#{email:'nralves@campus.fct.unl.pt', password:'1234', title:'', name:'Nuno Alves', organization:'FCT-UNL', homepage:'nuno.fct.unl.pt', photo: 'nuno.jpg'}
)
			
user2 =
User.create(
			{email:'jribeiro@gmail.com', password:'1234', title:'Std.', name:'Joao Ribeiro', organization:'FCT/UNL', homepage:'jrib.fct.pt', photo: File.open(Rails.root.join('CSVs/resources/users/potter.png'))}
			#{email:'jribeiro@gmail.com', password:'1234', title:'Std.', name:'Joao Ribeiro', organization:'FCT/UNL', homepage:'jrib.fct.pt', photo: 'me.jpg'}

)

user3 =
User.create(
			{email:'maria_albertina@hotmail.com', password:'1234', title:'', name:'Maria Albertina', organization:'NSA', homepage:'ma.nsa.com', photo: File.open(Rails.root.join('CSVs/resources/users/maria-albertina.jpg'))}
			#{email:'maria_albertina@hotmail.com', password:'1234', title:'', name:'Maria Albertina', organization:'NSA', homepage:'ma.nsa.com', photo: 'me.jpg'}
)

user4 =
User.create(
			{email:'a@a.com', password:'1234', title:'Mr.', name:'Ae', organization:'A Ltd.', homepage:'ae.a.com', photo: File.open(Rails.root.join('CSVs/resources/users/rpg.jpg'))}
			#{email:'a@a.com', password:'1234', title:'Mr.', name:'ridiculously photogenic guy', organization:'A Ltd.', homepage:'ae.a.com', photo: 'me.jpg'}
)

user5 =
User.create(
			{email:'filipe@campus.fct.unl.pt.com', password:'1234', title:'Std.', name:'Filipe', organization:'FCT/UNL', homepage:'filipe.fct.com', photo: File.open(Rails.root.join('CSVs/resources/users/filipe.png'))}
			#{email:'filipe@campus.fct.unl.pt.com', password:'1234', title:'Std.', name:'Filipe', organization:'FCT/UNL', homepage:'filipe.fct.com', photo: 'me.jpg'}
)

user6 =
User.create(
			{email:'rapouso.foxhound.com', password:'1234', title:'Std.', name:'Luigi Fox', organization:'NSA', homepage:'ra.nsa.com', photo: File.open(Rails.root.join('CSVs/resources/users/god.png'))}
			#{email:'admin@cb.com', password:'1234', title:'Almighty', name:'Administrator', organization:'Conference Buddy', homepage:'super.admin_homepage.com', photo: 'me.jpg'}
)

#Contacts creation
friendship = user1.friendships.create(:friend_id => user2.id)
friendship.friend.friendships.create(:friend_id => user1.id)

friendship = user1.friendships.create(:friend_id => user3.id)
friendship.friend.friendships.create(:friend_id => user1.id)

user1.requests.create(:requester_id=> user5.id)
user4.requests.create(:requester_id=> user5.id)

#Emails
user1.emails.create(:email => user1.email, :activation=> "", :confirmed => true)
user2.emails.create(:email => user2.email, :activation=> "", :confirmed => true)
user3.emails.create(:email => user3.email, :activation=> "", :confirmed => true)
user4.emails.create(:email => user4.email, :activation=> "", :confirmed => true)

