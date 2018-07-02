class AccesslogsController < ApplicationController
  def insert_and_redirect
    url = params[:url]
    view_context.insert_log(url)
    redirect_to url
  end
end
