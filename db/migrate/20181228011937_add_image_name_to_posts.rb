class AddImageNameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts,:book_image_name,:string
  end
end
