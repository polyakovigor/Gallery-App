FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Category name #{n}" }
  end

  factory :image do
    sequence(:title) { |n| "Image title#{n}" }
    # picture { fixture_file_upload(Rails.root.join('spec/fixtures/test.png'), 'image/png') }
  end
end
