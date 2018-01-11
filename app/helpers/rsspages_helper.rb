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
<<<<<<< HEAD
      ht[key] = ht[key].take(page_size)
=======
      #ht[key].reverse!
<<<<<<< HEAD
     ht[key] = ht[key].take(page_size)
=======
      [key] = ht[key].take(page_size)
>>>>>>> origin/HEAD
>>>>>>> 7a8b9bfc1e7de5aec28f7465a696894e5e975158
    end
    ht
  end
end
