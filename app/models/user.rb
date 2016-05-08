class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, :last_name, presence: true, length: {minimum: 2, maximum: 30}
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: { case_sensitive: false }

  has_many :user_programs
  has_many :programs, through: :user_programs

	def is_teacher?
		category == 'teacher'
	end

	def is_student?
		category == 'student'
	end

	def is_parent?
		category == 'parent'
	end

end