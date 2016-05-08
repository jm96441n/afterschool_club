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
      @favorites = Program.where(existing:true).limit(20) # teacher should only see programs their students have favorited
      @submitted_programs = Program.where(approval: 'pending')
    elsif current_user.role == 'parent'
      @favorites = Program.where(existing:true).limit(20) # parent should only see programs their children have favorited
      @submitted_programs = Program.where(approval: 'pending')
    end

  end

end
