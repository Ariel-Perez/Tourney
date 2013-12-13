# == Schema Information
#
# Table name: vacancies
#
#  id           :integer          not null, primary key
#  team_id      :integer
#  role_id      :integer
#  created_at   :datetime
#  updated_at   :datetime
#  requirements :text
#

class Vacancy < ActiveRecord::Base

  validates :team_id, presence: true

  belongs_to :team
  belongs_to :role

  has_many :applications

  def role_s
    if role
      role.name
    else
      'Any role'
    end
  end

end
