# encoding: utf-8
require 'email_list_validator'

class Setting < ActiveRecord::Base
  store :value
  attr_accessible :key, :model_id, :model_type, :value
  belongs_to :model, polymorphic: true

  scope :type, ->(type) { where(model_type: type) }
  scope :model, ->(model) { where(model_type: model.class.to_s, model_id: model.id) if model }

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
      seo_title: { type: :string, hint: "Title over seo text on bottom" },
      seo_text: { type: :text, hint: "Seo text on bottom", html: true }
    },
    buy: {
      title: { type: :string, hint: "Title on buy page", validate: { presence: true } },
      description: { type: :text, hint: "Description on buy page", validate: { presence: true } },
      search_description: { type: :text, hint: "Description on buy page", validate: { presence: true } },
      seo_text: { type: :text, hint: "Seo text on bottom", html: true },
      search_seo_text: { type: :text, hint: "Seo text on bottom on search page", html: true }
    },
    rent: {
      title: { type: :string, hint: "Title on rent page", validate: { presence: true } },
      description: { type: :text, hint: "Description on rent page", validate: { presence: true } },
      search_description: { type: :text, hint: "Description on buy page", validate: { presence: true } },
      seo_text: { type: :text, hint: "Seo text on bottom", html: true },
      search_seo_text: { type: :text, hint: "Seo text on bottom on search page", html: true }
    },
    transfer: {
      title: { type: :string, hint: "Title on transfer page", validate: { presence: true } },
      description: { type: :text, hint: "Description on transfer page", validate: { presence: true } },
      seo_text: { type: :text, hint: "Seo text on bottom", html: true }
    },
    reservation: {
      title: { type: :string, hint: "Title on reservation page", validate: { presence: true } },
      description: { type: :text, hint: "Description on reservation page", validate: { presence: true } },
      seo_text: { type: :text, hint: "Seo text on bottom" }
    },
    # about_pages: { # deprecated
      # title: { type: :string, hint: "Title on about turkey page", validate: { presence: true } },
      # description: { type: :text, hint: "Description on about turkey page", validate: { presence: true } },
      # seo_text: { type: :text, hint: "Seo text on bottom", html: true }
    # },
    about_page: {
      title: { type: :string, hint: "Title on AboutPage", validate: { presence: true } },
      description: { type: :text, hint: "Description on AboutPage", validate: { presence: true } }
    },
    service_page: {
      title: { type: :string, hint: "Title on service page", validate: { presence: true } },
      description: { type: :text, hint: "Description on service page", validate: { presence: true } },
    },
    city: {
      title: { type: :string, hint: "Title on city page", validate: { presence: true } },
      description: { type: :text, hint: "Description on city page", validate: { presence: true } },
      search_seo_text: { type: :text, hint: "Seo text on bottom on search page", html: true }
    },
    turkey_news_index: {
      title: { type: :string, hint: "Title on about turkey page", validate: { presence: true } },
      description: { type: :text, hint: "Description on about turkey page", validate: { presence: true } },
      seo_text: { type: :text, hint: "Seo text on bottom", html: true }
    },
    turkey_news: {
      title: { type: :string, hint: "Title on turkey news page", validate: { presence: true } },
      description: { type: :text, hint: "Description on turkey news page", validate: { presence: true } }
    },
    property: {
      title: { type: :string, hint: "Title on property page. Leave blank for default title", validate: { presence: false } },
      description: { type: :text, hint: "Description on property page. Leav blank for default description", validate: { presence: false } }
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

  # Get settings of type
  # @contcact_settings = Setting.get('Contacts') => #<Setting::Contacts:0x007fd63d4939d0> from db or new if not excist
  #
  # @city = City.find(1)
  # @city_settings = Setting.get(@city)
  # or
  # @city_settings = Setting.get(class: 'City', id: 1)
  #
  # Also
  # @settings = Setting.get('some_type', Model.new)
  #
  # TODO: need test
  #
  def self.get(params, m = nil)
    case params
    when String, Symbol
      type = params.to_s
    when ActiveRecord::Base
      type = params.class.to_s
      m = params
    when Hash
      params.symbolize_keys!

      type = params[:class]
      m = Setting::LazyModel.new params
    end

    logger.info params.inspect
    klass = "Setting::#{type.camelize}".constantize
    klass.model(m).first_or_initialize
  end
end

# Lazy Model
class Setting::LazyModel
  attr_accessor :class, :id
  def initialize(options = {})
    @class = options[:class]
    @id = options[:id]
  end
end

Setting::TYPES.keys.each { |type| Setting.type_class_build type }
