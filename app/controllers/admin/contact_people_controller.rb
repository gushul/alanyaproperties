class Admin::ContactPeopleController < AdminController
  inherit_resources

  def create
    create! { admin_contact_people_path }
  end

  def update
    update! { admin_contact_people_path }
  end
end
