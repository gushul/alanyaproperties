class TurkeyNews < ActiveRecord::Base

  attr_accessible :body, :title, :teaser, :photo, :url, :photo_cache, :created_at, :count_of_views

  validates :title, :teaser, :body, :photo, presence: true
  validates :teaser, length: { maximum: 360 }
  validates :count_of_views, numericality: true

  mount_uploader :photo, TurkeyNewsPhotoUploader

  has_one :setting, as: :model, dependent: :destroy

  default_scope { order('updated_at DESC') }

  searchable do
    text :title
    text :teaser
    text :body
  end

  include FriendlyId
  friendly_id :to_slugged, :use => :slugged
  def to_slugged
    url.blank? ? title : url
  end

  def self.get_seismic_map
    find_by_article_type('seismic_map')
  end

  def self.get_cost_of_living
    find_by_article_type('cost_of_living')
  end

  # Babosa russian normalization bone
  def normalize_friendly_id(text)
    text.to_slug.normalize! transliterations: :russian
  end
end
