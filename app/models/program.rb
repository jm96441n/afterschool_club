class Program < ActiveRecord::Base

	validates :existing, :address, :description, presence: true

end
