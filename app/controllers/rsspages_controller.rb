# coding: utf-8
class RsspagesController < ApplicationController
  # HTML組み立ててから返してもいいかもね。
  def show
    @rsspages = view_context.rss_page_group_hash
    #view
    render :index
  end
  def json
    @grphs = view_context.rss_page_group_hash
    @rsspages = []
    @grphs.keys.each do |key|
      @rsspages.concat(@grphs[key].take(3))
    end
    render :json => @rsspages
  end
  def get_rsspages
    return if Rsssite.all.count.zero?
    Rsssite.all.each(&:get_rss)
    redirect_to :action => "show"
  end
end
