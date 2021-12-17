class Planet < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :available_places, presence: true, numericality: { greater_than: 0}
  validates :price_per_night, presence: true, numericality: { greater_than: 0}

  ACTIVITIES = [['Podracer'], ['Trek with Dewbak'], ['Creature Museum'], ['alactic Opera'], ['Wars']]
end
