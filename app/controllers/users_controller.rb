class UsersController < ApplicationController

  def show
    @posts = @user.posts
    # @post = Post.find(params[:id])
  end

end
