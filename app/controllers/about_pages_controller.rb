class AboutPagesController < InheritedResources::Base
  actions :show

  def index
    redirect_to AboutPage.where(default: true).first || AboutPage.first
  end
end
