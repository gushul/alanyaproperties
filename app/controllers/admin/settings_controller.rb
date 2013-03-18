class Admin::SettingsController < AdminController
  inherit_resources

  def edit
    link = [:admin, params[:settings_type], :settings]
    if request.post? || request.put?
      update! do |format|
        format.html { redirect_to url_for(link) + "?#{rand(10)}", notice: "Settings was successfully updated." }
      end
    else
      edit!
    end
  end

  protected
  def resource
    get_resource_ivar || set_resource_ivar(Setting.get(params[:settings_type]))
  end
end
