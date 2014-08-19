class Admin::CitiesController < AdminController
  before_filter :paywall, only: [:create, :update]
  inherit_resources

  def new
    build_resource.build_paywall_entity
    resource
  end

  def create
    build_resource.build_paywall_entity(paywall: @paywall)
    create! { admin_cities_path }
  end

  def update
    resource.build_paywall_entity(paywall: @paywall)
    update! { admin_cities_path }
  end

  protected
    def paywall
      @paywall = Paywall.find_by_id(params[:city].delete(:paywall))
    end
end
