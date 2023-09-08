class OwnersController < ApplicationController
  skip_before_action :check_customer 
	 
	def user_hotel 
		full_name = params[:owner_name]
		hotel = @current_user.hotels.find_by(full_name) 
		if hotel
			render json: hotel 
		else 
			render json: {message: "Sorry, you don't own any hotels"}, status: :not_found 
		end  
  end
end
