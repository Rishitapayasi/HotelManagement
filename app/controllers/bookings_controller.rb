class BookingsController < ApplicationController
  before_action :set_bookings, only: [:destroy, :update, :edit]
  
  def index
    @bookings = current_user.bookings
  end

  def new 
    @booking = current_user.bookings.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
  
    if @booking.save
   
     redirect_to root_path
    else
      render json: { error: @booking.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def edit 
  end

  def update
    respond_to do |format|
      debugger
      if @booking.update(update_booking)
    
        format.html { redirect_to root_url, notice: "booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @booking
      booking = @booking.destroy
      redirect_to booking_path
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:name, :check_in_date, :check_out_date).merge(hotel_id: params[:booking][:hotel_id].to_i,room_id: params[:booking][:room_id].to_i)
  end

  def set_bookings
    @booking = current_user.bookings.find_by(id: params[:id])
  end

  def update_booking
    params.require(:booking).permit(:name, :check_in_date, :check_out_date)
  end

end
