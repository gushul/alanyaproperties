class Admin::AboutPagesController < AdminController
  before_filter :paywall, only: [:create, :update]
  inherit_resources

  def new
    build_resource.build_paywall_entity
    resource
  end

  def create
    build_resource.build_paywall_entity(paywall: @paywall)
    create! { admin_about_pages_path }
  end

  def update
    resource.build_paywall_entity(paywall: @paywall)
    update! { admin_about_pages_path }
  end

  protected
    def paywall
      @paywall = Paywall.find_by_id(params[:about_page].delete(:paywall))
    end
end
