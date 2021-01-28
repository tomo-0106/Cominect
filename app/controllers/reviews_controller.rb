class ReviewsController < ApplicationController

  def create
    comic = Comic.find(params[:comic_id])
    review = current_user.reviews.new(review_params)
    review.comic_id = comic.id
    review.save
    redirect_to comic
  end

  def destroy
    comic = Comic.find(params[:comic_id])
    Review.find_by(user_id: current_user, comic_id: comic).destroy
    redirect_to comic_path(params[:comic_id])
  end

  private

  def review_params
    params.require(:review).permit(:rate, :body)
  end

end
