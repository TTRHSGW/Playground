FactoryBot.define do
  factory :project do
    sequence(:title) { |n| "Title#{n}" }
  end
end
