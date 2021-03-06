class MessagesController < ApplicationController
  before_action :set_index, only:[:create]

  def new
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      ActionCable.server.broadcast 'message_channel', content: @message
    end
  end

    private

  def set_index
    @item = Item.find(params[:item_id])
  end

  def message_params
    params.require(:message).permit(:text).merge(user_id: current_user.id, item_id: @item.id)
  end
end
