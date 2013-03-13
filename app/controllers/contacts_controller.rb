class ContactsController < ApplicationController
  before_filter :settings

  def index
    @message = ContactMessage.new
  end

  def map
    lat, lng = @setting.geo.split(/\s*,\s*/)
    @property = OpenStruct.new lat: lat, lng: lng, name: ''

    render 'properties/map', layout: false
  end

  def send_message

    @message = ContactMessage.new(params[:contact_message])

    if @message.save
      redirect_to contacts_thanks_path
    else
      render 'index'
    end
  end

  private
  def settings
    @setting = Setting.get('contacts')
  end
end
