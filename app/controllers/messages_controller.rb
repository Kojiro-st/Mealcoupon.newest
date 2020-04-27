class MessagesController < ApplicationController

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to posts_path
    # if @message.save
    #   redirect_to posts_path, notice: '注文できました'
    # else
    #   redirect_to posts_path, notice: '注文に失敗しました'
    # end
  end

  def show
    @posts = Post.where('couponcode LIKE ?', "%#{params[:id]}%")
    @user = User.find(params[:user_id])
    @message = Message.all
  end

  private

  def message_params
    params.require(:message).permit(:name, :phonenumber, :ordertimeleft, :ordertimeright, :howtoeat, :people, :couponcode).merge(user_id: current_user.id)
  end
end