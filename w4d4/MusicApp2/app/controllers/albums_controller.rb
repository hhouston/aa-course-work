class AlbumsController < ApplicationController
  # before_action :set_album
  def new
    render :new
  end

  def show
    render :show
  end

end
