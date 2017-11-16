module RsspagesHelper
  def group_hash
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
      ht[key].reverse!
    end
    ht
  end
end
