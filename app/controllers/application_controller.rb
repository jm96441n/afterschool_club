class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in
    @current_user != nil
  end

  private

  def require_current_user
    unless current_user
      flash[:alert] = "You must be logged in to access this page"
      redirect_to root_path
    end
  end
end
