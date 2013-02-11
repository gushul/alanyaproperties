require 'carrierwave/orm/activerecord'
class Photo < ActiveRecord::Base
  attr_accessible :alt, :gallery_id, :gallery_type, :picture, :title, :picture_cache
  validates :picture, presence: true
  belongs_to :gallery, polymorphic: true

  mount_uploader :picture, PhotoPictureUploader
  delegate :big, :small, :url, to: :picture
end
