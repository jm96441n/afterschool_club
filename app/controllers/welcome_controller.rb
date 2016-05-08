class WelcomeController < ApplicationController

  def index
    @programs = Program.where(existing: true).limit(20)
    # @programs = Program.where(existing: true).page(1).per(3)
    if current_user.role == 'student'
      @user_programs_attending = [] #update with new table data about programs user is actually attending
      @favorites = current_user.favorite_programs
      @user_programs = Program.where(existing: false, approval: 'approved').limit(20)
      @classmate_programs = Program.where(existing: true).limit(20)
    elsif current_user.role == 'teacher'

    elsif current_user.role == 'parent'

    end

  end

end
