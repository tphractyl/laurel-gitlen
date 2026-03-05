class Admin::OrdersController < ApplicationController
  before_action :require_login, :get_orderable

  def new
    @order = params[:order]
  end
  
  def create
    @orderable.piece_order = params[:order_string].split(",").map{ |s| s.to_i }
    @orderable.save
  end
  
  private
  
  def get_orderable
    if params[:artist_id]
      @orderable = Artist.find(params[:artist_id])
    elsif params[:exhibition_id]
      @orderable = Exhibition.find(params[:exhibition_id])
    end
  end
end
