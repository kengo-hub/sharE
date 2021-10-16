class Admins::ArtistsController < ApplicationController
  def index
    @artists = Artist.page(params[:page])
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to admins_artists_path
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)
    redirect_to admins_artists_path(artist)
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to admins_artists_path
  end

  private

  def artist_params
    params.permit(:name)
  end
end
