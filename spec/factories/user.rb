include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com"}
    password 'password'
    password_confirmation 'password'
    confirmed_at Date.today
  end
end