class Public::VenuesController < ApplicationController
  def index
    @venues = Venue.page(params[:page])
  end
  
  def show
    @venue = Venue.find(params[:id])
    @review = Review.new
    @reviews = Review.all
  end
  
  
end
