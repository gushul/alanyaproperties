class Admin::PropertiesController < AdminController
  respond_to :html
  inherit_resources

  def create
    create! { admin_properties_path }
  end

  def update
    update! { admin_properties_path }
  end

end
