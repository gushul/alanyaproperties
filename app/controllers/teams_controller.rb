class TeamsController < ApplicationController
  def index
    @members = TeamMember.all
    @message = ContactMessage.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

end
