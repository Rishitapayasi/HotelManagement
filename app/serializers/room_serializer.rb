class RoomSerializer < ActiveModel::Serializer
  attributes :room_no, :room_price, :hotel_id, :hotel

  def hotel
    object.hotel.name
  end
end
