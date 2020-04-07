class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user).order("created_at DESC").page(params[:page]).per(9)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to posts_path
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def show
    @post = Post.find(params[:id])
  end

  def map
  end

  def find
    latitude = params[:latitude]
    longitude = params[:longitude]

    @places = Post.all.within(2, origin: [latitude, longitude])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:image, :couponcode, :shopname, :address, :expirydate).merge(user_id: current_user.id)
  end

end
