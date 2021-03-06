class City < ActiveRecord::Base
  attr_accessible :name, :cover_attributes, :description, :name_case, :name_case2, :name_case3, :url, :created_at, :count_of_views, :paywall, :paywall_entity
  has_many :properties, dependent: :destroy
  has_one :cover, as: :attachment, class_name: Asset::CityCover, dependent: :destroy
  accepts_nested_attributes_for :cover

  validates :name, :cover, :name_case, :name_case2, :name_case3, presence: true
  validates :count_of_views, numericality: true

  has_many :photos,  as: :gallery, dependent: :destroy
  has_many :sliders, as: :model, dependent: :destroy
  has_one  :setting, as: :model, dependent: :destroy
  has_many :hot_offers, as: :offerable
  has_one :paywall_entity, as: :entity
  has_one :paywall, through: :paywall_entity

  include FriendlyId
  friendly_id :to_slugged, :use => :slugged
  def to_slugged
    url.blank? ? name : url
  end

  # Babosa russian normalization bone
  def normalize_friendly_id(text)
    text.to_slug.normalize! transliterations: :russian
  end

  searchable do
    text :name
    text :description, :stored => true
  end
end
