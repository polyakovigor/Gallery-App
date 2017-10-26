FactoryBot.define do
  factory :user do
    first_name Faker::Name.first_name
    second_name Faker::Name.last_name
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.current
  end
end
