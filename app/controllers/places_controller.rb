class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  def index
    @places = Place.all
    @places = Place.order("name").page(params[:page]).per(3)
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.place.create(place_params)
    if @place.save
      redirect_to root_path
    else
      flash.now[:error] = 'We need more information.'
      render :new
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render text: "You don't have permission to do this... Who do you think you are?", status: :forbidden
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: "You are not authorized to do this", status: :forbidden
    end

    @place.update_attributes(place_params)
    redirect_to root_path
    
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description)
  end
end
