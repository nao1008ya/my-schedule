class ChatsController < ApplicationController
  def index
    @chat = Chat.new
    @group = Group.find(params[:group_id])
    @chats = @group.chats.includes(:user)
  end

  def create
    @group = Group.find(params[:group_id])
    @chat = @group.chats.new(chat_params)
    if @chat.save
      redirect_to group_chats_path(@group)
    else
      @chats = @group.chats.includes(:user)
      render :index
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:text).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
