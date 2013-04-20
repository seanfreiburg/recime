class StaticPagesController < ApplicationController
  def home
    if signed_in?
      #@micropost = current_user.microposts.build
      @recipe = current_user.recipes.build
      @shopping_list = current_user.shopping_lists.build
      @recipes = current_user.recipes.all
      @shopping_lists = current_user.shopping_lists.all
    end
  end

  def help
  end

  def about

  end

  def contact

  end
end
