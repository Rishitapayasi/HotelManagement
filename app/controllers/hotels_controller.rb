class HotelsController < ApplicationController 
  
  before_action :set_params, only: [:update, :destroy, :edit]
  def index 
    @hotels = Hotel.all

    if params[:location]
      @hotels = hotels.where('location LIKE  ?', "%#{params[:location]}%")
    elsif params[:name]
      @hotels = hotels.where('name LIKE ?', "%#{ params[:name]}%")
    end 
  end

  def show
    if current_user.type == 'Owner'
      @hotels = current_user.hotels.find(params[:id]) 
    else
      @hotels = Hotel.find(params[:id])
    end
  end

  def new 
    @hotels = current_user.hotels.new
    render
  end
  
  def create
    hotel = current_user.hotels.new(hotel_params)

    if hotel.save
      redirect_to root_path    
    else
      render json: { error: hotel.errors.full_messages }, status: :unprocessable_entity
    end
  end 

  def edit 
  end

  def update
    respond_to do |format|
      if @hotels.update(update_hotel)
        # debugger
        format.html { redirect_to root_url, notice: "hotel was successfully updated." }
        format.json { render :show, status: :ok, location: @hotels }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotels.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @hotels.destroy
      redirect_to root_path    
    end
  end

  private

  def hotel_params
    params.require(:hotel).permit(:name, :location, :status, images: [])
  end

  def set_params
    @hotels = @current_user.hotels.find(params[:id])
  end 

  def update_hotel
    params.require(:hotel).permit(:name, :location, :status)
  end


end 

