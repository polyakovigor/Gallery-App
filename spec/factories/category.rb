FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Category name #{n}" }
  end
end
