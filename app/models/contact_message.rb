class ContactMessage < ActiveRecord::Base
  belongs_to :contact_topic
  belongs_to :contact_person
  belongs_to :property
  attr_accessible :contact_email, :contact_name, :contact_phone, :message, :contact_person_id, :contact_topic_id, :from, :to

  validates :contact_email, :contact_name, :contact_phone, :message, presence: true

  validates :contact_person_id, :contact_topic_id, presence: { unless: :property }

  validates :contact_email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/}
  validates :contact_phone, :format => {:with => /\A\+[\d\s\-\(\)]+\Z/}
  validates :contact_phone, :length => {
      :minimum => 10,
      :maximum => 14,
      :tokenizer => lambda { |str| str.scan(/\d/) },
      # :too_short => "must have at least %{count} words",
      # :too_long  => "must have at most %{count} words"
  }

  validates :from, :to, presence: { if: :range? }

  def range?
    property && property.property_for == 'rent'
  end

  after_save do
    if property.blank?
      Admin::ServiceMailer.contacts(self).deliver
    else
      Admin::ServiceMailer.order(self).deliver
    end
  end
end
