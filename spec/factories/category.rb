FactoryBot.define do
  factory :category do
    user
    sequence(:name) { |n| "Name#{n}" }
  end

  factory :invalid_category, parent: :category do
    name nil
  end
end
