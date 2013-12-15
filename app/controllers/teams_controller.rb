class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :members]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @captain = @team.player
    @memberships = @team.memberships
    @vacancies = @team.vacancies
    @applications = @team.applications
    @invitations = @team.invitations

    @is_captain = validate_user(@captain.id) 
    @is_member = !!(current_user and Membership.find_by(player_id: current_user.id, team_id: @team.id))
    
    if current_user
      @membership = Membership.find_by(player_id: current_user.id, team_id: @team.id)
    end

    @vacancy = Vacancy.new(team_id: @team.id)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        format.html { render action: 'new' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end

    @membership = Membership.new(team_id: @team.id, player_id: @team.player_id)
    @membership.save
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  
  def members
    @roles = Role.all
    @players = Player.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :short_name, :player_id)
    end
end
