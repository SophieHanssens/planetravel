class Booking < ApplicationRecord
  belongs_to :planet
  belongs_to :user

  @status = ['Accepted', 'Declined', 'pending']

  validates :status, inclusion: { in: @status }
#  validates :total_price, numericality: true
end
