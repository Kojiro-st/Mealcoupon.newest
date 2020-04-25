class MessagesController < ApplicationController
  before_action :set_user

  def index
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
    if @message.save
      redirect_to posts_path, notice: '注文できました'
    else
      redirect_to posts_path, notice: '注文に失敗しました'
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

  def set_user
    @user = User.find(params[:user_id])
  end
end