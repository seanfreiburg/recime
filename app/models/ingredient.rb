class Ingredient < ActiveRecord::Base
  attr_accessible :name, :picture


  has_many :users, :through => :ingredient_users
  has_many :ingredient_users, dependent: :destroy

  has_many :recipes, :through => :ingredient_recipes
  has_many :ingredient_recipes, dependent:  :destroy

  has_many :shopping_lists, :through => :ingredient_shopping_lists
  has_many :ingredient_shopping_lists
end
