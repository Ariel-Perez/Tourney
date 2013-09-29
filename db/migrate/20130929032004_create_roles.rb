class CreateRoles < ActiveRecord::Migration
  def change
    puts Role.table_exists?
    unless Role.table_exists? 
      create_table :roles do |t|
        t.string :name

        t.timestamps
      end
	end
  end
end
