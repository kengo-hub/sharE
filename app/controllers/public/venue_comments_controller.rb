class Public::VenueCommentsController < ApplicationController
  def create
    review = Review.find(params[:venue_review_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.review_id = review.id
    @comment.save
    redirect_back(fallback_location: venue_path(review.venue.id))
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_back(fallback_location: venue_path(params[:venue_id]))
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:image_id,:review_id)
  end
end
