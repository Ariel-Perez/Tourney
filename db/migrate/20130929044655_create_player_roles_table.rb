class CreatePlayerRolesTable < ActiveRecord::Migration
  def change
    create_table :player_roles_tables do |t|
    	t.integer :player_id
    	t.integer :role_id

    	t.timestamps
    end
  end
end
