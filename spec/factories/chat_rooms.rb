FactoryGirl.define do
  factory :chat_room do
    sequence(:title)  { |n| "Chat #{n}" }
    user
  end

  factory :invalid_chat_room, parent: :chat_room do
    title nil
  end
end