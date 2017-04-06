class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :Class_Year
      t.string :Courses_Taken
      t.string :Days_Available
      t.string :Preffered_Programming_Languages
      t.string :Project_Interests
      t.integer :Groupid

      t.timestamps null: false
    end
  end
end
