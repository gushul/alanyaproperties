class Admin::SlidersController < AdminController
  inherit_resources

  has_scope :slider_type

  def create
    create! { admin_sliders_path }
  end

  def update
    update! { admin_sliders_path }
  end

  protected
  def resource
    super.model_type = params[:slider_type] if params[:slider_type] && super.new_record?
    super
  end
end
