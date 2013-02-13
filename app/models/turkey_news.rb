class TurkeyNews < ActiveRecord::Base
  attr_accessible :body, :title, :teaser, :photo, :slug, :photo_cache

  validates :title, :teaser, :body, :photo, :slug, presence: true
  validates :teaser, :length => { :maximum => 360 }
  mount_uploader :photo, TurkeyNewsPhotoUploader
end
