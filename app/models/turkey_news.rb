class TurkeyNews < ActiveRecord::Base
  attr_accessible :body, :title, :teaser, :photo, :slug, :photo_cache

  validates :title, :teaser, :body, :photo, :slug, presence: true
  mount_uploader :photo, TurkeyNewsPhotoUploader
end
