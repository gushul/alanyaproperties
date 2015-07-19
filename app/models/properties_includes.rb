class PropertiesIncludes < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :inludes
  belongs_to :property
end
