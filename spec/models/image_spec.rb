require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:image) { FactoryGirl.create(:image, category: create(:category)) }

  it 'is valid with valid attributes' do
    expect(image).to be_valid
  end

  describe 'Image associations' do
    it { expect(image).to belong_to(:category)}
    it { expect(image).to have_many(:likes).dependent(:destroy)}
    it { expect(image).to have_many(:comments).dependent(:destroy)}
  end

  describe 'Image validations' do
    it { expect(image).to validate_presence_of(:title) }
    it { expect(image).to validate_presence_of(:picture) }
    it { expect(image).to validate_presence_of(:category) }
    it { expect(image).to validate_length_of(:title).is_at_most(20) }
  end

end