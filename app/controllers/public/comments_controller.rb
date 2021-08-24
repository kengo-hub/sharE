class Public::CommentsController < ApplicationController
  def create
    review = Review.find(event_review_id)
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.review_id = review.id
    comment.save
    redirect_to book_path(book)
  end

  def destroy
    Comment.find_by(id: params[:id], review_id: params[:review_id]).destroy
    redirect_back(fallback_location: venue_path)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:content,:image_id,:review_id)
  end
end
