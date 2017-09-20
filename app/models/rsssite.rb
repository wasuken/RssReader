require 'uri'
require 'rss'
require 'sanitize'

class Rsssite < ActiveRecord::Base
  has_one :rsspage
  def get_rss
    begin
      unless self.url.nil?
        rss_results = ""
        url = URI.parse(self.url).normalize
        open(url) do |http|
          response = http.read
          rss_results = RSS::Parser.parse(response, false)
          rss_results.items.each do |item|
            desc = Sanitize.clean(item.respond_to?(:description) ?
                                    item.description : "")
            link = Sanitize.clean(item.link.instance_of?(String) ?
                                    item.link : item.link.href)
            title = Sanitize.clean(item.title)
            Rsspage.where(url: link)
              .first_or_create(title: title,url: link,
                               description: desc,
                           created_at: item.date,updated_at: item.date)
          end
        end
      end
    rescue
      p self.url + " error"
    end
  end
end
