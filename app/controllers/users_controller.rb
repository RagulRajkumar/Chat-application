class UsersController < ApplicationController
  def index
    # @users = User.all
    @users = User.where.not(id: current_user.id)
  end

  def chat
    @user = User.find(params[:id])
    @messages = current_user.sent_messages.where(receiver_id: @user.id).or(current_user.received_messages.where(sender_id: @user.id)).order(created_at: :asc)
    @message = Message.new
  end
end
