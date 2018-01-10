require 'uri'
require 'rss'
require 'sanitize'

class Rsssite < ActiveRecord::Base
  has_one :rsspage
  def get_rss
    begin
      unless self.url.nil?
        opt = {}
        opt['User-Agent'] = 'Mozilla/5.0 (Windows NT 6.3; Trident/7.0; rv 11.0) like Gecko'
        rss_results = ""
        url = URI.parse(self.url).normalize
        open(url,opt) do |http|
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
                               description: desc,rsssite_id: self.id,
                           created_at: item.date,updated_at: item.date)
          end
        end
      end
    rescue => e
      p self.url + " error"
      p e
    end
  end
end
