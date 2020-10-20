FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
