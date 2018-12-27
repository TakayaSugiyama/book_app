class Post < ApplicationRecord
    validates :user_id,{presence: true}
    validates :content, {presence: true}
end
