require 'carrierwave/orm/activerecord'
class Photo < ActiveRecord::Base
  attr_accessible :alt, :gallery_id, :gallery_type, :picture, :title, :picture_cache, :video
  validates :picture, presence: true
  belongs_to :gallery, polymorphic: true

  mount_uploader :picture, PhotoPictureUploader
  delegate :thumb, :thumb2, :big, :small, :url, to: :picture

  def video?
    !video.blank?
  end
end
