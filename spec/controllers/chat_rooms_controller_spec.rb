require 'rails_helper'

RSpec.describe ChatRoomsController, type: :controller do

  let(:user) { create :user }
  let(:chat_room) { create :chat_room }
  let(:message) { create :message, chat_room_id: chat_room.id, user_id: user.id }

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
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_attributes) { attributes_for(:chat_room) }
      it 'creates a new chat room' do
        expect { post :create, params: { chat_room: valid_attributes } }.to change(ChatRoom, :count).by(1)
      end

      it 'redirects to the created chat room' do
        post :create, params: { chat_room: valid_attributes }
        expect(response).to redirect_to chat_room_path(ChatRoom.last)
      end
    end

    context 'with invalid params' do
      let(:invalid_attributes) { attributes_for(:invalid_chat_room) }
      it 'assigns a newly created but unsaved chat room as @chat_room' do
        post :create, params: { chat_room: invalid_attributes }
        expect(assigns(:chat_room)).to be_a_new(ChatRoom)
      end

      it 're-renders the chat_rooms/index template' do
        post :create, params: { chat_room: invalid_attributes }
        expect(response).to redirect_to chat_rooms_path
      end
    end
  end

end
