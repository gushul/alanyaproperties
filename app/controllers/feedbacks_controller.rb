class FeedbacksController < ApplicationController

  def index
    @comments = Feedback.find(:all, :order => "created_at desc")
    @message = Feedback.new
  end

  def create
    @message = Feedback.new(params[:feedback])
     if @message.save
      redirect_to feedbacks_thanks_path
    else
      render 'index'
    end
  end

end
