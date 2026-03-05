class StoriesController < ApplicationController
  def index
    @artists = Artist.on_roster.includes(:stories).sort_by { |a| a.name.split(" ").last.downcase }.delete_if { |a| a.stories.featured.blank? }
  end
  
  def show
  end
end
