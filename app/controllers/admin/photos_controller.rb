class Admin::PhotosController < AdminController
  inherit_resources
  belongs_to :property, :city, polymorphic: true

  def update
    update! { url_for [:admin, parent, :photos] }
  end

  def create
    create! do |format|
      format.js { render :create }
    end
  end
end
