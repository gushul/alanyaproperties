class ContactMessage < ActiveRecord::Base
  belongs_to :contact_topic
  belongs_to :contact_person
  belongs_to :property
  attr_accessible :contact_email, :contact_name, :contact_phone, :message, :contact_person_id, :contact_topic_id

  validates :contact_email, :contact_name, :contact_phone, :message, :contact_person_id, :contact_topic_id, presence: true

  validates :contact_email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
end
