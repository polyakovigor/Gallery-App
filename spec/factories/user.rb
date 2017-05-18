FactoryGirl.define do
  factory :user do
    first_name 'First'
    second_name 'Second'
    sequence(:email) {|n| "person#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
  end
end