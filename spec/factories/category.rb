FactoryGirl.define do
  factory :category do
    name 'category'
  end

  factory :invalid_category, parent: :category do
    name nil
  end
end
