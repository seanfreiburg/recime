class IngredientsController < ApplicationController

  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user, only: :destroy

  def index
  end

  def show
    @ingredient = Ingredient.find_by_id(params[:id])
  end

  def create
    @ingredient = current_user.ingredients.build(params[:ingredient])
    if @ingredient.save
      flash[:success] = "Ingredient created"
      redirect_to root_url

    else
      render 'static_pages/home'
    end
  end

  def new_ingredient_user
    @ingredient = Ingredient.new
  end


  def create_ingredient_user
    @ingredient = Ingredient.new
    @ingredient.name = params[:name]
    @ingredient.picture = params[:picture]
    existing_ingredient = Ingredient.find_by_name(params[:name])
    if !existing_ingredient.nil?
      @ingredient = existing_ingredient
    end
    @ingredient.save
    existing_ingredient_user = IngredientUser.where("ingredient_id = '#{@ingredient.id}' AND user_id = '#{current_user.id}'").first
    @ingredient_user = IngredientUser.new(:user_id => current_user.id, :ingredient_id => @ingredient.id, :amount => params[:amount])
    if !existing_ingredient_user.nil?
      @ingredient_user = existing_ingredient_user
      existing_ingredient_user.amount += params[:amount].to_i
    end
    if @ingredient_user.save
      flash[:success] = "Ingredient created"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to root_url
  end


  private

  def correct_user
    @ingredient = current_user.ingredients.find_by_id(params[:id])
    redirect_to root_url if @ingredient.nil?
  end
end



