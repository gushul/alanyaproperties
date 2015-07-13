class TourController < ApplicationController
  before_filter :settings

  def index
    @message = ContactMessage.new
  end

  def send_message

  end

  private
  def settings
    @setting = Setting.get('contacts')
  end
end
