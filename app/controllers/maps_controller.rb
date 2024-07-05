class MapsController < ApplicationController
  def index
    @rooms = current_user.rooms
  end
end
