class Property < ActiveRecord::Base
  serialize :property_attributes
  serialize :geo

  belongs_to :city
  attr_accessible :article, :property_attributes, :description, :geo, :property_kind, :name, :photo, :price, :property_type, :city_id

  validates :name, :article, :description, :property_kind, :photo, :price, :property_type, :city, presence: true

  TYPES = %w{buy rent}
  KINDS = %w{new_building secondary_residence}

  after_initialize do
    @property_attributes ||= {}
    @geo ||= {}
  end
end
