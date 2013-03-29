class Banner < ActiveRecord::Base
  attr_accessible :active, :description, :link, :name, :price, :picture, :picture_cache, :position, :tip, :until, :city_id, :for
  belongs_to :city

  mount_uploader :picture, BannerPictureUploader

  validates :picture, :name, :position, :link, presence: true

  scope :active, ->(){ where(active: true).where('until = NULL OR until > ?', Date.today) }
  scope :top, where(position: 'top')
  scope :left, where(position: 'left')
  scope :random, order('RAND()')
  scope :for, ->(type) { where(:for => type) }

end
