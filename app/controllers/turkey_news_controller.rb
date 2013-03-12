# encoding: UTF-8
class TurkeyNewsController < InheritedResources::Base
  respond_to :html
  respond_to :atom, :rss, only: :index

  def index
    @sliders = Slider.slider_type('turkey_news')
    super do |format|
      format.atom do
        @title = "Новости Турции, Алании и других городов побережья средиземного моря"
        @updated_at = @turkey_news.first.updated_at unless @turkey_news.blank?

        render layout: false

      end
      format.rss { redirect_to news_path }
    end
  end
end
