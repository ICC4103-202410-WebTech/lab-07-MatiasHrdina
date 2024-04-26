class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags
  
    validates :name, presence: { message: "Name can't be blank" }, uniqueness: { message: "Tag name already exists" }
end