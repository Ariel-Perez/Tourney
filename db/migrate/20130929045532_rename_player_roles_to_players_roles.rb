class RenamePlayerRolesToPlayersRoles < ActiveRecord::Migration
  def change
  	rename_table :player_roles_tables, :players_roles
  end
end
