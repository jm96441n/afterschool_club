class UsersController < ApplicationController
  def new
    @user = User.new
    if request.xhr?
      render "_form", layout: false, locals: {user: @user}
    else
      render "new"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect :root
    else
      flash[:alert] = "Please try again"
    end
  end

  def show

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :category, :password)
  end

end
