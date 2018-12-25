class Book < ApplicationRecord
    validates :user_id,{presence: true}
    validates :book_image_name,{presence: true}
    validates :book_title,{presence: true}
end
