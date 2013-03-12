class WelcomeController < ApplicationController
  def index
    @properties = Property.order('RAND()').limit(4)
    @sliders = Slider.slider_type('main')
  end
end
