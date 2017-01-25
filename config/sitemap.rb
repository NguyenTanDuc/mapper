# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.example.com"

{en: :english, ja: :japanese}.each_pair do |locale, name|
  group(sitemaps_path: "sitemaps/#{locale}/", filename: name) do
    add root_path, changefreq: "daily"

    Category.find_each do |category|
      add category_posts_path(category, locale: locale), changefreq: "weekly", lastmod: category.updated_at

      category.posts.each do |post|
        add category_post_path(category, post, locale: locale), changefreq: "yearly", lastmod: post.updated_at
      end
    end
  end
end

SitemapGenerator::Sitemap.create do

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
