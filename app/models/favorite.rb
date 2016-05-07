class Favorite < ActiveRecord::Base
  validates :user, presence: true
  validates :program, presence: true
end
