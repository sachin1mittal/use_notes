class ApplicationController < ActionController::Base

  include Concerns::ErrorHandler

  def authenticate_user!
    if !current_user
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  rescue
    nil
  end
end
