# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#encoding: utf-8 

user1 =
User.create(
			{email:'nralves@campus.fct.unl.pt', password:'1234', title:'', name:'Nuno Alves', organization:'FCT-UNL', homepage:'nuno.fct.unl.pt', photo: File.open(Rails.root.join('CSVs/resources/users/nuno.png'))}
			#{email:'nralves@campus.fct.unl.pt', password:'1234', title:'', name:'Nuno Alves', organization:'FCT-UNL', homepage:'nuno.fct.unl.pt', photo: 'nuno.png'}
)
			
user2 =
User.create(
			{email:'joaquim@gmail.com', password:'1234', title:'', name:'Joaquim Gonzalez', organization:'Catalunha', homepage:'joaquim.cat.es', photo: File.open(Rails.root.join('CSVs/resources/users/potter.jpg'))}
			#{email:'joaquim@gmail.com', password:'1234', title:'', name:'Joaquim Gonzalez', organization:'Catalunha', homepage:'joaquim.cat.es', photo: 'me.jpg'}

)

user3 =
User.create(
			{email:'maria_albertina@hotmail.com', password:'1234', title:'', name:'Maria Albertina', organization:'NSA', homepage:'ma.nsa.com', photo: File.open(Rails.root.join('CSVs/resources/users/maria-albertina.jpg'))}
			#{email:'maria_albertina@hotmail.com', password:'1234', title:'', name:'Maria Albertina', organization:'NSA', homepage:'ma.nsa.com', photo: 'me.jpg'}
)

user4 =
User.create(
			{email:'a@a.com', password:'1234', title:'Mr.', name:'Ae', organization:'A Ltd.', homepage:'ae.a.com', photo: File.open(Rails.root.join('CSVs/resources/users/rpg.jpg'))}
			#{email:'a@a.com', password:'1234', title:'Mr.', name:'Ae', organization:'A Ltd.', homepage:'ae.a.com', photo: 'me.jpg'}
)

user5 =
User.create(
{email:'rapouso.foxhound.com', password:'1234', title:'Std.', name:'Luigi Fox', organization:'NSA', homepage:'ra.nsa.com', photo: File.open(Rails.root.join('CSVs/resources/users/filipe.jpg'))}
#{email:'rapouso.foxhound.com', password:'1234', title:'Std.', name:'Luigi Fox', organization:'NSA', homepage:'ra.nsa.com', photo: 'me.jpg'}
)

#Contacts creation
friendship = user1.friendships.create(:friend_id => user2.id)
friendship.friend.friendships.create(:friend_id => user1.id)

friendship = user1.friendships.create(:friend_id => user3.id)
friendship.friend.friendships.create(:friend_id => user1.id)

friendship = user1.friendships.create(:friend_id => user4.id)
friendship.friend.friendships.create(:friend_id => user1.id)

#Contact email
user1.emails.create(:email => user1.email, :activation=> "", :confirmed => true)
user2.emails.create(:email => user2.email, :activation=> 1, :confirmed => false)
user3.emails.create(:email => user3.email, :activation=> "", :confirmed => true)
user4.emails.create(:email => user4.email, :activation=> "", :confirmed => true)

