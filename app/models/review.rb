class Review < ActiveRecord::Base
  attr_accessible :description, :rating, :recipe_id

  validates_inclusion_of :rating, :in => 1..5, :message => "can only be between 0 and 5."

  belongs_to :recipe
end
