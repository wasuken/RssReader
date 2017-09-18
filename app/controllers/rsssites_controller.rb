class RsssitesController < ApplicationController
  def create
    Rsssite.create(rsssite_params)
  end
  def show
    @rsssites = Rsssite.all
    @rsssite = Rsssite.new
    #view
    render :index
  end
  def rsssite_params
    params.require(:rsssite).permit(:name, :url)
  end
end
