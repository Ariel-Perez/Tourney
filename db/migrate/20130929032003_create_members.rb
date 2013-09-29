class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :player_id
      t.integer :team_id
      t.integer :role_id

      t.timestamps
    end
  end
end
