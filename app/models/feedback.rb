class Feedback < ActiveRecord::Base
  attr_accessible :email, :message, :name

  validates :name, :message, presence: true
end
