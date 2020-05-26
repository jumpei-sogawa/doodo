# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://doodo.jp"

SitemapGenerator::Sitemap.create do
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)

  add search_path, :priority => 0.7, :changefreq => 'daily'

  Museum.find_each do |museum|
    add museum_path(museum), :changefreq => 'daily', :lastmod => museum.updated_at
  end

  Exhibition.find_each do |exhibition|
    add exhibition_path(exhibition), :changefreq => 'daily', :lastmod => exhibition.updated_at
  end

  ExhbLog.find_each do |exhb_log|
    add exhb_log_path(exhb_log), :changefreq => 'daily', :lastmod => exhb_log.updated_at
  end

  Art.find_each do |art|
    add art_path(art), :changefreq => 'daily', :lastmod => art.updated_at
  end

  ArtLog.find_each do |art_log|
    add art_log_path(art_log), :changefreq => 'daily', :lastmod => art_log.updated_at
  end

  add articles_path

  Article.find_each do |article|
    add article_path(article), :changefreq => 'daily', :lastmod => article.updated_at
  end
end