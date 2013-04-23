class IngredientShoppingList < ActiveRecord::Base
  attr_accessible :amount, :ingredient_id, :shopping_list_id

  belongs_to :ingredient
  belongs_to :shopping_list
end
