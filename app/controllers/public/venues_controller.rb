class Public::VenuesController < ApplicationController
  def index
    @venues = Venue.page(params[:page])
  end
  
  def show
    @venue = Venue.find(params[:id])
    gon.venue = @venue
    @review = Review.new
  end
  
  
end
