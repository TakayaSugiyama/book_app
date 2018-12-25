class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :book_title
      t.string :book_image_name

      t.timestamps
    end
  end
end
