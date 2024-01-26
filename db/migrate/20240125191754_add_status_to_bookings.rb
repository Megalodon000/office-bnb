class AddStatusToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :status, :integer, default: 0
    add_index :bookings, :status
    reversible do |dir|
      dir.up { Booking.update_all(status: 0) } # Set existing records to the default value
    end
    change_column :bookings, :status, :integer, null: false
  end
end
