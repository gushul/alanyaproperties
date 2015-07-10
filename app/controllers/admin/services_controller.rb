class Admin::ServicesController < AdminController
  inherit_resources

  def create
    create! { admin_services_path }
  end

  def update
    update! { admin_services_path }
  end
end
