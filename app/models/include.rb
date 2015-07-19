class Include < ActiveRecord::Base
  attr_accessible :name

  has_many :properties_includes
  has_many :properties, through: :properties_includes
end
