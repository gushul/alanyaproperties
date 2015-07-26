class Admin::PartnersController < AdminController
  # GET /admin/partners
  # GET /admin/partners.json
  def index
    @admin_partners = Admin::Partner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @admin_partners }
    end
  end

  # GET /admin/partners/1
  # GET /admin/partners/1.json
  def show
    @admin_partner = Admin::Partner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @admin_partner }
    end
  end

  # GET /admin/partners/new
  # GET /admin/partners/new.json
  def new
    @admin_partner = Admin::Partner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @admin_partner }
    end
  end

  # GET /admin/partners/1/edit
  def edit
    @admin_partner = Admin::Partner.find(params[:id])
  end

  # POST /admin/partners
  # POST /admin/partners.json
  def create
    @admin_partner = Admin::Partner.new(params[:partner])

    respond_to do |format|
      if @admin_partner.save
        format.html { redirect_to admin_partners_url, notice: 'Partner was successfully created.' }
        format.json { render json: @admin_partner, status: :created, location: @admin_partner }
      else
        format.html { render action: "new" }
        format.json { render json: @admin_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/partners/1
  # PUT /admin/partners/1.json
  def update
    @admin_partner = Admin::Partner.find(params[:id])

    respond_to do |format|
      if @admin_partner.update_attributes(params[:partner])
        format.html { redirect_to admin_partners_url, notice: 'Partner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin_partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/partners/1
  # DELETE /admin/partners/1.json
  def destroy
    @admin_partner = Admin::Partner.find(params[:id])
    @admin_partner.destroy

    respond_to do |format|
      format.html { redirect_to admin_partners_url }
      format.json { head :no_content }
    end
  end
end
