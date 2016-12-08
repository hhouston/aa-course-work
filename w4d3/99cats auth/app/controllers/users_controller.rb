class UsersController < ApplicationController
  before_action :redirect_user

  def new
    render :new
  end

  def create
    user = User.new(user_params)

    if user.save
      login_user!(user)
      flash[:messages] = "You signed up!"
      redirect_to cats_url
    else
      flash.now[:messages] = user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

  def redirect_user
    redirect_to cats_url if current_user
  end
end
