class RoomsController < ApplicationController
  before_action :set_hotel, only: [:create]
  debugger
  def new 
    debugger
    @room = current_user.rooms.new
  end

  def create
    room = @current_user.rooms.new(room_params)
    if room.save
      redirect_to root_path
    else
      render json: { error: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def room_params
    params.permit(:room_no, :room_price, :hotel_id)
  end

  def set_hotel 
    @hotel=current_user.hotels.find(params[:id])  
  end

end



