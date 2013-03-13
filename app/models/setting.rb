# encoding: utf-8
require 'email_list_validator'

class Setting < ActiveRecord::Base
  store :value
  attr_accessible :key, :model_id, :model_type, :value
  belongs_to :model, polymorphic: true

  scope :type, ->(type) { where(model_type: type) }

  TYPES = {
    contacts: {
      emails: {type: :text, hint: "Contact emails. Список через запятую", validate: {email_list: true}},
      seo_title: {type: :string, hint: "Seo title"},
      seo_description: {type: :text, hint: "Seo description"},
      text: {type: :text, hint: "Текст над формой", html: true},
      phones: {type: :string, hint: "Телефоны через запятую"},
      address: {type: :text, hint: 'Контактный адрес в левой панели'},
      skype: {type: :string},
      geo: {type: :string, hint: "Lat, Lng. Пример: 42.9, -98.3"}
    },
    global: {
      phone: { type: :string, hint: "Phone on footer", validate: {presence: true} },
      facebook: { type: :string, hint: "Facebook page link on footer", validate: {presence: true} },
      copyright: { type: :text, hint: "Copyright on footer" }
    },
    main: {
      title: { type: :string, hint: "Title on main page", validate: { presence: true } },
      description: { type: :text, hint: "Description on main page", validate: { presence: true } },
      seo_text: { type: :text, hint: "Seo text on bottom", html: true }
    },
    buy: {
      title: { type: :string, hint: "Title on buy page", validate: { presence: true } },
      description: { type: :text, hint: "Description on buy page", validate: { presence: true } },
      seo_text: { type: :text, hint: "Seo text on bottom" }
    },
    rent: {
      title: { type: :string, hint: "Title on rent page", validate: { presence: true } },
      description: { type: :text, hint: "Description on rent page", validate: { presence: true } },
      seo_text: { type: :text, hint: "Seo text on bottom" }
    }
  }

  def self.type_class_build(type)
    type = type.to_s.camelize

    class_eval <<TYPE
      class #{type} < Setting
        setup_fields
      end
TYPE
  end

  def self.fields
    TYPES[type_by_class_name.to_sym]
  end

  def fields
    self.class.fields
  end

  def self.type_by_class_name
    self.name.demodulize.underscore
  end

  def self.humanize_type
    type_by_class_name.humanize
  end

  def self.setup_fields
    store_accessor :value, fields.keys
    attr_accessible *fields.keys

    fields.each do |field, options|
      validates(field, options[:validate].clone) if options[:validate]
    end
  end

  def self.get(type)
    klass = "Setting::#{type.to_s.camelize}".constantize
    klass.first_or_initialize
  end
end

Setting::TYPES.keys.each { |type| Setting.type_class_build type }
