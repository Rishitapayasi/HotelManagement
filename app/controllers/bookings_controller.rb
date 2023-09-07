class BookingsController < ApplicationController
  skip_before_action :check_owner
  before_action :set_bookings, only: [:show, :destroy]

	def create
		@booking = @current_user.bookings.new(booking_params)
    if @booking.save
      render json: @booking, serializer: BookingSerializer
		else
      render json: { error: @booking.errors.full_messages }, status: :unprocessable_entity
			return
		end		
	end
	
  def index
		bookings = Booking.all

		render json: bookings, status: :ok
 	end

  def show
		return render json: @booking, status: :ok 
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
		unless @booking
			render json: { message: 'Booking not found' }, status: :not_found
		end
	end
end
