class Admin::TurkeyNewsController < AdminController
  inherit_resources

  def create
    create! { admin_turkey_news_index_path }
  end

  def update
    update! { admin_turkey_news_index_path }
  end
end
