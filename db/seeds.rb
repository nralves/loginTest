# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#encoding: utf-8 

users =
User.create(
			[
			{email:'nralves@campus.fct.unl.pt', password:'1234', title:'', name:'Nuno Alves', organization:'FCT-UNL', homepage:'nuno.fct.unl.pt', photo: 'me.jpg'},
			{email:'joaquim@gmail.com', password:'1234', title:'', name:'Joaquim Gonzalez', organization:'Catalunha', homepage:'joaquim.cat.es', photo: 'me.jpg'},
			{email:'maria_albertina@hotmail.com', password:'1234', title:'', name:'Maria Albertina', organization:'NSA', homepage:'ma.nsa.com', photo: 'me.jpg'}
			]
			)