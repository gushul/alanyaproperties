class Admin::PhotosController < AdminController
  inherit_resources
  respond_to :html, :json
  belongs_to :property, :city, polymorphic: true
  custom_actions collection: :sort

  def update
    update! { url_for [:admin, parent, :photos] }
  end

  def create
    create! do |format|
      format.js { render :create }
    end
  end

  def sort
    collection.each_with_index do |photo, i|
      photo.update_attribute(
        :position, params[:current_ids].index(photo.id.to_s)
      )
    end
    render json: collection
  end
end
