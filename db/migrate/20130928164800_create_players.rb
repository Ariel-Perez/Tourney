class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :nick
      t.string :first_name
      t.string :last_name
      t.string :role
      t.string :nationality
      t.date :birth_date
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
