class Includes < ActiveRecord::Base
  attr_accessible :name

  has_many :property_includes
  has_many :property, through: :property_includes
end
