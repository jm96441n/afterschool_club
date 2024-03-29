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
      redirect_to :root
    else
      flash[:alert] = "Please try again"
      render :root
    end
  end

  def students
    @students = User.where("role = ?", "student")
    @students
  end

  def show
    @student = User.find(params[:id])
  end

  def logout
    session.destroy
    render :'welcome/index'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :category, :password)
  end

end
