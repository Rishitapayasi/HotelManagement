class HotelSerializer < ActiveModel::Serializer
  attributes :name, :location, :status, :id, :owner, :room

  def room
    object.rooms
  end

  def owner 
    object.user.full_name
  end

end