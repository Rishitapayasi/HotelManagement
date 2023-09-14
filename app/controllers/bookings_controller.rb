class BookingsController < ApplicationController
  before_action :set_bookings, only: [:destroy]
  load_and_authorize_resource
  
  def create
    @booking = @current_user.bookings.new(booking_params)
    if @booking.save
      render json: @booking, serializer: BookingSerializer
    else
      render json: { error: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    bookings = Booking.all
    
    render json: bookings
  end

  def my_booking
    render json: @current_user.bookings
  end

  def destroy
    if @booking
      booking = @booking.destroy
      render json: { message: "Booking deleted" }, status: :ok 
    end
  end

  private
  def booking_params
    params.permit(:name, :check_in_date, :check_out_date, :hotel_id, :room_id)
  end

  def set_bookings
    @booking = Booking.find_by(id: params[:id])
  end
end
