class WelcomeController < ApplicationController
  def index
    @properties = Property.on_main.order('RAND()').limit(4)
    @sliders = Slider.unscoped.slider_type('main').order('RAND()')
    @settings = Setting.get('main')
  end
end
