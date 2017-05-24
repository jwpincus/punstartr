class ChatroomsController < ApplicationController
  def create
    @chatroom = Chatroom.find_by(topic: [params[:user_1], params[:user_2]])
    if @chatroom
      redirect_to chatroom_path(@chatrooom)
    else
      @chatroom = Chatroom.create(topic: [params[:user_1], params[:user_2]])
      redirect_to chatroom_path(@chatrooom)
    end
  end

  def show
    byebug
    @chatroom = Chatroom.find_by()
    @message = Message.new
  end
end
