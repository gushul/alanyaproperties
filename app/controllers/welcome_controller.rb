class WelcomeController < ApplicationController
  def index
    @hot_offers_property = HotOffer.properties.published.includes(:offerable).shuffle
    @hot_offers_cities   = HotOffer.cities.published.includes(:offerable).shuffle
    @properties = Property.hot.order('RAND()').limit(4)
    @sliders = Slider.unscoped.slider_type('main').order('RAND()')
    @settings = Setting.get('main')
  end
end
