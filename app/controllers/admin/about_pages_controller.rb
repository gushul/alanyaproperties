class Admin::AboutPagesController < AdminController
  inherit_resources

  def create
    create! { admin_about_pages_path }
  end

  def update
    update! { admin_about_pages_path }
  end
end
