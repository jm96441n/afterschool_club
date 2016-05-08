class Program < ActiveRecord::Base
	before_create :set_initial_approval

	has_many :programtags

	validates :existing, presence: true
	validates :address, presence: true

	def set_initial_approval
		if self.existing == true
			self.approved == true
		else
			self.approved == false
		end
	end

end
