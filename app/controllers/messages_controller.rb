class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
    if @message.save
      redirect_to posts_path, notice: 'メッセージが送信されました'
    else
      redirect_to posts_path, notice: 'メッセージが送信に失敗しました'
    end
  end

  def show
    @message = Message.find(params[:messasge_id])
    @user = User.find(params[:user_id])
  end

  private

  def message_params
    params.require(:message).permit(:name, :ordertime, :howtoeat, :people).merge(user_id: current_user.id)
  end
end