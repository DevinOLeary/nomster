class PlacesController < ApplicationController
  # Requires a user to be logged in in order to carry out listed
  # processes.
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # View for list of places
  def index
    @places = Place.all
    @places = Place.order("name").page(params[:page]).per(3)
  end
# view for new place form
  def new
    @place = Place.new
  end
# creates new place
  def create
    @place = current_user.place.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      flash.now[:error] = 'We need more information.'
      render :new, status: :unprocessable_entity
    end
  end
# show place when you click on title
  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
  end
# brings up a filled out edit form
  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return render text: "You don't have permission to do this... Who do you think you are?", status: :forbidden
    end
  end
# Updates edited form
  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: "You are not authorized to do this", status: :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
# Deletes place
  def destroy
    @place = Place.find(params[:id])
    if @place.user != current_user
      return render text: "You are not allowed to do this", status: :forbidden
    end
    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description)
  end
end
