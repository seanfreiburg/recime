class Recipe < ActiveRecord::Base
  attr_accessible :description, :name, :prep_time

  belongs_to :user
  validates :user_id, presence: true
end
