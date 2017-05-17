FactoryGirl.define do
  factory :message do
    body 'SomeText'
    user nil
    chat_room nil
  end
end