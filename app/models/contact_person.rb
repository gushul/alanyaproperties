class ContactPerson < ActiveRecord::Base
  attr_accessible :name, :photo, :post, :photo_cache, :default
  before_save :uncheck_default, if: :default_changed?

  mount_uploader :photo, ContactPersonPhotoUploader
  validates :name, :photo, :post, presence: true

  private
  def uncheck_default
    ContactPerson.update_all(default: false)
  end
end
