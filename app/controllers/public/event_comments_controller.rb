class Public::EventCommentsController < ApplicationController
  def create
    review = Review.find(params[:event_review_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.review_id = review.id
    @comment.save
    redirect_back(fallback_location: event_path(review.event.id))
  end

  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_back(fallback_location: event_path(params[:event_id]))
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :image_id, :review_id)
  end
end
