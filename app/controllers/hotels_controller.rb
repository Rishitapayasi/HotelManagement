class HotelsController < ApplicationController
  skip_before_action :check_customer
  skip_before_action :check_owner, only: [:index]
  before_action :set_params, only: [:show, :destroy]
   
  def index 
    hotels = Hotel.all

    if params[:location]
      hotels = Hotel.where('location LIKE  ?', "%#{params[:location]}%")
		elsif params[:name]
      hotels = Hotel.where('name LIKE ?', "%#{ params[:name]}%")
    end 

    render json: hotels.page(params[:page]).per(3) 
  end

  def show
    hotel = @current_user.hotels
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
    @hotel = @current_user.hotels.find(params[:id])

    if @hotel.update(hotel_params)
      render json: { message: 'hotel updated' }
    else
      render json: { errors: @hotel.errors.full_messages }
    end
  end
  	
	def destroy

		if @hotel
			@hotel.destroy
			render json: { message: "Hotel Deleted !!!" }, status: :ok
    else
      render json: { errors: @hotel.errors.full_messages }
    end
    
	end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :location, :status, images: [])
  end

  def set_params
    @hotel = @current_user.hotels.find(params[:id])
  end
end 

