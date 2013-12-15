class AddRoleIdToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :role_id, :int
  end
end
