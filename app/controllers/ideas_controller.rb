class IdeasController < ApplicationController
  def index
    @room = Room.find(params[:room_id])
    @rooms = current_user.rooms
    @idea = Idea.new
    @ideas = @room.ideas.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @idea = @room.ideas.new(idea_params)
    @rooms = current_user.rooms
    if @idea.save
      redirect_to room_ideas_path(@room)
    else
      @ideas = @room.ideas.includes(:user)
      render :index, status: :unprocessable_entity
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:content).merge(user_id: current_user.id)
  end
end
