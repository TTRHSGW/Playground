FactoryBot.define do
  factory :tweet do
    sequence(:content) { |n| "MyString#{n}" }
    association :user
  end
end
