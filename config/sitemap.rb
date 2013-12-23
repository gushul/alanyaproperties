# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.alanyaproperties.ru"

# Add Yandex ping
SitemapGenerator::Sitemap.search_engines[:yandex] ='http://webmaster.yandex.com/site/map.xml?host=%s'

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'daily', priority: 1

  add buy_path, changefreq: 'daily', priority: 0.9
  add '/buy/search', changefreq: 'daily', priority: 0.9

  add rent_path, changefreq: 'daily', priority: 0.9
  add '/rent/search', changefreq: 'daily', priority: 0.9

  Property.find_each do |property|
    add property_path(property), changefreq: 'weekly', priority: 0.8
  end

  City.find_each do |city|
    add city_path(city), priority: 0.7
  end

  Service.find_each do |service|
    add service_path(service), priority: 0.5
  end

  add turkey_news_index_url, changefreq: 'daily', priority: 0.6
  TurkeyNews.find_each do |news|
    add url_for(news), priority: 0.6
  end


  add about_pages_path

  AboutPage.find_each do |a|
    add url_for(a)
  end

  add contacts_path
  add reservations_path
  add transfer_index_path
  add search_path

end
