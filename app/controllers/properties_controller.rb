# encoding: utf-8
class PropertiesController < ApplicationController #< InheritedResources::Base
                                                   # has_scope :property_for, default: 'buy'
                                                   # custom_actions resource: :map, collection: :search
  include PropertiesHelper
  layout false, only: [:map, :offer, :offer_thanks]

  add_breadcrumb "Главная", :root_path

  def index
    @cities = City.all
    @properties = properties.limit(3)
    @settings = Setting.get(params[:property_for] || 'buy')
    path = params[:property_for] == 'rent' ? rent_search_path : buy_search_path
    title = params[:property_for] == 'rent' ? 'Аренда' : 'Покупка'
    add_breadcrumb title, path
  end

  def search
    # make_array
    [:property_type, :city_id, :to_sea].each {|param|
      if params[param].is_a? String
        params[param] = params[param].split(',')
      end
    }

    if params[:oid].present?
      redirect_to Property.find_by_oid(params[:oid]) if Property.exists?(oid: params[:oid])
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
      order_by :price, :asc

      paginate :page => params[:page], :per_page => 15
    end.results
    @seo_text =
      case
      when request.query_string.blank? then @settings.search_seo_text
      when params[:city_id].present? && params[:city_id].size == 1
        Setting.get(class: 'City', id: params[:city_id].first).search_seo_text
      end.try(:html_safe)

    path  = params[:property_for] == 'rent' ? rent_search_path : buy_search_path
    title = params[:property_for] == 'rent' ? 'Аренда' : 'Покупка'
    add_breadcrumb title, path
  end

  def show
    @property = Property.find(params[:id])
    @property.increment!(:count_of_views)
    @settings = Setting.get(@property)
    @paywall = @property.paywall
    path  = @property.property_for == 'rent' ? rent_search_path : buy_search_path
    title = @property.property_for == 'rent' ? 'Аренда' : 'Покупка'
    add_breadcrumb title, path
    add_breadcrumb @property.name, path
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: @property.name, template: 'properties/show_pdf', layout: 'pdf'
      end
    end
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
