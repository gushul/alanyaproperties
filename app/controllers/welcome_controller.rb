class WelcomeController < ApplicationController
  def index
    @properties = Property.order('RAND()').limit(4)
  end
end
