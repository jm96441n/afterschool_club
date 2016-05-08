class WelcomeController < ApplicationController

  def index
    current_user = 1
    @programs = Program.all.limit(20)
    @user_programs = Favorite.where(user_id: current_user)
    @favorites = Favorite.where(user_id: current_user)
  end

end
