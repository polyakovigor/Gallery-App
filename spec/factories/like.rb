FactoryGirl.define do
  factory :like do
    user reference
    image reference
  end
end