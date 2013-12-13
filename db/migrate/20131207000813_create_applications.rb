class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :team_id
      t.integer :player_id
      t.integer :status
      t.text :message
      t.timestamps
    end
  end
end
