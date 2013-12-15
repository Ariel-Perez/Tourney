class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:destroy, :show]

  def create
    @vacancy = Vacancy.new(vacancy_params)
    @vacancy.save!

    redirect_to team_path(@vacancy.team)
  end

  def show
    @applications = @vacancy.pending_applications
    @team = @vacancy.team

    @in_team = !!(current_user and Membership.find_by(player_id: current_user.id, team_id: @team.id))
    @my_app = current_user ? Application.find_by(player_id: current_user.id, vacancy_id: @vacancy.id) : []


    @can_apply = !!(current_user and !@in_team and !@my_app)
    
    if @can_apply
      @application = Application.new(vacancy_id: @vacancy.id, player_id: current_user.id)
    end
  end

  def destroy
    @vacancy.destroy!
    redirect_to team_path(@vacancy.team)
  end

  private
    def vacancy_params
      params.require(:vacancy).permit(:team_id, :role_id, :requirements)
    end

    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end
end
