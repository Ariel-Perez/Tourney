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

  validates :team_id, presence: true
  validates :player_id, presence: true
  validates :status, presence: true, inclusion: 0..2

  belongs_to :player
  belongs_to :team

  has_many :roles

end
