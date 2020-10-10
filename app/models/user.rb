# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }

  def palindrome
    strAry = name.split(//)
    strAry.reverse!.join
  end
end
