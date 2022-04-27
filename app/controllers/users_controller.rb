class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_strong_params)
    if @user.save
      flash[:notice] = "登録に成功しました。"
      redirect_to @user
    else
      render new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(update_user)
      flash[:notice] = "ユーザー情報を変更しました。"
      redirect_to root_url
    else
      redirect_to edit_user_path
    end
    
  end

  def destroy
  end

  private
  def user_strong_params
    params.require(:user).permit(:name, :email,:password, :password_confirmation)
  end

  def update_user
    params.require(:user).permit(:name, :email)
  end
end
