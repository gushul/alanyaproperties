class Transfer < ActiveRecord::Base
  attr_accessor :type
  attr_accessible :address, :contact_email, :contact_name, :contact_phone, :date_arrival,
                  :flight_number, :people, :terminal, :time_arrival, :transfer_type
  validates :address, :contact_email, :contact_name, :contact_phone, :date_arrival,
            :flight_number, :people, :terminal, :time_arrival, :transfer_type, presence: true

  # with_options if: => 
  validates :contact_email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/}
  validates :contact_phone, :format => {:with => /\A\+[\d\s-\(\)]+\Z/}
  validates :contact_phone, :length => {
      :minimum => 10,
      :maximum => 14,
      :tokenizer => lambda { |str| str.scan(/\d/) },
      # :too_short => "must have at least %{count} words",
      # :too_long  => "must have at most %{count} words"
  }

  # Masked stupid form
  attr_accessible :in_attributes, :out_attributes
  has_one :in, class_name: 'TransferIn', autosave: false
  has_one :out, class_name: 'TransferOut', autosave: false
  accepts_nested_attributes_for :in, :out

  before_validation do
    return unless transfer_type
    fields = self.send(transfer_type.to_sym)
    %w{address date_arrival flight_number people terminal time_arrival}.each do |field|
      self.send("#{field}=", fields.send(field))
    end

    # logger.info self.inspect
    true
  end

  after_save do
    Admin::Service.transfer(self).deliver
  end

end

class TransferBasic
  include ActiveRecord::Persistence
  include ActiveModel::Validations

  FIELDS = %w{address date_arrival flight_number people terminal time_arrival}

  validates *FIELDS, presence: true
  attr_accessor *FIELDS

  attr_writer :transfer_id

  def initialize(*attrs)
    Rails.logger.info(attrs)
    options = attrs[0]
    FIELDS.each do |field|
      self.send("#{field}=", options[field])
    end

  end

  def marked_for_destruction?
    false
  end

  def new_record?
    true
  end

  def self.transaction

  end

  def []=(a, v)
    self.send("#{a}=", v)
  end

  def create_or_update
    true
  end

end

class TransferIn < TransferBasic
end

class TransferOut < TransferBasic
end
