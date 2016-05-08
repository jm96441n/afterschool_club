class WelcomeController < ApplicationController

  def index
    @programs = Program.where(existing: true).limit(20)
    @favorites = current_user.favorite_programs
    @user_programs = Program.where(existing: false, approval: 'approved').limit(20)
  end

end
