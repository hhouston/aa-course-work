class UsersController < ApplicationController
  before_action :redirect_logged_in_user, only: [:create, :new]

  def new
    render :new
  end

  def create

    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to subs_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def redirect_logged_in_user
    redirect_to subs_url if logged_in?
  end
end
