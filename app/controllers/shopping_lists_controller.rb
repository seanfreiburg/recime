class ShoppingListsController < ApplicationController

  before_filter :signed_in_user, only: [ :create, :destroy ]
  before_filter :correct_user, only: :destroy


  def index

  end

  def show
    @shopping_list = ShoppingList.find_by_id(params[:id])
  end

  def create
    @shopping_list = current_user.shopping_lists.build(params[:shopping_list])
    if @shopping_list.save
      flash[:success] = "Shopping List created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @shopping_list.destroy
    redirect_to root_url

  end

  private

  def correct_user
    @shopping_list = current_user.shopping_lists.find_by_id(params[:id])
    redirect_to root_url if @recipe.nil?
  end
end
