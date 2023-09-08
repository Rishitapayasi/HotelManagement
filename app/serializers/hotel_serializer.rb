class HotelSerializer < ActiveModel::Serializer
  attributes :name, :location, :status, :id, :owner

  has_many :rooms

  def owner 
    object.user.full_name
  end
   
 
end