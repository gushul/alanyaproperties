class Admin::PropertiesController < AdminController
  before_filter :paywall, only: [:create, :update]
  respond_to :html
  inherit_resources

  def new
    build_resource.build_paywall_entity
    resource
  end

  def create
    build_resource.build_paywall_entity(paywall: @paywall)
    create! { admin_properties_path }
  end

  def update
    resource.build_paywall_entity(paywall: @paywall)
    update! { admin_properties_path }
  end

  protected
    def paywall
      @paywall = Paywall.find_by_id(params[:property].delete(:paywall))
    end

end
