class Admins::VenuesController < ApplicationController
  def index
    @venue = Venue.page(params[:page])
  end

  def show
    @venue = Venue.find(params[:id])
    @reviews = Review.all
    @average_review = if @venue.reviews.blank?
                        0
                      else
                        @venue.reviews.average(:rate).round(2)
                      end
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.save
    redirect_to admins_venues_path
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    venue = Venue.find(params[:id])
    venue.update(venue_params)
    redirect_to admins_venues_path(venue)
  end

  def destroy
    venue = Venue.find(params[:id])
    venue.destroy
    redirect_to admins_venues_path
  end

  private

  def venue_params
    params.require(:venue).permit(:image, :name, :postcode, :address, :prefecture, :rate, :image_id)
  end
end
