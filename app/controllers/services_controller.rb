class ServicesController < ApplicationController
  respond_to :html

  def index
    redirect_to Service.where(is_main: true).first || Service.first
  end

  def show
    @service = Service.find(params[:id])
    @settings = Setting.get('service_page', @service)

    respond_with @service
  end
end
