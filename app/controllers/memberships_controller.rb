class MembershipsController < ApplicationController
  before_action :set_membership, only: [:destroy, :show]

  def create
    @membership = Membership.create(membership_params)
    @membership.save!

    app = Application.where(player_id: @membership.player_id, team_id: @membership.player_id)
    if @membership.role 
      app = app.where(id: app.joins(:vacancies))
    end
    back
  end

  def show
  end

  def destroy
    @team = @membership.team
    @player = @membership.player

    if @team.player_id != @player.id
      @membership.destroy!
    end
    
    back
  end

  private
    def set_membership
      @membership = Membership.find(params[:id])
    end

    def membership_params
      params.require(:membership).permit(:team_id, :player_id, :role_id)
    end
end
