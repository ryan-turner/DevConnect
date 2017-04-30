class CreateGroups < ActiveRecord::Migration
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


