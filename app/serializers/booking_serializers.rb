class BookingSerializer < ActiveModel::Serializer
  attributes :room_no, :check_in_date, :check_out_date :hotel_id, :room_id :hotel, room_number
  
  def room_number
    object.room.room_number
  end
  
  def hotel
    object.room.hotel.name
  end
end