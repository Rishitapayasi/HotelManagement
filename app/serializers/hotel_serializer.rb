class HotelSerializer < ActiveModel::Serializer
  attributes :name, :location, :status, :id, :owner, :images

  has_many :rooms

  def owner 
    object.user.full_name
  end 
  
  def images 
    object.images.map do |data|
      data.url
    end
  end
end