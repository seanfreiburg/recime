class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  
  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.paginate(page: params[:page])
    @ingredients = @user.ingredients
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Recime!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    #@user = User.find(params[:id])
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end

  def update
    #@user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
   end


  def recipes_possible
    @ings = current_user.ingredients.all(:joins => [:ingredient_recipes])
    @recipes_list = Recipe.all
    @recipes = Array.new
    for ing in @ings
      for recipe in @recipes_list
        if recipe.ingredients.include?(ing)
          for ring in recipe.ingredients
            if @ings.include?(ring)
              @recipes.append(recipe)
            end
          end

        end
      end
    end

    @recipes = @recipes.uniq
  end

  def recipes_exp
    @ings = current_user.ingredients.all(:joins => [:ingredient_recipes], :order => "exp_date ASC")
    @recipes_list = Recipe.all
    @recipes = Array.new
    for ing in @ings
      for recipe in @recipes_list
        if recipe.ingredients.include?(ing)
          for ring in recipe.ingredients
            if @ings.include?(ring)
              @recipes.append(recipe)
            end
          end
        end
      end
    end
    @recipes = @recipes.uniq


  end



  private


  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
