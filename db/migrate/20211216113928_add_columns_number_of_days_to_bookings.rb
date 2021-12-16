class AddColumnsNumberOfDaysToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :number_of_days, :integer
  end
end
