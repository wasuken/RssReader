module RsspagesHelper
  def rss_page_group_hash(page_size=10)
    ht = Hash.new([])
    Rsspage.all.joins(:rsssite)
      .select("rsspages.*,rsssites.url as site_url,rsssites.name")
      .each{ |i|
      if ht.key?(i.name)
        ht[i.name].push i
      else
        ht.store(i.name,[i])
      end
    }
    ht.keys.each do |key|
      ht[key].sort!
      ht[key] = ht[key].take(page_size)
    end
    ht
  end
end
