class Admin::UsersController < AdminController
  inherit_resources
  defaults :resource_class => Admin, :collection_name => 'users', :instance_name => 'user'

  def create
    create! { admin_users_path }
  end

  def update
    if params[:admin][:password].blank?
      params[:admin].delete(:password)
      params[:admin].delete(:password_confirmation)
    end

    update! { admin_users_path }
  end
end
