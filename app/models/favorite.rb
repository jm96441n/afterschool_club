class Favorite < ActiveRecord::Base
  validates :user, presence: true
  validates :program, presence: true

  has_many :users
  has_many :programs
  
end
