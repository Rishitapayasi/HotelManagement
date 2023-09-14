class BookingSerializer < ActiveModel::Serializer
  
attributes :check_in_date, :check_out_date, :room_id, :hotel
  
  def hotel
    object.hotel.name
  end 
end
 