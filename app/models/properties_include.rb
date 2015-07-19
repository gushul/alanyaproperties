class PropertiesInclude < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :include
  belongs_to :property
end
