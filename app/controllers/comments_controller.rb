class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comments_param)
    @comment.save

    redirect_to @post
  end

  private 

  def comments_param
    params.require(:comment).permit(:content,:username)
  end
end