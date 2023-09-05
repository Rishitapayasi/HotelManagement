class HotelSerializer < ActiveModel::Serializer
  attributes :name, :location, :status
end