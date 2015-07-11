class TourController < ApplicationController
  #before_filter :settings

  def index

  end

  private
  def settings
    @setting = Setting.get('tour')
  end
end
