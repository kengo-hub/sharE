class Public::EventsController < ApplicationController
  def index
    @events = Event.page(params[:page])
    @reviews = Review.all
  end

  def show
    @comment = Comment.new
    @event = Event.find(params[:id])
    @review = Review.new
    @reviews = Review.all
    @average_review = if @event.reviews.blank?
                        0
                      else
                        @event.reviews.average(:rate).round(2)
                      end
  end
end
