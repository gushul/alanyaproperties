class SearchController < ApplicationController
  def index
    @properties_buy = []
    @properties_rent = []

    if params[:type].blank? || params[:type] == 'all'
      @cities = City.search do
        fulltext params[:q]
        paginate page: params[:page], per_page: 1
      end.results

      @pager = @cities if @pager.blank? || @pager.total_pages < @cities.total_pages
    end

    if params[:type].blank? || params[:type] == 'all'
      @articles = TurkeyNews.search do
        fulltext params[:q]
        paginate page: params[:page], per_page: 1
      end.results

      @pager = @articles if @pager.blank? || @pager.total_pages < @articles.total_pages
    end

    if params[:type].blank? || params[:type] == 'all' || params[:type] == 'buy' || params[:type] == 'id'
      @properties_buy = Property.search do
        if params[:type] == 'id'
          with :oid, params[:q].upcase
        else
          fulltext params[:q]
        end
        with :property_for, 'buy'
        paginate :page => params[:page], :per_page => 3
      end.results
      @pager = @properties_buy if @pager.blank? || @pager.total_pages < @properties_buy.total_pages
    end
    if params[:type].blank? || params[:type] == 'all' || params[:type] == 'rent' || params[:type] == 'id'
      @properties_rent = Property.search do
        if params[:type] == 'id'
          with :oid, params[:q]
        else
          fulltext params[:q]
        end

        with :property_for, 'rent'
        paginate :page => params[:page], :per_page => 3
      end.results
      @pager = @properties_rent if @pager.blank? || @pager.total_pages < @properties_rent.total_pages
    end

    # @pager = @properties_rent
  end
end
