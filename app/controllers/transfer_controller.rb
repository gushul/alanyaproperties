class TransferController < ApplicationController
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
    logger.info params[:transfer].except(exclude).inspect
    @transfer = Transfer.new(params[:transfer].except(exclude))

    if @transfer.save
      redirect_to thanks_transfer_index_path
    else
      render :index
    end
  end
end
