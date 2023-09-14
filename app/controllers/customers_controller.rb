class CustomersController < ApplicationController
  def available_hotel 
    if params[:status]
      hotels = Hotel.where(status: 'open')
      render json: hotels
    else
      render json: Hotel.all
    end
  end 
end 

