class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.integer :team_id
      t.integer :role_id
      t.timestamps
    end
  end
end
