# == Schema Information
#
# Table name: players
#
#  id              :integer          not null, primary key
#  nick            :string(255)
#  first_name      :string(255)
#  last_name       :string(255)
#  country         :string(255)
#  birth_date      :date
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Player < ActiveRecord::Base

	validates :nick, presence: true, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	#validates :role, presence: true, inclusion: { in: %w(mid offlane carry support)}

	validates :country, presence: true
	validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true
	validates :birth_date, presence: true

	has_secure_password

	has_many :memberships
	has_many :teams, through: :memberships

	has_and_belongs_to_many :roles

	def is_member?(team)
		memberships.find_by(team_id: team.id)
	end

	def plays_role?(role)
		roles.find_by(role_id: role.id)
	end

	def join!(team, role)
		memberships.create!(team_id: team.id, role_id: role.id)
	end

	def leave!(team)
		memberships.find_by(team_id: team.id).destroy!
	end

end
