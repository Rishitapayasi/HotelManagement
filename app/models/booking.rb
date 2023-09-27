class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :hotel

  validates :check_in_date, :check_out_date, presence: true
  validate :unique_room_booking

  private
  
  def unique_room_booking 
    existing_booking = Booking.find_by(room: room_id, check_in_date: check_in_date, hotel_id: hotel_id ) 
    if existing_booking.present?
      errors.add(:base, "this room is already booked!!")
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["check_in_date", "check_out_date", "created_at", "hotel_id", "id", "name", "room_id", "updated_at", "user_id"]
  end 
end
