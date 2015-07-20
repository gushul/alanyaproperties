class PropertyManagerPerson < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :manager_person
  belongs_to :property
end
