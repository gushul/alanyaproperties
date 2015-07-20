class Admin::ManagerPeopleController < AdminController
  # GET /manager_people
  # GET /manager_people.json
  def index
    @manager_people = ManagerPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @manager_people }
    end
  end

  # GET /manager_people/1
  # GET /manager_people/1.json
  def show
    @manager_person = ManagerPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @manager_person }
    end
  end

  # GET /manager_people/new
  # GET /manager_people/new.json
  def new
    @manager_person = ManagerPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @manager_person }
    end
  end

  # GET /manager_people/1/edit
  def edit
    @manager_person = ManagerPerson.find(params[:id])
  end

  # POST /manager_people
  # POST /manager_people.json
  def create
    @manager_person = ManagerPerson.new(params[:manager_person])

    respond_to do |format|
      if @manager_person.save
        format.html { redirect_to admin_manager_people_path, notice: 'Manager person was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /manager_people/1
  # PUT /manager_people/1.json
  def update
    @manager_person = ManagerPerson.find(params[:id])

    respond_to do |format|
      if @manager_person.update_attributes(params[:manager_person])
        format.html { redirect_to admin_manager_people_path, notice: 'Manager person was successfully created.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /manager_people/1
  # DELETE /manager_people/1.json
  def destroy
    @manager_person = ManagerPerson.find(params[:id])
    @manager_person.destroy

    respond_to do |format|
      format.html { redirect_to admin_manager_people_url }
      format.json { head :no_content }
    end
  end
end
