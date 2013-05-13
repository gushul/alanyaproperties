class Service < ActiveRecord::Base
  attr_accessible :body, :is_main, :name, :slug

  validates :body, :name, :slug, presence: true

  has_one :setting, as: :model
end
