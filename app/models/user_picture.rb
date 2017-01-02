class UserPicture < ActiveRecord::Base
  belongs_to :user
  mount_uploader :user_pic, PictureUploader
end
