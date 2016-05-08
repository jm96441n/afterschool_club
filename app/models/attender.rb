class Attender < ActiveRecord::Base
	validates :user, presence: true
	validates :program, presence: true

	belongs_to :user
	belongs_to :program
end
