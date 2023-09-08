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

  private
  def room_params
    params.permit(:room_no, :room_price, :hotel_id)
  end
end



