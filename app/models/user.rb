class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4 }, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password
end
