include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :image do
    title 'test'
    picture { fixture_file_upload(Rails.root.join('spec/fixtures/test.jpeg'), 'image/jpeg') }
  end

  factory :invalid_image, parent: :image do
    title nil
    picture nil
  end
end