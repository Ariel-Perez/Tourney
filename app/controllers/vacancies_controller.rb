class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:destroy, :show]

  def create
    @vacancy = Vacancy.new(vacancy_params)
    @vacancy.save!
    redirect_to team_path(@vacancy.team)
  end

  def show
    @applications = @vacancy.applications
    @team = @vacancy.team
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
