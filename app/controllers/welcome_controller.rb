class WelcomeController < ApplicationController

  def index
    @programs = Program.where(existing: true).limit(20)
    # @programs = Program.where(existing: true).page(1).per(3)
    if current_user
      if current_user.role == 'student'
        @user_programs_attending = Attender.where(user_id: current_user.id).map{ |attender| Program.find(attender.program_id) }
        @favorites = current_user.favorite_programs
        @user_programs = Program.where(existing: false, approval: 'approved').limit(20)
        @classmate_programs = Program.where(existing: true).limit(20)
      elsif current_user.role == 'teacher'
        @favorites = Favorite.all.map{ |favorite| Program.find(favorite.program_id) }
        submissions = UserProgram.all.map{ |program| program.program_id }.compact.uniq
        @submitted_programs = submissions.map{ |id| Program.find(id) }
      elsif current_user.role == 'parent'
        @favorites = Favorite.all.map{ |favorite| Program.find(favorite.program_id) }
        @submitted_programs = UserProgram.all.map{ |program| Program.find(program.program_id) }
      end
    end
  end

end
