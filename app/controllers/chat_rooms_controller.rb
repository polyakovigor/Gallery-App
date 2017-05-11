class ChatRoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    @message = Message.new
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
    else
      flash[:error] = @chat_room.errors.full_messages
    end
    redirect_to chat_room_path(@chat_room)
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
