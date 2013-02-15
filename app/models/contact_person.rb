class ContactPerson < ActiveRecord::Base
  attr_accessible :name, :photo, :post, :photo_cache

  mount_uploader :photo, ContactPersonPhotoUploader
  validates :name, :photo, :post, presence: true
end
