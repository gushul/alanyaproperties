class WelcomeController < ApplicationController
  def index
    @properties = Property.order('RAND()').limit(4)
    @sliders = Slider.slider_type('main')
    @settings = Setting.get('main')
  end
end
