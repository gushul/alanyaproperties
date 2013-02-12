class Admin::PropertyAttributesController < AdminController
  inherit_resources

  def create
    create! { admin_property_attributes_path }
  end

  def update
    update! { admin_property_attributes_path }
  end

  def sort
    PropertyAttribute.transaction do
      params[:property_attribute].each_with_index do |id, index|
        PropertyAttribute.unscoped.where(id: id).update_all(position: index + 1)
      end
    end
    render nothing: true
  end
end
