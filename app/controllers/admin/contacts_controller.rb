class Admin::ContactsController < AdminController
  def settings
    @setting = Setting.type('contacts').first || Setting.new(property_type: 'contacts')

    if request.put?
      if @setting.update_attributes(params[:setting])
        redirect_to :back, notice: 'Settings updated'
      end
    end
  end
end
