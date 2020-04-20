class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :address
      t.string :owner_type
      t.integer :owner_id
      t.datetime :starting_hour
      t.datetime :ending_hour
      t.string :description
      
      t.timestamps
    end
  end
end
