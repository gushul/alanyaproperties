class ContactsController < ApplicationController
  before_filter :settings

  def index
  end

  def map
    lat, lng = @setting.geo.split(/\s*,\s*/)
    @property = OpenStruct.new lat: lat, lng: lng, name: ''

    render 'properties/map', layout: false
  end

  private
  def settings
    @setting = Setting.type('contacts').first
  end
end
