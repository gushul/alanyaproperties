class ManagerPerson < ActiveRecord::Base
  attr_accessible :language, :location, :name, :phono, :position, :skype

  has_many :property_manager_people
  has_many :properties, through: :property_manager_people
end
