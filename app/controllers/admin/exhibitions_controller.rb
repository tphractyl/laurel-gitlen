class Admin::ExhibitionsController < ApplicationController
  before_action :require_login
  before_action :get_exhibition, only: [:edit, :show, :update, :destroy, :press_release_callback]
  
  layout 'admin'
  
  def index
    @exhibitions = Exhibition.order("begins DESC").includes(:pieces)
  end
  
  def new
    @exhibition = Exhibition.new
  end
  
  def create
    @exhibition = Exhibition.new(exhibition_params)
    @exhibition.save_with_artists
  end
  
  def show
    @works = @exhibition.pieces
    @artists = @exhibition.artists
  end
  
  def edit
    render "press_release" unless params[:press_release].blank?
  end
  
  def update
    @exhibition.attributes = exhibition_params
    @exhibition.save_with_artists
    @artists = @exhibition.artists
  end
  
  def aws_callback
  end
  
  def press_release_callback
    @exhibition.update_attribute(:press_release_url, press_release_params[:upload_url])
  end
  
  def destroy
    @exhibition.destroy
  end
  
  protected
  def exhibition_params
    params.require(:exhibition).permit(:name, :begins, :ends, :description, :art_fair, :current, :artists_ids => [])
  end
  
  def press_release_params
    params.require(:press_release).permit(:upload_url)
  end
  
  def get_exhibition
    @exhibition = Exhibition.find(params[:id])
  end
  
end
