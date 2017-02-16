class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user! @user
      redirect_to music_url
    else
      flash[:errors] = @user.errors.full_message
      render :new
    end
  end

  def show

  end

  def destroy
  end



  private
  def users_params
    params.require(:users).permit(:email, :password)

  end
end
