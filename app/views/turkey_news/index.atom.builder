atom_feed :language => 'ru-RU' do |feed|
  feed.title @title
  feed.updated @updated_at

  @turkey_news.each do |item|
    next if item.updated_at.blank?

    feed.entry( item ) do |entry|
      entry.url turkey_news_url(item)
      entry.title item.title
      entry.content item.body, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))

      #entry.author do |author|
      #  author.name entry.author_name
      #end
    end
  end
end