class AddUserImageNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:user_image_name,:string
  end
end
