class OwnersController < ApplicationController
  skip_before_action :check_customer 
	 
	def particular_hotel 
		hotel_id = params[:hotel_id]
		hotel = @current_user.hotels.find_by(hotel_id) 
		if hotel
			render json: {message: "thers is no hotel with #{hotel_id}"}, status: :not_found 
		else 
			render json: hotel.rooms 
		end  
  end
end
