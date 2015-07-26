class PartnersController < ApplicationController
  def index
    @partners = Partner.all
    @message = ContactMessage.new
  end

end
