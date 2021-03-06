class Admin::SlidersController < AdminController
  inherit_resources

  has_scope :slider_type
  belongs_to :city, polymorphic: true, optional: true

  def create
    create! { parent? ? [:admin, parent, :sliders] : [:admin, params[:slider_type], :sliders] }
  end

  def update
    update! { parent? ? [:admin, parent, :sliders] : [:admin, params[:slider_type], :sliders] }
  end

  def sort
    Slider.transaction do
      params[:slider].each_with_index do |id, index|
        Slider.unscoped.where(id: id).update_all(position: index + 1)
      end
    end
    render nothing: true
  end

  protected
  def resource
    super.model_type = params[:slider_type] if params[:slider_type] && super.new_record?
    super
  end
end
