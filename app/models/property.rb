require 'property_attribute'

class Property < ActiveRecord::Base
  serialize :property_attributes, PropertyAttributesStruct
  # serialize :geo, Hash
  store :geo, accessors: [:lat, :lng]

  mount_uploader :photo, PropertyPhotoUploader
  has_many :photos, as: :gallery, dependent: :destroy

  scope :property_for, ->(action) { where(property_for: action) }
  scope :on_main, where(on_main: true)

  belongs_to :city
  has_many :reservations, dependent: :destroy
  has_one :setting, as: :model, dependent: :destroy

  attr_accessible :oid, :property_attributes, :description, :geo, :property_kind,
                  :name, :photo, :price, :property_type, :city_id, :property_for,
                  :total_area, :photo_cache, :hot, :to_sea, :lat, :lng, :new_until,
                  :url, :on_main

  validates :name, :oid, :description, :property_kind, :photo, :price,
            :property_type, :city, :property_for, :total_area, :to_sea, :geo, :lat, :lng, presence: true

  KINDS = %w{new_building secondary_residence}
  TYPES = %w{1+1 2+1 3+1 4+1 studio penthouse villa} # студио, 1+1, 2+1, 3+1, 4+1, пентхауз, вилла
  ACTIONS = %w{buy rent}

  after_initialize do
    @property_attributes ||= {}
    @geo ||= {}
  end

  def property_attributes=(attr={})
    os = PropertyAttributesStruct.new(attr)
    super(os)
  end

  def new?
    Date.today < new_until if new_until
  end

  # Search

  searchable do
    text :name
    text :description, :stored => true
    string :oid
    string :property_type
    string :property_for
    string :property_kind
    boolean :hot, :using => :hot?
    integer :total_area
    integer :to_sea
    double :price
    integer :city_id, references: City
  end

  ## Slug
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
