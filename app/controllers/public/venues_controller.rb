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
    @average_review = if @venue.reviews.blank?
                        0
                      else
                        @venue.reviews.average(:rate).round(2)
                      end
  end

  def venue_events
    @comment = Comment.new
    @venue = Venue.find(params[:id])
    @review = Review.new
    @reviews = Review.all
    @average_review = if @venue.reviews.blank?
                        0
                      else
                        @venue.reviews.average(:rate).round(2)
                      end
  end
end
