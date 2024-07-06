class MapsController < ApplicationController
  def index
    @rooms = current_user.rooms
    @maps = current_user.maps
  end

  def new
    @rooms = current_user.rooms
    @map = Map.new
  end

  def create
    @map = current_user.maps.build(map_params)
    if @map.save
      redirect_to maps_path
    else
      render :new
    end
  end

  def show
    @map = Map.find(params[:id])
  end

  private

  def map_params
    params.require(:map).permit(:title, :info, :latitude, :longitude).merge(user_id: current_user.id)
  end
end
