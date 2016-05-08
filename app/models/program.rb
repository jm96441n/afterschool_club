class Program < ActiveRecord::Base
	before_create :set_initial_approval

	has_many :user_programs
	has_many :users, through: :user_programs
	has_many :attenders
	has_many :user_attenders, through: :attenders, source: :user
	has_many :donations

	def set_initial_approval
		if self.existing == true
			self.approval == 'approved'
		else
			self.approval == 'pending'
		end
	end

	def approve_idea
		if current_user.is_teacher?
			self.update(approval:'approved')
		end
	end

	def deny_idea
		if current_user.is_teacher?
			self.update(approval: 'denied')
		end
	end

end
