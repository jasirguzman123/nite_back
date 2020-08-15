class AddParticipantsNumberToEventParticipation < ActiveRecord::Migration[6.0]
  def change
    add_column :event_participations, :participants_number, :integer, default: 1
  end
end
