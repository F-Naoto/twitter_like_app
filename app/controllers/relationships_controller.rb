class RelationshipsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @follow = current_user.active_relationships.build(followed_id:@user.id)
    if @follow.save
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @follow = current_user.active_relationships.find_by(followed_id:@user.id)
    @follow.destroy!
    redirect_to @user
  end
end
