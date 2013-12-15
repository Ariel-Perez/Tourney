class ApplicationsController < ApplicationController
  before_action :set_application, only: [:destroy, :show, :accept, :reject]

  def create
    @application = Application.new(application_params)
    @application.save!

    redirect_to vacancy_path(@application.vacancy)
  end

  def destroy
    @application.destroy!
  end

  def show
    @vacancy = @application.vacancy
    @team = @vacancy.team
    @player = @application.player
  end

  def accept
    @application.accept
    @application.status = Application.ACCEPTED
    @application.save!

    other_vacancy_ids = Vacancy.where(team_id: @application.vacancy.team_id).pluck(:id)
    other_applications = Application.where(player_id: @application.player_id, vacancy_id: other_vacancy_ids)
    other_applications.each do |a|
      a.destroy
    end

    vacancy = @application.vacancy
    vacancy.destroy

    back
  end

  def reject
    @application.status = Application.REJECTED
    @application.save!

    back
  end

  private
    def application_params
      params.require(:application).permit(:vacancy_id, :player_id, :message, :status)
    end

    def set_application
      @application = Application.find(params[:id])
    end
end
