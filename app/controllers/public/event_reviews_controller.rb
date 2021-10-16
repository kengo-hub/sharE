class Public::EventReviewsController < ApplicationController
  def create
    event = Event.find_by(id: params[:event_id])
    @review = Review.new

    @review = event.reviews.build(review_params)
    @review.save
    redirect_to event_path(event.id)
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_back(fallback_location: event_path)
  end

  def review_params
    params.require(:review).permit(:content, :rate, :event_id, :user_id)
  end
end
