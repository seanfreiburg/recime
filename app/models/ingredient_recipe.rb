class IngredientRecipe < ActiveRecord::Base
  attr_accessible :amount, :ingredient_id, :recipe_id
  belongs_to :ingredient
  belongs_to :recipe
end
