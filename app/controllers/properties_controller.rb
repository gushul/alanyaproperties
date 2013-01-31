class PropertiesController < InheritedResources::Base
  has_scope :property_for, default: 'buy'

  def index
    index! do
      @cities = City.all
    end
  end
end
