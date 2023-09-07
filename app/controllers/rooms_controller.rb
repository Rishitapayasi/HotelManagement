class RoomsController < ApplicationController
  skip_before_action :check_customer

  def create
    room = Room.new(room_params)
    if room.save
      render json: room, serializer: RoomSerializer
    else
      render json: { data: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # def room_list_by_hotel_id
  #   rooms = Room.where(hotel_id: params[:hotel_id])
  #   render json: rooms, status: :ok
  # end

  private

  def room_params
    params.permit(:room_no, :room_price, :hotel_id)
  end
end


# def create
#   location = params[:location]
#   if location.blank?
#     render json: {error: "Location can't be blank"}, status: :unprocessable_entity 
#     return 
#   end
#   hotel = @current_user.hotels.find_by(location: location)
#   if hotel.nil? 
#     render json: {error: "no hotel found at the specified location"}, status: :not_found 
#   else 
#   room = hotel.rooms.new(room_params)
#   if room.save
#     render json: room, serializer: RoomSerializer
#   else
#     render json: { data: room.errors.full_messages }, status: :unprocessable_entity
#   end
#   end
# end 
