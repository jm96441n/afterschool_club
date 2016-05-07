class SessionsController < ApplicationController
  skip_before_action :require_current_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user and @user.authenticate params[:password]
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = "Incorrect email or password"
      redirect_to '/login'
    end
  end

  def destroy
    session.clear
    redirect_to 'root_path'
  end
end
