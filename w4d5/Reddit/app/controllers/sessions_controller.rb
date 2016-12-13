class SessionsController < ApplicationController
  before_action :redirect_logged_in_user, only: [:create, :new]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:email],
      session_params[:password]
    )

    if @user
      login!(@user)
      redirect_to subs_url
    else
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

  def redirect_logged_in_user
    redirect_to subs_url if logged_in?
  end
end
