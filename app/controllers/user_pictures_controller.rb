class UserPicturesController < ApplicationController
  before_action :authenticate_user!
  def create
    @user = User.find(params[:user_id])
    @user.user_picture.create(pic_params)
    redirect_to user_path(@user)
  end

  private

  def pic_params
    params.require(:user_picture).permit(:user_pic)
  end
end
