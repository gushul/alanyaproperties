class Slider < ActiveRecord::Base
  attr_accessible :data, :model_id, :model_type, :photo
  store :data, accessors: [:title, :price, :description, :link]
  attr_accessible :title, :price, :description, :link

  validates :photo, presence: true
  belongs_to :model, polymorphic: true

  mount_uploader :photo, SliderPhotoUploader

  scope :slider_type, ->(type){ where(model_type: type) }
end
