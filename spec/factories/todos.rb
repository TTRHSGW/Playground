FactoryBot.define do
  factory :todo do
    sequence(:content) { |n| "Content#{n}" }
    done { false }
    association :project
  end
end
