class PropertiesController < InheritedResources::Base
  has_scope :property_for, default: 'buy'
  custom_actions resource: :map
  layout false, only: :map

  def index
    index! do
      @cities = City.all
    end
  end

end
