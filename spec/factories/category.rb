FactoryGirl.define do
  factory :category do
    user
    name 'Category'
  end

  factory :invalid_category, parent: :category do
    name nil
  end
end
