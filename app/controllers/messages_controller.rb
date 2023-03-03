class MessagesController < ApplicationController
  def create
    @message = current_user.sent_messages.build(message_params)
    if @message.save
      redirect_to chat_user_path(@message.receiver_id)
    else
      flash[:error] = "Message failed to send."
      redirect_to chat_user_path(@message.receiver_id)
    end
  end

  private

  def message_params
    params.require(:message).permit(:receiver_id, :message)
  end
end
