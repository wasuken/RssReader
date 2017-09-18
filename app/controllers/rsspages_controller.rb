class RsspagesController < ApplicationController
  def show
    @rsspages = Rsspage.all
    #view
    render :index
  end
  def get_rsspages
    return if Rsssite.all.count.zero?
    Rsssite.all.each(&:get_rss)
    redirect_to :action => "show"
  end
end
