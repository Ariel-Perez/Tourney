class AddRequirementsToVacancies < ActiveRecord::Migration
  def change
    add_column :vacancies, :requirements, :text
  end
end
