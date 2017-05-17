FactoryGirl.define do
  factory :message do
    body 'SomeText'
    user
    chat_room 'Chat'
  end
end