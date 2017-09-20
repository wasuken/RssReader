class RsspagesController < ApplicationController
  def show
    @rsspages = Rsspage.all.order("created_at desc")
    #view
    render :index
  end
  def get_rsspages
    return if Rsssite.all.count.zero?
    Rsssite.all.each(&:get_rss)
    redirect_to :action => "show"
  end
end
