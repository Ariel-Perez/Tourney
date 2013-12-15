class ApplicationsController < ApplicationController
  before_action :set_application, only: [:destroy, :show]

  def create
    @application = Application.new(application_params)
    @application.save!

    redirect_to vacancy_path(@application.vacancy)
  end

  def destroy
    @vacancy.destroy!
  end

  def show
    @vacancy = @application.vacancy
    @team = @vacancy.team
    @player = @application.player
  end

  private
    def application_params
      params.require(:application).permit(:vacancy_id, :player_id, :message, :status)
    end

    def set_application
      @application = Application.find(params[:id])
    end
end
