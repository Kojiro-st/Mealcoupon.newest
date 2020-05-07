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
    @posts = Post.where("shopname LIKE ?", "%#{params[:shopname]}%")
  end

  def show
    @post = Post.find(params[:id])
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
    params.require(:post).permit(:image, :othercoupon1, :othercoupon2, :othercoupon3, :shopname, :address, :expirydate, :foodname, :prefecture, :foodvariety, :explanation).merge(user_id: current_user.id)
  end

end
