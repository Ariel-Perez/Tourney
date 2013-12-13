class RenameNationality < ActiveRecord::Migration
  
  def up
    rename_column :players, :nationality, :country
  end

  def down
    rename_column :players, :country, :nationality
  end
end
