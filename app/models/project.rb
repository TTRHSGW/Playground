class Project < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6 }, uniqueness: true

  def date_of_created
    self.created_at.strftime('%Y年%-m月%-d日')
  end

  def date_of_updated
    self.updated_at.strftime('%Y年%-m月%-d日')
  end

end
