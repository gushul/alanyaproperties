require 'property_attribute'

class Property < ActiveRecord::Base
  serialize :property_attributes, PropertyAttributesStruct
  serialize :geo, Hash

  mount_uploader :photo, PropertyPhotoUploader
  has_many :photos, as: :gallery

  scope :property_for, ->(action){ where(property_for: action) }

  belongs_to :city
  attr_accessible :article, :property_attributes, :description, :geo, :property_kind,
    :name, :photo, :price, :property_type, :city_id, :property_for, :total_area, :photo_cache, :hot, :to_sea

  validates :name, :article, :description, :property_kind, :photo, :price,
    :property_type, :city, :property_for, :total_area, :to_sea, presence: true

  KINDS    = %w{new_building secondary_residence}
  TYPES    = %w{studio 1+1 2+1 3+1 4+1 penthouse villa} # студио, 1+1, 2+1, 3+1, 4+1, пентхауз, вилла
  ACTIONS  = %w{buy rent}

  after_initialize do
    @property_attributes ||= {}
    @geo ||= {}
  end

  def property_attributes=(attr={})
    os = PropertyAttributesStruct.new(attr)
    super(os)
  end
end
