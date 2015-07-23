class Admin::TeamsController < AdminController
  # GET /admin/teams
  # GET /admin/teams.json
  def index
    @team_members = TeamMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: s }
    end
  end

  # GET /admin/teams/1
  # GET /admin/teams/1.json
  def show
     @team_member = TeamMember(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json:  }
    end
  end

  # GET /admin/teams/new
  # GET /admin/teams/new.json
  def new
    @team_member = TeamMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json:  }
    end
  end

  # GET /admin/teams/1/edit
  def edit
    @team_member = TeamMember.find(params[:id])
  end

  # POST /admin/teams
  # POST /admin/teams.json
  def create
    @team_member = TeamMember.new(params[:admin_team])

    respond_to do |format|
      if @team_member.save
        format.html { redirect_to admin_teams_path, notice: 'Team was successfully created.' }
        format.json { render json: , status: :created, location:  }
      else
        format.html { render action: "new" }
        format.json { render json: .errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/teams/1
  # PUT /admin/teams/1.json
  def update
     @team_member = TeamMember.find(params[:id])

    respond_to do |format|
      if @team_member.update_attributes(params[:admin_team])
        format.html { redirect_to admin_teams_path, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: .errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/teams/1
  # DELETE /admin/teams/1.json
  def destroy
    @team_member = TeamMember.find(params[:id])
    @team_member.destroy

    respond_to do |format|
      format.html { redirect_to admin_teams_url }
      format.json { head :no_content }
    end
  end
end
