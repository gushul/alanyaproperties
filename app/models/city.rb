class City < ActiveRecord::Base
  attr_accessible :name, :cover_attributes
  has_one :cover, as: :attachment, class_name: Asset::CityCover, dependent: :destroy
  accepts_nested_attributes_for :cover

  validates :name, :cover, presence: true

end
