class Program < ActiveRecord::Base
	before_create :set_initial_approval


	# validates :existing, presence: true


	def set_initial_approval
		if self.existing == true
			self.approved == true
		else
			self.approved == false
		end
	end

end
