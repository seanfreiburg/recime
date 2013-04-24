class Review < ActiveRecord::Base
  attr_accessible :description, :rating, :recipe_id

  belongs_to :recipe
end
