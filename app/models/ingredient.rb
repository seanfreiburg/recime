class Ingredient < ActiveRecord::Base
  attr_accessible :name, :picture


  has_many :ingredients, :through => :ingredient_users
  has_many :ingredient_users, dependent: :destroy
end
