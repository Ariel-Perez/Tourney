class MembershipsController < ApplicationController
  def create
  	@team = Team.find(params[:membership][:team_id])
  	@player = Player.find(params[:membership][:player_id])
  	@role = Role.find(params[:membership][:role_id])

  	@team.recruit(@player, @role)
  	redirect_to members_team_path(@team)
  end

  def destroy
  	@team = Membership.find(params[:id]).team
  	@player = Membership.find(params[:id]).player

  	@team.expel(@player)
    redirect_to members_team_path(@team)
  end
end
