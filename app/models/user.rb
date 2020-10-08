class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }
  has_many :books, through: :user_books
  has_many :user_books, dependent: :destroy
  has_secure_password
end
