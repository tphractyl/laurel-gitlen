class ExhibitionsController < ApplicationController
  def index
    upcoming = Exhibition.includes(:pieces, :artists).where("begins >= ?", Date.today).order("begins ASC").load
    past = Exhibition.includes(:pieces, :artists).where("begins < ?", Date.today).order("begins DESC").load
    @exhibitions_by_year = (upcoming + past).group_by { |e| e.begins.year }
  end
  
  def show
    @exhibition = Exhibition.find(params[:id])
    @pieces = @exhibition.pieces
  end
end
