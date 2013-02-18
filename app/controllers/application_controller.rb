class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :default_settings

  def default_settings
    params[:currency] ||= 'EUR'
  end
end
