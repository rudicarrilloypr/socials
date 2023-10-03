class PostsController < ApplicationController
    def index
      @user = User.find(params[:user_id])
      @posts = @user.posts.paginate(page: params[:page], per_page: 3)
    end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @recent_comments = @post.five_recent_comments
  end
end
