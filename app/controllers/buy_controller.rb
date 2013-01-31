class BuyController < ApplicationController
  def index
    @cities = City.order('name').all
    @properties = Property.where(property_for: 'buy').all
  end
end
