class MessagesController < ApplicationController

  def index
  end

  def new
    @post = Post.find(params[:post_id])
    @message = Message.new
  end

  def create
    # Message.create(message_params)
    # redirect_to posts_path
    # if @message.save
    #   redirect_to posts_path, notice: '注文できました'
    # else
    #   redirect_to posts_path, notice: '注文に失敗しました'
    # end
    if Message.create(message_params)
      redirect_to posts_path, notice: '注文できました。'
    else
      flash.now[:alert] = '注文できませんでした。'
      redirect_to posts_path, notice: '注文に失敗しました'
    end
  end

  def show
    @post = Post.find(params[:post_id])
    @message = @post.messages
  end

  private

  def message_params
    params.require(:message).permit(:name, :phonenumber, :ordertimeleft, :ordertimeright, :howtoeat, :people, :couponcodenumber1, :couponcodenumber2, :couponcodenumber3).merge(post_id: params[:post_id])
  end
end