class UsersController < ApplicationController
  def index
    if params[:search].present?
      @users = User.where("email LIKE ?", "#{params[:search]}%").where.not(id: current_user.id).paginate(page: params[:page], per_page: 4)
    else
      @users = User.where.not(id: current_user.id).paginate(page: params[:page], per_page: 4)
    end
  end


  def chat
    @user = User.find(params[:id])
    @messages = current_user.sent_messages.where(receiver_id: @user.id).or(current_user.received_messages.where(sender_id: @user.id)).order(created_at: :asc)
    @message = Message.new

  end
  def profile

  end
end
