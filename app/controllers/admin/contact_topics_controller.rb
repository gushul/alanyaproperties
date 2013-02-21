class Admin::ContactTopicsController < AdminController
  inherit_resources

  def create
    create! { admin_contact_topics_path }
  end

  def update
    update! { admin_contact_topics_path }
  end
end
