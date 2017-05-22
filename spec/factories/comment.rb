FactoryGirl.define do
  factory :comment do
    body Faker::Lorem.sentence
    user
    image
    created_at Time.now
  end
end
