class IngredientUsersController < ApplicationController


  def destroy
    current_user.ingredient_users.find_by_ingredient_id(params[:id]).destroy()
    redirect_to root_url
  end
end
