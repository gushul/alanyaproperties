class ManagerPerson < ActiveRecord::Base
  attr_accessible :language, :email, :location, :name, :phone, :position, :skype, :photo, :photo_cache

  has_many :property_manager_people
  has_many :properties, through: :property_manager_people

  mount_uploader :photo, ManagerPersonPhotoUploader
end
