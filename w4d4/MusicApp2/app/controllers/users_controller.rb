class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
      redirect_to user_url(user)
    else
      #flash
      render :new
    end
  end

  def show
    @user = current_user
    render :show
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
