class Paywall < ActiveRecord::Base
  attr_accessible :content, :name, :seconds, :title, :show_on_leave

  validates :name, :content, :seconds, presence: true
  validates :name, uniqueness: true

  has_many :paywall_entities, dependent: :destroy
end
