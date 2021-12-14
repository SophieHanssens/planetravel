class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :planets

  validates :name, presence: true, uniqueness: true
  validates :phone_number, presence: true, numericality: true, length: { minimum: 8, maximum: 14}
end
