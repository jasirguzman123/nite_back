class CreateLocalities < ActiveRecord::Migration[6.0]
  def change
    create_table :localities do |t|
      t.string :name
      t.float :price
      t.integer :event_id
      t.text :description
      t.timestamps
    end
  end
end
