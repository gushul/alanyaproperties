# encoding: utf-8
class AboutPagesController < InheritedResources::Base
  before_filter :sliders
  actions :show

  add_breadcrumb "Главная", :root_path

  def index
    add_breadcrumb 'О нас', about_pages_path
    redirect_to AboutPage.where(default: true).first || AboutPage.first
  end

  def show
    add_breadcrumb 'О нас', about_pages_path
    add_breadcrumb resource.title, about_page_path
    show! do
      @settings = Setting.get(@about_page)
    end
  end

  def sliders
    @sliders = Slider.slider_type('about_pages')
  end
end
