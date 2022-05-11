class CommentsController < ApplicationController

  def show
    @comments = Comment.where(post_id:params[:post_id])
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to current_user
    end
  end

  def destroy
  end

  private
  def comment_params
  params.permit(:comment, :post_id)
  end
end
