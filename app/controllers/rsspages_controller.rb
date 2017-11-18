# coding: utf-8
class RsspagesController < ApplicationController
  # HTML組み立ててから返してもいいかもね。
  def show
    @rsspages = view_context.rss_page_group_hash
    #view
    render :index
  end
  # 登録されているサイトから各numずつ取得する(default=3)
  def json()
    num = params[:num].to_i
    num ||= 3
    @grphs = view_context.rss_page_group_hash
    @rsspages = []
    @grphs.keys.each do |key|
      @rsspages.concat(@grphs[key].take(num))
    end
    render :json => @rsspages
  end
  def get_rsspages
    return if Rsssite.all.count.zero?
    Rsssite.all.each(&:get_rss)
    redirect_to :action => "show"
  end
end
