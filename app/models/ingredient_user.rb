class IngredientUser < ActiveRecord::Base
  attr_accessible :amount, :ingredient_id, :user_id

  belongs_to :ingredient
  belongs_to :user
end
