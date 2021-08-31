class Public::VenuesController < ApplicationController

  def index
    @venues = Venue.page(params[:page])
    @reviews = Review.all
  end

  def show
    @comment = Comment.new
    @venue = Venue.find(params[:id])
    @review = Review.new
    @reviews = Review.all
    if @venue.reviews.blank?
      @average_review = 0
    else
      @average_review = @venue.reviews.average(:rate).round(2)
    end
  end
    
  def venue_events
    @comment = Comment.new
    @venue = Venue.find(params[:id])
    @review = Review.new
    @reviews = Review.all
    if @venue.reviews.blank?
      @average_review = 0
    else
      @average_review = @venue.reviews.average(:rate).round(2)
    end
  end


end
