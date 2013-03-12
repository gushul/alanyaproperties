class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :default_settings

  def default_settings
    @global_settings = Setting.get('global')
    params[:currency] ||= 'EUR'
  end
end
