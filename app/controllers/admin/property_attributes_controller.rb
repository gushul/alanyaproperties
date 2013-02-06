class Admin::PropertyAttributesController < AdminController
  inherit_resources

  def create
    create! { admin_property_attributes_path }
  end

  def update
    update! { admin_property_attributes_path }
  end

  def sort
    params[:property_attribute].each_with_index do |id, index|
      PropertyAttribute.update_all({position: index + 1}, {id: id})
    end
    render nothing: true
  end
end
