#this is the create users migration class
#This allows the migration to occur so that the server that runs the
#project has the database and its contents
class CreateUsers < ActiveRecord::Migration
  #This function creates the users table in the database and its attributes
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
