class SubsController < ApplicationController

  before_action :check_mod?, only: [:edit, :update]

  def check_mod?
    @sub = Sub.find(params[:id])
    unless current_user.id == @sub.moderator.id
      redirect_to sub_url(@sub)
    end
  end

  def new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      render :edit
    end
  end

  def sub_params
    params.require(:sub).permit(:title, :description, :user_id)
  end
end
