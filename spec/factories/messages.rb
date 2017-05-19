FactoryGirl.define do
  factory :message do
    body 'SomeText'
    user
  end
end