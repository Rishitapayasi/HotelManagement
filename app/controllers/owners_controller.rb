class OwnersController < ApplicationController
  def my_hotel 
    hotel = @current_user.hotels
    if hotel.present?
      render json: hotel 
    else 
      render json: {message: "Sorry, you don't own any hotels"}, status: :not_found 
    end  
  end
end
