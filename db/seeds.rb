# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create( email: 'frycicle@gmail.com', name: 'Sean Freiburg', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'clopez2732@gmail.com', name: 'Christina Lopez', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'haugerbr@gmail.com', name: 'Brian Hauger', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'freiburg23@gmail.com', name: 'Ryan Freiburg', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'parkers5@adams.net', name: 'Julie Parker', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'bill@gmail.com', name: 'Bill', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'bob@gmail.com', name: 'Bob', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'will@gmail.com', name: 'Will', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'mary@gmail.com', name: 'Mary', password: 'blah1234', password_confirmation:'blah1234')

@users = User.all

for user in @users

end




