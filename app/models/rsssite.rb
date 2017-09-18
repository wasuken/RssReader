require 'uri'
require 'rss'
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
            Rsspage.create(title: item.title,url: item.link,
                           description: item.description,
                           created_at: item.date,updated_at: item.date)
          end
        end
      end
    rescue => e
      raise e
    end
  end
end
