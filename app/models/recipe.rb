class Recipe < ActiveRecord::Base
  attr_accessible :description, :name, :prep_time

  belongs_to :user
  validates :user_id, presence: true


  has_many :ingredients, :through => :ingredient_recipes
  has_many :ingredient_recipes, dependent:  :destroy
  has_many :reviews, dependent: :destroy
end
