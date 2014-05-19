class WelcomeController < ApplicationController
  def index
    @properties = Property.on_main.order('RAND()').limit(4)
    @sliders = Slider.slider_type('main')
    @settings = Setting.get('main')
  end
end
