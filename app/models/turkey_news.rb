class TurkeyNews < ActiveRecord::Base
  # default_scope { where(article_type: nil) }
  attr_accessible :body, :title, :teaser, :photo, :slug, :photo_cache

  validates :title, :teaser, :body, :photo, :slug, presence: true
  validates :teaser, :length => {:maximum => 360}
  mount_uploader :photo, TurkeyNewsPhotoUploader

  searchable do
    text :title
    text :teaser
    text :body
  end

  def self.get_seismic_map
    find_by_article_type('seismic_map')
  end
end
