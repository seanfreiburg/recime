class IngredientRecipesController < ApplicationController
  def destroy
    @recipe = Recipe.find_by_id(params[:id])
    @ingredient_recipe = @recipe.ingredient_recipes.find_by_ingredient_id(params[:ingredient_id])
    @ingredient_recipe.destroy
    redirect_to @recipe
  end
end
