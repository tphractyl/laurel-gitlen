class StaticController < ApplicationController
  def splash
    @exhibition = Exhibition.find_by_current(true) || Exhibition.where("begins <= ?", Date.today).order("begins DESC").first
    @upcoming_exhibitions = Exhibition.where("begins > ?", Date.today).order("begins ASC")
  end
  
  def contact
  end
  
  def archives
    @stories = Story.order('date desc').all
    @stories_by_month = @stories.group_by{ |e| e.date.month }
  end
end
