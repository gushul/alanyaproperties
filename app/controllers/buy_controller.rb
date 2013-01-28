class BuyController < ApplicationController
  def index
    @cities = City.order('name').all
  end
end
