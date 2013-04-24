class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find_by_id(params[:id])
    @review = @recipe.reviews.new(:rating => params[:rating], :description => params[:description], :recipe_id => params[:id])
    if @review.save
      flash[:success] = "review created!"
      redirect_to @recipe
    else
      redirect_to @recipe
    end
  end

  def destroy
    @review.destroy
    redirect_to root_url
  end
end
