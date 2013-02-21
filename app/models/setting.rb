# encoding: utf-8
require 'email_list_validator'

class Setting < ActiveRecord::Base
  store :value
  attr_accessible :key, :model_id, :model_type, :value
  belongs_to :model, polymorphic: true

  scope :type, ->(type) { where(model_type: type) }

  FIELDS = {
    contacts: {
      emails: { type: :text, hint: "Contact emails. Список через запятую", validate: { email_list: true } },
      seo_title: { type: :string, hint: "Seo title" },
      seo_description: { type: :text, hint: "Seo description" },
      text: { type: :text, hint: "Текст над формой", html: true },
      phones: { type: :string, hint: "Телефоны через запятую" },
      address: { type: :text, hint: 'Контактный адрес в левой панели' },
      skype: { type: :string },
      geo: { type: :string, hint: "Lat, Lng. Пример: 42,9 -98,3" }
    }
  }

  after_initialize do
    # p fields
    fields = FIELDS[model_type.to_sym]
    Setting.store_accessor :value, fields.keys
    Setting.attr_accessible *fields.keys

    fields.each do |field, options|
      Setting.validates(field, options[:validate].clone) if options[:validate]
    end
  end
end
