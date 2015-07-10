class HotOffer < ActiveRecord::Base
  attr_accessible :description, :offerable, :publish, :title, :color

  validates :color, presence: true

  COLORS = %w(red orange green blue yellow purple)

  belongs_to :offerable, polymorphic: true

  scope :properties, -> { where offerable_type: Property }
  scope :cities,     -> { where offerable_type: City }
  scope :published,  -> { where publish: true }
end
