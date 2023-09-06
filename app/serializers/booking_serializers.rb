class BookingSerializer < ActiveModel::Serializer
  attributes :name, :check_in_date, :check_out_date :hotel_id, :room_id :hotel
  
  def hotel
    object.room.hotel.name
  end
end