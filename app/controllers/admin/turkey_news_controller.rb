class Admin::TurkeyNewsController < AdminController
  inherit_resources

  def create
    create! { admin_turkey_news_index_path }
  end

  def update
    update! { admin_turkey_news_index_path }
  end

  protected
  def collection
    @turkey_news ||= end_of_association_chain.where(article_type: nil)
  end

end
