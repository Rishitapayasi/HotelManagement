class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings, dependent: :destroy
  
  validates :room_no, presence: true, numericality: { greater_then: 0 }, uniqueness: { scope: :hotel_id }
  validates :room_price, presence: true, numericality: { greater_then: 0 }
end
