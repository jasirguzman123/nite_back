class RemoveLocalityReferenceFromParticipations < ActiveRecord::Migration[6.0]
  def change
    remove_reference :event_participations, :locality
    add_reference :event_participations, :locality, foreign_key: true, null: true
  end
end
