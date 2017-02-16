class SessionsController < ApplicationController
  # before_action :signed_i

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if user.nil?
      flash.now(:errors) = "Cannot find User. Invalid credentials."
      render :new
    else
      user.reset_session_token!
      session[:session_token] = user.session_token
      log_in_user! user
      redirect_to user_url
    end

  end

  def new
  end

  # def sessions_params
  #   params.require(:sessions).permit([:user], [:password])
  # end
end
