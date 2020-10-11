FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Name#{n}" }
    sequence(:password) { |n| "password#{n}" }
  end
end
