# encoding: utf-8
class ServicesController < ApplicationController
  respond_to :html

  add_breadcrumb "Главная", :root_path

  def index
    redirect_to Service.where(is_main: true).first || Service.first
  end

  def show
    @service = Service.find(params[:id])
    @settings = Setting.get('service_page', @service)
    @service.increment!(:count_of_views)

    add_breadcrumb 'Услуги', services_path
    add_breadcrumb @service.name, service_path

    respond_with @service
  end
end
