class ReservationsController < ApplicationController
  def index
    # if request.post?
      @reservation = Reservation.where(oid: params[:oid]).first if params[:oid]
    # end
  end
end
