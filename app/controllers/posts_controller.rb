class PostsController < ApplicationController
  bofore_action :set_post, only: [:show, :edit, :update, :destroy]

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
  end

  def map
  end

  def tag
    if params[:prefecture].present?
      @posts = Post.where('prefecture LIKE ?', "%#{params[:prefecture]}%")
    else
      @posts = Post.none
    end
  end

  def find
    if params[:foodvariety].present?
      @posts = Post.where('foodvariety LIKE ?', "%#{params[:foodvariety]}%")
    else
      @posts = Post.none
    end
  end

  def edit
  end

  def update
    post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    post.destroy
    redirect_to posts_path
  end

  def set_post
    @post = Post.find(params[:id])
 end

  private
  def post_params
    params.require(:post).permit(:image, :couponcode, :shopname, :address, :expirydate, :foodname, :prefecture, :foodvariety).merge(user_id: current_user.id)
  end

end
