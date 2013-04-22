class IngredientUser < ActiveRecord::Base
  attr_accessible :amount, :ingredient_id, :user_id, :exp_date

  belongs_to :ingredient
  belongs_to :user
end
