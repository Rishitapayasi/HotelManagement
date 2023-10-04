class RoomsController < ApplicationController
  def new 
    @room = current_user.rooms.new
  end

  def create
    room = @current_user.rooms.new(room_params)
    if room.save
      redirect_to root_path
    else
      render json: { error: room.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    # @room = current_user.rooms.find(params[:id]) 
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        debugger
        format.html { redirect_to root_url, notice: "room was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  def room_params
    params.require(:room).permit(:room_no, :room_price, :hotel_id)
  end

  
end



