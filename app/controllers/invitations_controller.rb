class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:destroy, :show, :accept, :decline]

  def create
    @invitation = Invitation.new(invitation_params)
    @invitation.save!

    back
  end

  def destroy
    @invitation.destroy!
    back
  end

  def show
  end

  def accept
    @team = @invitation.team
    @player = @invitation.player

    @role = @invitation.role

    @membership = Membership.new(team_id: @team.id, player_id: @player.id)
    @membership.role = @role
    @membership.save!

    @invitation.destroy!
    
    redirect_to team_path(@team)
  end

  def decline
    @invitation.status = Invitation.DECLINED
    @invitation.save!
    
    redirect_to invitations_player_path(@invitation.player)
  end

  private
    def invitation_params
      params.require(:invitation).permit(:team_id, :player_id, :role_id, :status, :message)
    end

    def set_invitation
      @invitation = Invitation.find(params[:id])
    end
end
