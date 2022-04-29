class PostsController < ApplicationController

  def new
  @post = Post.new
  end

  def create
    @post = current_user.posts.build(content_params)
    if @post.save
      redirect_to current_user
    else
      render new_user_path
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  def content_params
  params.require(:post).permit(:content)
  end
end
