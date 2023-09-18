class RoomsController < ApplicationController
  load_and_authorize_resource
  def create
    room = @current_user.rooms.new(room_params)
    if room.save
      render json: room, serializer: RoomSerializer
    else
      render json: { error: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def room_params
    params.permit(:room_no, :room_price, :hotel_id)
  end 

  def verify_hotel_owner 
    @current_user.hotels == @current_user.id 
  end
end



