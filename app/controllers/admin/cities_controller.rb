class Admin::CitiesController < AdminController
  inherit_resources

  def create
    create! { admin_cities_path }
  end

  def update
    update! { admin_cities_path }
  end
end
