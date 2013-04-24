class IngredientShoppingListsController < ApplicationController
  def destroy
    list = ShoppingList.find_by_id(params[:id])
    list.ingredient_shopping_lists.find_by_ingredient_id(params[:ingredient_id]).destroy()
    redirect_to list
  end
end
