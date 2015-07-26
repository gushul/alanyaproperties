class Partner < ActiveRecord::Base
  attr_accessible :email, :languages, :name, :photo, :position, :skype, :phone, :photo_cache

  mount_uploader :photo, PartnerPhotoUploader
end
