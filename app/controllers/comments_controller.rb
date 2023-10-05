class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(text: comment_params[:text], author: current_user)
    if @comment.save
      redirect_to user_post_path(@post.author, @post), notice: 'Comment added!'
    else
      # Handle error
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
