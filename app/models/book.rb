class Book < ApplicationRecord
  validates :date_of_publication, presence: true
  validates :title, presence: true
  has_many :users, through: :user_books
  has_many :user_books
end
