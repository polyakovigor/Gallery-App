FactoryGirl.define do
  factory :event do
    user
    action 'Visit'
    url 'http://SomeURL'
  end
end