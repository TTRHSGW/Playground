class Project < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6 }, uniqueness: true
end
