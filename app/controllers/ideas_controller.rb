class IdeasController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy]

  def index
    @room = Room.find_by(id: params[:room_id])
    if @room.nil?
      redirect_to root_path
    else
      @rooms = current_user.rooms
      @idea = Idea.new
      @ideas = @room.ideas.includes(:user)
    end
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

  def destroy
    @idea = Idea.find(params[:id])
    @room = @idea.room
    @idea.destroy
    redirect_to room_ideas_path(@room)
  end

  private

  def idea_params
    params.require(:idea).permit(:content).merge(user_id: current_user.id)
  end
end
