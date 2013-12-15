# == Schema Information
#
# Table name: applications
#
#  id            :integer          not null, primary key
#  player_id     :integer
#  status        :integer
#  message       :text
#  created_at    :datetime
#  updated_at    :datetime
#  invitation_id :integer
#  vacancy_id    :integer
#

class Application < ActiveRecord::Base

  @@SENT = 1
  @@ACCEPTED = 2
  @@REJECTED = 0

  validates :vacancy_id, presence: true
  validates :player_id, presence: true
  validates :status, presence: true, inclusion: [@@SENT, @@ACCEPTED, @@REJECTED]

  belongs_to :player
  belongs_to :vacancy

  def self.SENT
    @@SENT
  end
  def self.ACCEPTED
    @@ACCEPTED
  end
  def self.REJECTED
    @@REJECTED
  end
end
