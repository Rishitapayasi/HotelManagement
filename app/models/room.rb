class Room < ApplicationRecord
  belongs_to :hotel
  has_many :bookings
  belongs_to :user

  validates :room_no, presence: true, numericality: { greater_then: 0 }
  validates :room_price, presence: true, numericality: { greater_then: 100 }


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "hotel_id", "id", "room_no", "room_price", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["bookings", "hotel", "user"]
  end 

end
