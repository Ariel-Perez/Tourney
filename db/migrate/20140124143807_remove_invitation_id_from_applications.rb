class RemoveInvitationIdFromApplications < ActiveRecord::Migration
  def change
    remove_column :applications, :invitation_id, :int
  end
end
