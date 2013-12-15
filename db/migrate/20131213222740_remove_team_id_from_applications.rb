class RemoveTeamIdFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :team_id, :int
  end
end
