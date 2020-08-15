class AddVoucherCodeToEventParticipation < ActiveRecord::Migration[6.0]
  def change
    add_column :event_participations, :voucher_code, :string
  end
end
