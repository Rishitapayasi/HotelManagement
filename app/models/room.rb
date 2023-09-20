class Room < ApplicationRecord
  belongs_to :hotel
  belongs_to :user
  has_many :bookings, dependent: :destroy
  
  validates :room_no, presence: true, numericality: { greater_then: 0 }, uniqueness: { scope: :hotel_id }
  validates :room_price, presence: true, numericality: { greater_then: 0 }


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "hotel_id", "id", "room_no", "room_price", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["bookings", "hotel", "user"]
  end 

end
