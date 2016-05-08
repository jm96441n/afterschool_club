class Donation < ActiveRecord::Base
  # validates :user, presence: true
  # validates :program, presence: true
  validates_uniqueness_of :user_id, :scope => :program_id

  belongs_to :user
  belongs_to :program
end
