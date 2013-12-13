# == Schema Information
#
# Table name: memberships
#
#  id         :integer          not null, primary key
#  player_id  :integer
#  team_id    :integer
#  role_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Membership < ActiveRecord::Base
	belongs_to :player
	belongs_to :team
	belongs_to :role

  validates :player_id, presence: true
  validates :team_id, presence: true
end
