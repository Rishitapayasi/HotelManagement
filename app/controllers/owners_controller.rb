class OwnersController < ApplicationController
  skip_before_action :check_customer 
	 
	def user_hotel 
		hotel = @current_user.hotels
		if hotel.present?
			render json: hotel 
		else 
			render json: {message: "Sorry, you don't own any hotels"}, status: :not_found 
		end  
  end
end
