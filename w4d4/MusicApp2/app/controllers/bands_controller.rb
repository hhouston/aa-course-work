class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :destroy, :update]

  def index
    @bands = Band.all
    render :index
  end

  def new
    # @band.new
    p @band
    render :new
  end

  def show
    render :show
  end

  def edit
    render :edit
  end

  def update
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def destroy
    @band.destroy
    # render :index
    redirect_to bands_url
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url(@band)
    else
      render :new
    end
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
