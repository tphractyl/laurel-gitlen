class Admin::DisplaysController < ApplicationController
  layout 'admin'
  before_action :get_exhibition
  
  def new
  end
  
  def index
    @pieces = @exhibition.pieces
  end
  
  def create
    @exhibition = Exhibition.find(params[:exhibition_id])
    @piece = @exhibition.pieces.create(piece_params)
    piece_order = @exhibition.piece_order || []
    piece_order << @piece.id
    @exhibition.piece_order = piece_order
    @exhibition.save
  end
  
  def edit
    @piece = @exhibition.pieces.find(params[:id])
  end
  
  def update
    @piece = @exhibition.pieces.find(params[:id])
    @piece.update_attributes(piece_params)
  end
  
  def destroy
    @piece = @exhibition.pieces.find(params[:id])
    @piece.destroy
    @exhibition.piece_order.delete(@piece.id) 
    @exhibition.save
  end
  
  protected
  def piece_params
    params.require(:piece).permit(:title, :description, :artist_name, :year, :dimensions, :edition_details, :upload_url, :upload_key)
  end
  
  def get_exhibition
    @exhibition = Exhibition.find(params[:exhibition_id])
  end
end