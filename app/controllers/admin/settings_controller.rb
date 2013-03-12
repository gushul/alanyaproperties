class Admin::SettingsController < AdminController
  inherit_resources

  def edit
    link = [:admin, params[:settings_type], :settings]
    if request.post?
      create! { link }
    elsif request.put?
      update! { link }
    else
      edit!
    end
  end

  protected
  def resource
    get_resource_ivar || set_resource_ivar(Setting.get(params[:settings_type]))
  end
end
