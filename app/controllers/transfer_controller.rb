class TransferController < ApplicationController
  before_filter :settings

  def index
    @transfer = Transfer.new
  end

  def create
    case params[:transfer][:transfer_type]
    when 'in'
      exclude = :out_attributes
    when 'out'
      exclude = :in_attributes
    end
    @transfer = Transfer.new(params[:transfer].except(exclude))

    if @transfer.save
      redirect_to thanks_transfer_index_path
    else
      render :index
    end
  end

  private
  def settings
    @settings = Setting.get('transfer')
  end
end
