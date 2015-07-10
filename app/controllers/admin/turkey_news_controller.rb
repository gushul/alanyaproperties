class Admin::TurkeyNewsController < AdminController
  before_filter :paywall, only: [:create, :update]
  inherit_resources

  def new
    build_resource.build_paywall_entity
    resource
  end

  def create
    build_resource.build_paywall_entity(paywall: @paywall)
    create! { admin_turkey_news_index_path }
  end

  def update
    resource.build_paywall_entity(paywall: @paywall)
    update! { admin_turkey_news_index_path }
  end

  protected
    def collection
      @turkey_news ||= end_of_association_chain.where(article_type: nil)
    end

    def paywall
      @paywall = Paywall.find_by_id(params[:turkey_news].delete(:paywall))
    end
end
