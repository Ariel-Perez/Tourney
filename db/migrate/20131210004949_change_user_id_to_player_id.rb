class ChangeUserIdToPlayerId < ActiveRecord::Migration
  def change
    rename_column :teams, :user_id, :player_id
  end
end
