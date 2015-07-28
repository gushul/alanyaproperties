class AboutPage < ActiveRecord::Base

  attr_accessible :body, :slug, :title, :url, :default, :created_at, :count_of_views, :paywall, :paywall_entity, :menu_title

  validates :body, :title, :url, presence: true
  validates :count_of_views, numericality: true

  has_one :setting, as: :model, dependent: :destroy
  has_one :paywall_entity, as: :entity
  has_one :paywall, through: :paywall_entity

  include FriendlyId
  friendly_id :to_slugged, :use => :slugged
  def to_slugged
    url.blank? ? title : url
  end

  # Babosa russian normalization bone
  def normalize_friendly_id(text)
    text.to_slug.normalize! transliterations: :russian
  end
end
