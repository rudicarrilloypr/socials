class LikesController < ApplicationController
  def create
    @post = Post.find(params[:id])
    @like = @post.likes.build(user: current_user)
    if @like.save
      redirect_to user_post_path(@post.author, @post), notice: 'Liked!'
    else
      # Handle error
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @like = @post.likes.find_by(user: current_user)
    @like&.destroy
    redirect_to user_post_path(@post.author, @post), notice: 'Unliked!'
  end
end
