class PlacesController < ApplicationController
  def index
    @places = Place.all
    @users = Place.order(:name).page params[:page]
  end

  def new
    @place = Place.new
  end

  def create

  end
end
