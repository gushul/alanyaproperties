# encoding: utf-8

class Admin::HotOffers::PropertiesController < AdminController
  before_filter :set_resource, only: [:show, :destroy, :edit, :update]

  def index
    @resources = resource.send(controller_name)
  end

  def show
  end

  def destroy
    if @resource.destroy
      flash[:warning] = 'Плашка удалена'
    else
      flash[:alert] = 'Возникли ошибки'
    end

    redirect_to [:admin, :hot_offers, controller_name]
  end

  def new
    @resource = resource.new
  end

  def edit
  end

  def update
    if params[:hot_offer] && params[:hot_offer][:offerable]
      offerable = parent.find(params[:hot_offer].delete(:offerable))
      @resource.offerable = offerable
    end
    if @resource.update_attributes(params[:hot_offer])
      flash[:success] = 'Плашка обновлена'
      redirect_to [:admin, :hot_offers, controller_name]
    else
      flash[:alert] = 'Возникли ошибки'
      render :edit
    end
  end

  def create
    @resource = resource.new
    if params[:hot_offer] && params[:hot_offer][:offerable]
      offerable = parent.find(params[:hot_offer].delete(:offerable))
      @resource = resource.new params[:hot_offer]
      @resource.offerable = offerable
    end
    if @resource.save
      flash[:success] = 'Плашка создана'
      redirect_to [:admin, :hot_offers, controller_name]
    else
      flash[:alert] = 'Возникли ошибки'
      render :new
    end
  end

  private
    def set_resource
      @resource ||= resource.find(params[:id])
    end

    def set_offerable
    end

    def resource
      HotOffer
    end

    def parent
      controller_name.classify.constantize
    end
end
