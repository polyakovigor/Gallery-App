require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do

  let(:user) { create :user }
  let(:chat_room) { create :chat_room, user_id: user.id }
  let(:message) { build :message, chat_room_id: chat_room.id, user_id: user.id }

  before :each do
    sign_in user
  end

  describe 'GET #index' do
    it 'assigns all chat_rooms as @chat_rooms' do
      get :index, params: {}
      expect(assigns(:chat_rooms)).to eq([chat_room])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested chat_room as @chat_room' do
      get :show, params: { id: chat_room.to_param }
      expect(assigns(:chat_room)).to eq(chat_room)
      expect(assigns(:message)).to eq(message)
    end
  end



end
