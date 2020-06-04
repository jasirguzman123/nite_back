class CreateUserFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :user_follows do |t|
      t.references :user
      t.integer :followee_id
      t.string :followee_type

      t.timestamps
    end
  end
end
