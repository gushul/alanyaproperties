class Service < ActiveRecord::Base
  attr_accessible :body, :is_main, :name, :url

  validates :body, :name, presence: true

  has_one :setting, as: :model, dependent: :destroy

  include FriendlyId
  friendly_id :to_slugged, :use => :slugged
  def to_slugged
    url.blank? ? name : url
  end

  # Babosa russian normalization bone
  def normalize_friendly_id(text)
    text.to_slug.normalize! transliterations: :russian
  end
end
