class RoomsController < ApplicationController
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def room_params
    params.require(:room).permit(:name).merge(user_id: current_user.id)
  end
end
