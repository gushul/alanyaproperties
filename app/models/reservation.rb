class Reservation < ActiveRecord::Base
  belongs_to :property

  attr_accessible :contact_email, :contact_name, :contact_phone, :from, :oid, :property_id, :to

  validates :contact_email, :contact_name, :contact_phone, :from, :property, :to, presence: true

  after_create :generate_oid

  def generate_oid
    update_attribute :oid, "#{property.oid}-#{from.strftime('%d%m')}-#{to.strftime('%d%m')}-#{id}"
  end

  def days
    (from..to).count
  end

end
