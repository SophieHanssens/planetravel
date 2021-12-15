class AddNumberOfPlacesToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :number_of_places, :integer
  end
end
