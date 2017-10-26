FactoryBot.define do
  factory :comment do
    body Faker::Lorem.sentence
    user
    image
    created_at Time.current
  end
end
