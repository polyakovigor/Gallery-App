require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  let(:chat_room) { FactoryBot.create(:chat_room, user: create(:user)) }

  it 'is valid with valid attributes' do
    expect(chat_room).to be_valid
  end

  it 'is invalid with blank attributes' do
    expect(ChatRoom.create(title: '', user_id: '')).not_to be_valid
  end

  describe 'Chat Room associations' do
    it { expect(chat_room).to belong_to(:user) }
    it { expect(chat_room).to have_many(:messages).dependent(:destroy) }
  end

  describe 'Chat Room validations' do
    it { expect(chat_room).to validate_presence_of(:user) }
    it { expect(chat_room).to validate_presence_of(:title) }
    it { expect(chat_room).to validate_length_of(:title).is_at_most(20) }
    it { expect(chat_room).to validate_uniqueness_of(:title) }
  end
end
