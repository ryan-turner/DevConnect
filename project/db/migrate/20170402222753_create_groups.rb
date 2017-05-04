#This is the create groups migration class
#This allows the migration to occur so that the server that runs the
#project has the database and its contents
class CreateGroups < ActiveRecord::Migration
  #This function creates the groups table in the database and its attributes
  def change
    create_table :groups do |t|
      t.string :name
      t.string :interest
      t.string :language_preference
      t.string :availability
      t.integer :group_id
      t.timestamps null: false
    end
  end
end
