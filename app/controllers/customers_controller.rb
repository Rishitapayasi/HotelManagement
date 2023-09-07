class CustomersController < ApplicationController
  skip_before_action :check_owner

  def index 
    if params[:status]
      hotels = Hotel.where(status: 'open')
      render json: hotels
    else
      redirect_to '/hotels'
    end
  end
