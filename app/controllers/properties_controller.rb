class PropertiesController < ApplicationController #< InheritedResources::Base
                                                   # has_scope :property_for, default: 'buy'
                                                   # custom_actions resource: :map, collection: :search
  include PropertiesHelper
  layout false, only: [:map, :offer, :offer_thanks]

  def index
    @cities = City.all
    @properties = properties.limit(3)
    @settings = Setting.get(params[:property_for] || 'buy')
  end

  def search
    logger.info request.env.inspect
    # make_array
    [:property_type, :city_id, :to_sea].each {|param|
      if params[param].is_a? String
        params[param] = params[param].split(',')
      end
    }

    if params[:oid].present?
      redirect_to Property.find_by_oid(parms[:oid]) if Property.exists?(oid: params[:oid])
      params[:oid] = nil
    end

    @settings = Setting.get(params[:property_for] || 'buy')
    @properties = Property.search do
      with(:property_for, params[:property_for] || 'buy')
      with(:city_id, params[:city_id]) if params[:city_id].present?
      with(:property_type, params[:property_type]) if params[:property_type].present?
      with(:price, price_range(params[:price], params[:percents])) if params[:price].present?
      with(:to_sea, params[:to_sea]) if params[:to_sea].present?
      with(:hot, true) if params[:hot].present?

      paginate :page => params[:page], :per_page => 9
    end.results
    @seo_text =
      case
      when request.query_string.blank? then @settings.search_seo_text
      when params[:city_id].present? && params[:city_id].size == 1
        Setting.get(class: 'City', id: params[:city_id].first).search_seo_text
      end.try(:html_safe)
  end

  def show
    @property = Property.find(params[:id])
    @settings = Setting.get(@property)
  end

  def map
    @property = Property.find(params[:id])
  end

  def offer
    @property = Property.find(params[:id])

    @offer = ContactMessage.new(params[:contact_message])
    @offer.property = @property

    if request.post?
      if @offer.save
        redirect_to properties_offer_thanks_path
      end
    end
  end

  def properties
    @properties ||= Property.property_for(params[:property_for] || 'buy')
  end

  private
  def price_range(price, percent)
    price = price.to_i
    percent = percent.to_i
    offset = (price/100) * percent
    (price - offset)..(price + offset)
  end
end
