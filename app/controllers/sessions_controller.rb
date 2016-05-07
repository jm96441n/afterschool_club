class SessionsController < ApplicationController
  skip_before_action :require_current_user, only: [:new, :create, :oauth_create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
    else
      flash[:alert] = "Incorrect email or password"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
