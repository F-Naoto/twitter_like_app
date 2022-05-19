class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to "/posts/1"
    else 
      redirect_to  root_url
    end
  end

  private
  def review_params
    params.permit(:post_id, :score, :content)
  end
end
