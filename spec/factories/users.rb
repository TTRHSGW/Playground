FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@example.com" }
    sequence(:password) { |n| "password#{n}" }
    sequence(:username) { |n| "Username#{n}" }
  end
end
