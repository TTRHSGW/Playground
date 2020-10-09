# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Username#{n}" }
    sequence(:password) { |n| "Password#{n}" }
  end
end
