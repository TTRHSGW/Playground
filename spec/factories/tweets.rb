FactoryBot.define do
  factory :tweet do
    sequence(:content) { |n| "MyString#{n}" }
    user { nil }
  end
end
