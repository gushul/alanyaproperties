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
    if params[:oid].present?
      redirect_to Property.find_by_oid(params[:oid]) if Property.exists?(oid: params[:oid])
      params[:oid] = nil
    end

    @settings = Setting.get(params[:property_for] || 'buy')
    @properties = Property.search do
      with(:property_for, params[:property_for] || 'buy')
      with(:city_id, params[:city_id]) if params[:city_id]
      with(:property_type, params[:property_type]) if params[:property_type]
      with(:price, price_range(params[:price], params[:percents])) unless params[:price].blank?
      with(:to_sea, params[:to_sea]) if params[:to_sea]
      with(:hot, true) if params[:hot]

      paginate :page => params[:page], :per_page => 9
    end.results
  end

  def show
    @property = Property.find(params[:id])
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
