class SessionsController < ApplicationController
  before_action :redirect_user, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      session_params[:user_name],
      session_params[:password]
    )

    if user
      login_user!(user)
      flash[:messages] = ["welcome"]
      redirect_to cats_url
    else
      flash.now[:messages] = ["invalid user_name/password"]
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  def session_params
    params.require(:user).permit(:user_name, :password)
  end

  def redirect_user
    redirect_to cats_url if current_user
  end
end
