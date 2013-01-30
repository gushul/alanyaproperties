require 'carrierwave/orm/activerecord'

class Asset < ActiveRecord::Base
  attr_accessible :asset, :asset_cache
  belongs_to :attachment, polymorphic: true

  validates :asset, presence: true
end
