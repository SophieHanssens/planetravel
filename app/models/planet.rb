class Planet < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :addresse, presence: true
  validates :available_places, presence: true
  validates :available_places, numericality: { greater_than: 0}
  validates :price_per_night, presence: true
  validates :price_per_night, numericality: { greater_than: 0}

end
