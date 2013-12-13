class AddVacancyIdToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :vacancy_id, :int
  end
end
