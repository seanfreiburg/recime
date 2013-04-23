class ShoppingList < ActiveRecord::Base
  attr_accessible :name, :user_id

  belongs_to :user
  validates :user_id, presence: true


  has_many :ingredients, :through => :ingredient_shopping_lists
  has_many :ingredient_shopping_lists
end
