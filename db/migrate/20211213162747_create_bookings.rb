class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :arrival_date
      t.date :departure_date
      t.integer :total_price
      t.string :status
      t.references :planet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
