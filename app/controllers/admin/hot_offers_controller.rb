class Admin::HotOffersController < AdminController

  def index
    raise params.inspect
    #@resources = HotOffer.send(
  end

  private
    def set_resource
      @resource ||= resource.find(params[:id])
    end

    def set_offerable
      if params[:hot_offer] && params[:hot_offer][:offerable]
        offerable = parent.find(params[:hot_offer][:offerable])
        @resource.offerable = offerable
      end
    end

    def resource
      HotOffer
    end

    def parent
      controller_name.classify.constantize
    end
end
