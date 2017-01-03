class CreateUserPictures < ActiveRecord::Migration
  def change
    create_table :user_pictures do |t|
      t.string :user_pic
      t.integer :user_id
      t.timestamps
    end
  end
end
