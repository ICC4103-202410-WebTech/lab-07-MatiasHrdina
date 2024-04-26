class User < ApplicationRecord
    has_many :posts, dependent: :destroy
  
    validates :name, presence: true
    validates :email, presence: true
    validates :password, presence: true, length: { minimum: 6, message: "Password must be at least 6 characters long" }
end