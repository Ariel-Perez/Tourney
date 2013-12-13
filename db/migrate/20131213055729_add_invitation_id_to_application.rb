class AddInvitationIdToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :invitation_id, :int
  end
end
