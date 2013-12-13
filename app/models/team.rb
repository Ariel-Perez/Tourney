# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  short_name :string(255)
#  created_at :datetime
#  updated_at :datetime
#  player_id  :integer
#

class Team < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :short_name, presence: true, uniqueness: true #, length: {in: 1..10}

  validates :player_id, presence: true

  belongs_to :player
  
  has_many :memberships
  has_many :players, through: :memberships

  has_many :vacancies
  has_many :invitations
  has_many :applications

  def recruit(player, role)
    player.join!(self, role)
  end

  def expel(player)
    player.leave!(self)
  end
end
