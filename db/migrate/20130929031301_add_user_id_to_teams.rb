class AddUserIdToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :user_id, :int
  end
end
