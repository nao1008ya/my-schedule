class ChatsController < ApplicationController
  def index
    @chat = Chat.new
    @group = Group.find(params[:group_id])
  end
end
