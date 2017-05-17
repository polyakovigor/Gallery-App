FactoryGirl.define do
  factory :comment do
    body 'body text'
    user
    image
    created_at Time.now
  end
end
