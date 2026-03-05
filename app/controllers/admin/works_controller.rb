class Admin::WorksController < ApplicationController
  before_action :get_artist
  
  def new
  end
  
  def create
    @piece = @artist.pieces.create(piece_params)
    piece_order = @artist.piece_order || []
    piece_order << @piece.id
    @artist.piece_order = piece_order
    @artist.save
  end
  
  def edit
    @piece = @artist.pieces.find(params[:id])
  end
  
  def update
    @piece = @artist.pieces.find(params[:id])
    @piece.update_attributes(piece_params)
  end
  
  def destroy
    @piece = @artist.pieces.find(params[:id])
    @piece.destroy
    @artist.piece_order.delete(@piece.id) 
    @artist.save
  end
  
  protected
  def piece_params
    params.require(:piece).permit(:title, :description, :artist_name, :year, :dimensions, :edition_details, :upload_url, :upload_key, :featured)
  end
  
  def get_artist
    @artist = Artist.find(params[:artist_id])
  end
  
end
