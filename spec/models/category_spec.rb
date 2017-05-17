require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category) { FactoryGirl.create(:category, user: create(:user)) }

  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  describe 'Category associations' do
    it { expect(category).to belong_to(:user)}
    it { expect(category).to have_many(:images)}
  end

  describe 'Category validations' do
    it { expect(category).to validate_presence_of(:user) }
    it { expect(category).to validate_presence_of(:name) }
    it { expect(category).to validate_length_of(:name).is_at_most(10) }
    it { expect(category).to validate_uniqueness_of(:name) }
  end

end