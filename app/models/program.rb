class Program < ActiveRecord::Base
	before_create :set_initial_approval

	has_many :user_programs
	has_many :users, through: :user_programs

	validates :existing, presence: true

	def set_initial_approval
		if self.existing == true
			self.approval == 'approved'
		else
			self.approval == 'pending'
		end
	end

	def approve_idea
		if current_user.is_teacher?
			self.approval == 'approved'
		end
	end

	def deny_idea
		if current_user.is_teacher?
			self.approval == 'denied'
		end
	end

end
