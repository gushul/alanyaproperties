class Admin::SlidersController < AdminController
  inherit_resources

  has_scope :slider_type

  protected
  def resource
    super.model_type(params[:slider_type]) if params[:slider_type]
    super
  end
end
