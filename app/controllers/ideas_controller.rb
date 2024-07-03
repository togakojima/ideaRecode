class IdeasController < ApplicationController
  def index
    @rooms = Room.all
    @idea = Idea.new
    @room = Room.find(params[:room_id])
    @ideas = @room.ideas.includes(:user)
  end

  def create
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
