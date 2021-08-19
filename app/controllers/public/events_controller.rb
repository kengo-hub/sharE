class Public::EventsController < ApplicationController
  def index
    @events = Event.page(params[:page])
    @reviews = Review.all
  end

  def show
    @event = Event.find(params[:id])
    @review = Review.new
    @reviews = Review.all
    if @event.reviews.blank?
      @average_review = 0
    else
      @average_review = @event.reviews.average(:rate).round(2)
    end
  end
end
