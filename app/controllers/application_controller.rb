require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery

  before_filter :default_settings

  def default_settings
    @global_settings = Setting.get('global')
    params[:currency] ||= 'EUR'
  end
end
