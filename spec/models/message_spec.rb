require 'rails_helper'

RSpec.describe Message, type: :model do

  let(:message) { FactoryGirl.create(:message, user: create(:user), chat_room: create(:chat_room)) }

  it 'is valid with valid attributes' do
    expect(message).to be_valid
  end

  describe 'Message associations' do
    it { expect(message).to belong_to(:user) }
    it { expect(message).to belong_to(:chat_room)}
  end

  describe 'Message validations' do
    it { expect(message).to validate_presence_of(:user) }
    it { expect(message).to validate_presence_of(:body) }
    it { expect(message).to validate_presence_of(:chat_room) }
    it { expect(message).to validate_length_of(:body).is_at_least(2).is_at_most(1000) }
  end
end
