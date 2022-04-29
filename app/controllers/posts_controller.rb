class PostsController < ApplicationController
  before_action :logged_in_user, only:%i[new show create destroy]

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
    @post = current_user.posts.find_by(id:params[:id])
    @post.destroy
    redirect_to current_user
  end

  private
  def content_params
  params.require(:post).permit(:content)
  end

  def logged_in_user
    unless logged_in?
    redirect_to login_path
    end
  end
end
