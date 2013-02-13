class ServicesController < InheritedResources::Base
  actions :show

  def index
    redirect_to Service.where(is_main: true).first || Service.first
  end
end
