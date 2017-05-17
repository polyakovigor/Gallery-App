FactoryGirl.define do
  factory :user do
    first_name 'First'
    second_name 'Second'
    email 'user@example.com'
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
  end
end