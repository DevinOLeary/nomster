class PlacesController < ApplicationController
  def index
    @places = Place.all
    @places = Place.order("name").page(params[:page]).per(3)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to root_path
    else
      flash.now[:error] = 'We need more information.'
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description)
  end
end
