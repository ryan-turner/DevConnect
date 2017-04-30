class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :interest
      t.string :language1
      t.string :language2
      t.string :time1
      t.string :time2
      t.string :skill
      t.string :password_digest
      t.integer :groupid

      t.timestamps null: false
    end
  end
end
