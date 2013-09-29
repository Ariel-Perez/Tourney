class RemoveRoleFromPlayers < ActiveRecord::Migration
  
  def up
  	remove_column :players, :role
  end
  def down
    add_column :players, :role, :string
  end
end
