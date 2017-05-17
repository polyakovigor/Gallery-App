FactoryGirl.define do
  factory :event do
    user
    action 'Visit SignIn SignOut'
    url 'Some URL'
  end
end