class CustomersController < ApplicationController
  load_and_authorize_resource
  def available_hotels
    if params[:status]
      hotels = Hotel.where(status: 'open')
      render json: hotels
    else
      render json: Hotel.all
    end
  end
end

