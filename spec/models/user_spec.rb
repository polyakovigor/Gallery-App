require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  it 'is composed of first and last name' do
    expect(user.full_name).to eql('First Second')
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  describe 'User associations' do
    it { expect(user).to have_many(:categories) }
    it { expect(user).to have_many(:images).through(:categories) }
    it { expect(user).to have_many(:images) }
    it { expect(user).to have_many(:comments) }
    it { expect(user).to have_many(:chat_rooms) }
    it { expect(user).to have_many(:messages) }
    it { expect(user).to have_many(:likes) }
    it { expect(user).to have_many(:events) }
  end

  describe 'User validations' do
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:second_name) }
    it { expect(user).to validate_length_of(:first_name).is_at_most(50) }
    it { expect(user).to validate_length_of(:second_name).is_at_most(50) }
  end
end