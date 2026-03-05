class ArtistsController < ApplicationController
  def index
    @artists = Artist.on_roster.includes(:pieces).sort_by { |a| a.name.split(" ").last.downcase }
  end
  
  def show
    @artist = Artist.includes(:pieces).find(params[:id])
    @pieces = @artist.pieces.featured
  end
end
