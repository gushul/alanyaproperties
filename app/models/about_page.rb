class AboutPage < ActiveRecord::Base
  include FriendlyId

  friendly_id :to_slugged, :use => :slugged

  attr_accessible :body, :slug, :title, :url, :default

  validates :body, :title, :url, presence: true

  def to_slugged
    url || title
  end

  # Babosa russian normalization bone
  def normalize_friendly_id(text)
    text.to_slug.normalize! transliterations: :russian
  end
end
