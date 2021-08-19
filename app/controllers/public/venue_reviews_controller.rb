class Public::VenueReviewsController < ApplicationController
  def create
    venue = Venue.find_by(id: params[:venue_id])
    @review = Review.new
    
    @review = venue.reviews.build(review_params)
    @review.save
    redirect_to venue_path(venue.id)
 
    
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_back(fallback_location: venue_path)

  end
  
  def review_params
    params.require(:review).permit(:content, :rate, :venue_id, :user_id)
  end
end
