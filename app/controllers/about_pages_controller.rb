class AboutPagesController < InheritedResources::Base
  before_filter :sliders
  actions :show

  def index
    redirect_to AboutPage.where(default: true).first || AboutPage.first
  end

  def show
    show! do
      @settings = Setting.get(@about_page)
    end
  end

  def sliders
    @sliders = Slider.slider_type('about_pages')
  end
end
