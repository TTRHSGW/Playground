class Todo < ApplicationRecord
  validates :content, presence: true
  belongs_to :project
end
