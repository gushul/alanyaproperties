class City < ActiveRecord::Base
  include FriendlyId

  friendly_id :to_slugged, :use => :slugged

  attr_accessible :name, :cover_attributes, :description, :name_case, :url
  has_many :properties
  has_one :cover, as: :attachment, class_name: Asset::CityCover, dependent: :destroy
  accepts_nested_attributes_for :cover

  validates :name, :cover, :name_case, presence: true

  has_many :photos, as: :gallery
  has_many :sliders, as: :model

  def to_slugged
    url || name
  end

  # Babosa russian normalization bone
  def normalize_friendly_id(text)
    text.to_slug.normalize! transliterations: :russian
  end
end
