class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user

  end

  def log_in_user!(user)
    @current_user = user
    @current_user.reset_session_token!

  end

  def logged_in?(user)
    @current_user == user
  end

end
