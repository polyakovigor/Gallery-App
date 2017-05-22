class ChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find(params[:id])
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_room_path(@chat_room)
    else
      flash[:error] = @chat_room.errors.full_messages
      redirect_to chat_rooms_path
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
