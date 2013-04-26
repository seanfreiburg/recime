# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def image_search(name)

  agent = Mechanize.new
  agent.log = Logger.new "mech.log"



  agent.redirect_ok = false
  page = agent.get "http://www.google.com/imghp?hl=en&tab=ii"
  search_form = page.form_with :name => "f"
  query = name
  search_form.field_with(:name => "q").value = query

  search_results = agent.submit search_form
  results = search_results.parser.xpath("//a/@href").to_html
  offset = 0
  while true
    index_of_keyword = results.index("imgurl",offset)
    if index_of_keyword == nil
      break
    end
    start_of_url=index_of_keyword+7
    offset = start_of_url
    url = ""
    while results[start_of_url] != '&'
      url = url + results[start_of_url]
      start_of_url = start_of_url+1
      if results[start_of_url] == '%' && (results.index(".jpg",offset) + 4) == start_of_url
        break
      end
    end
    begin
      page = agent.get url
      if page.code.to_s.chomp == "200"
        return url
      end
    rescue
    end
  end
end

User.create( email: 'frycicle@gmail.com', name: 'Sean Freiburg', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'clopez2732@gmail.com', name: 'Christina Lopez', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'haugerbr@gmail.com', name: 'Brian Hauger', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'freiburg23@gmail.com', name: 'Ryan Freiburg', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'parkers5@adams.net', name: 'Julie Parker', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'bill@gmail.com', name: 'Bill', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'bob@gmail.com', name: 'Bob', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'will@gmail.com', name: 'Will', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'mary@gmail.com', name: 'Mary', password: 'blah1234', password_confirmation:'blah1234')
User.create( email: 'knsofor@gmail.com', name: 'Kenny', password: 'awesome', password_confirmation:'awesome')
User.create( email: 'knsofor@gmail.com', name: 'Kenny', password: 'awesome', password_confirmation:'awesome')
User.create( email: 'c23mtz@gmail.com', name: 'Cesar Martinez', password: 'cvmpass', password_confirmation: 'cvmpass')


Ingredient.create(name:'Banana', picture: image_search('Banana') )
Ingredient.create(name:'Sugar', picture: image_search('Sugar') )
Ingredient.create(name:'Water', picture: image_search('Water') )
Ingredient.create(name:'Flour', picture: image_search('Flour') )
Ingredient.create(name:'Apple', picture: image_search('Apple') )
Ingredient.create(name:'Butter', picture: image_search('Butter') )
Ingredient.create(name:'Vegetable Oil', picture: image_search('Vegetable Oil') )
Ingredient.create(name:'Cheese', picture: image_search('Cheese') )



@users = User.all
@ingredients = Ingredient.all


for user in @users
  for ingredient in @ingredients
    IngredientUser.new(:user_id => user.id, :ingredient_id => ingredient.id, :amount => rand(1..10), :exp_date => Date.today + rand(1..45))
  end
end









