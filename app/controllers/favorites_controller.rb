class FavoritesController < ApplicationController

  def create
    program = Program.find_by(organization: params["organization"].strip)
    favorite = Favorite.new(user_id: current_user.id, program_id: program.id)
    if request.xhr?
      if favorite.save
        render json: favorite
      else
        render status: 500
      end
    else
      if favorite.save
        redirect :back
      else
        flash[:alert] = "Error: favorite could not be saved"
        redirect :back
      end
    end
  end

  def destroy
    program = Program.find_by(organization: params["organization"].strip)
    favorite = Favorite.find_by(user_id: current_user.id, program_id: program.id)
    favorite.destroy
    if request.xhr?
      render json: program
    else
      redirect :back
    end
  end

end
