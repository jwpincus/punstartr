class ChatroomsController < ApplicationController
  def create
    search_params = format_chatroom_params(chatroom_params)
    @project = Project.find_by(id: params[:project_id])
    @chatroom = Chatroom.find_by(topic: search_params)
    if @chatroom
      redirect_to chatroom_path(@chatrooom, @project)
    else
      @chatroom = Chatroom.create(topic: search_params)
      redirect_to chatroom_path(@chatroom, @project)
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  private
    def chatroom_params
      params.permit(:user_1, :user_2)
    end

    def format_chatroom_params(chat_params)
      search_params= []
      search_params[0] = chat_params[:user_1].to_i
      search_params[1] = chat_params[:user_2].to_i
      search_params.sort
    end
end
