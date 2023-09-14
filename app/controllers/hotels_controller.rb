class HotelsController < ApplicationController
  before_action :set_params, only: [:show, :update, :destroy]
 
  load_and_authorize_resource

  def index 
    hotels = Hotel.all

    if params[:location]
      hotels = hotels.where('location LIKE  ?', "%#{params[:location]}%")
    elsif params[:name]
      hotels = hotels.where('name LIKE ?', "%#{ params[:name]}%")
    end 

    render json: hotels.page(params[:page])
  end

  def show
    render json: hotel, serializer: HotelSerializer
  end

  def create
    hotel = @current_user.hotels.new(hotel_params)

    if hotel.save
      render json: hotel, serializer: HotelSerializer 
    else
      render json: { error: hotel.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @hotel.update(update_hotel)
      render json: { message: 'hotel updated' }
    else
      render json: { errors: @hotel.errors.full_messages }
    end
  end 

  def destroy
    if @hotel
      @hotel.destroy
      render json: { message: "Hotel Deleted !!!" }, status: :ok
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :location, :status, images: [])
  end

  def set_params
    @hotel = @current_user.hotels.find(params[:id])
  end 

  def update_hotel
    params.permit(:name, :location, :status)
  end
end 

