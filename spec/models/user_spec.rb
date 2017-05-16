require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  it 'is composed of first and last name' do
    expect(user.full_name).to eql('First Second')
  end

  it 'is valid with valid attributes' do
    expect(user).to be_valid
  end

  it 'is invalid with blank attributes' do
    expect(User.create( first_name: '', second_name: '' )).not_to be_valid
  end

  describe 'model associations' do
    it { expect(user).to have_many(:categories) }
    # it { expect(user).to have_many(:images)}
    # it { expect(user).to have_many(:comments) }
    # it { expect(user).to have_many(:chat_rooms) }
    # it { expect(user).to have_many(:messages) }
    # it { expect(user).to have_many(:likes) }
    # it { expect(user).to have_many(:events) }
  end
end