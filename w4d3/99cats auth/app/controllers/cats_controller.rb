class CatsController < ApplicationController
  before_action :set_cat,  only: [:edit, :update, :show]
  before_action :check_owner, only: [:edit, :update]

  def index
    @cats = Cat.all
    render :index
  end

  def show
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user_id = current_user.id

    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def check_owner
    @cat.user_id == current_user.id
  end


  def cat_params
    params.require(:cat)
      .permit(:age, :birth_date, :color, :description, :name, :sex)
  end
end
