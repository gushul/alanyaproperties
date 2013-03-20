class Admin::ReservationsController < AdminController
    inherit_resources

    belongs_to :property, optional: true
end
