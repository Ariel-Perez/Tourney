# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  player_id  :integer
#  status     :integer
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

class Invitation < ActiveRecord::Base
  @@SENT = 1
  @@ACCEPTED = 2
  @@DECLINED = 0

  validates :team_id, presence: true
  validates :player_id, presence: true
  validates :status, presence: true, inclusion: [@@SENT, @@ACCEPTED, @@DECLINED]

  belongs_to :player
  belongs_to :team
  belongs_to :role

  def self.SENT
    @@SENT
  end
  def self.ACCEPTED
    @@ACCEPTED
  end
  def self.DECLINED
    @@DECLINED
  end
  
  def role_s
    if role
      role.name
    else
      'Any role'
    end
  end
end
