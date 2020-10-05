class Book < ApplicationRecord
  validates :date_of_publication, presence: true
  validates :title, presence: true
end
