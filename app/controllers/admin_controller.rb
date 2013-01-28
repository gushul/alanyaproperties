class AdminController < ApplicationController
  before_filter :authenticate_admin!
  def index
    redirect_to admin_dashboard_path
  end

  def dashboard
  end
end
