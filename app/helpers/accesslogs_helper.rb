module AccesslogsHelper
  def insert_log(url)
    Accesslog.create(url: url)
  end
end
