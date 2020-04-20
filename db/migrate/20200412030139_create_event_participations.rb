class CreateEventParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :event_participations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :locality, null: false, foreign_key: true
      t.integer :nature, default: 0
       
      t.timestamps
    end
  end
end
